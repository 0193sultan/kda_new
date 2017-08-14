<?php
App::uses('AppController', 'Controller');
/**
 * BankInfos Controller
 *
 * @property BankInfo $BankInfo
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class InstallmentReleasesController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {

		#############################################################################
		####### Form data 
		#############################################################################
		
		$this->loadModel('Department');
		$Department = $this->Department->find('list');

		$this->loadModel('Loan');
		$Loan = $this->Loan->find('list', array('conditions' => array('OR' => array('Loan.name' => 'Home Repair' ,'OR' => array('Loan.name' => 'Home Loan') ))));

		#############################################################################
		####### Form data end
		#############################################################################

		#############################################################################
		####### Received Form data Start
		#############################################################################
		
		$this->loadModel('EmployeeLoan');
		$this->EmployeeLoan->recursive = 2;

		if($this->request->data('department_id') != 0)
		{
			$query = array('Employee.department_id' => $this->request->data('department_id'), 'AND' => array('EmployeeLoan.loan_id' => $this->request->data('loan_id')));
		}

		else
		{
			$_SESSION['department'] = $this->request->data('department_id');
			$query['EmployeeLoan.loan_id'] = $this->request->data('loan_id');
		}

		$res = $this->EmployeeLoan->find('all', array('conditions' => $query));

		#############################################################################
		####### Receive Form data  end
		#############################################################################


		$this->set(compact('Department','Loan', 'res'), 'department_id', $this->request->data('department_id'));
	}

	public function admin_installment_release($id = null)
	{
		/*if(empty($id))
		{
			$this->redirect('index');
		}*/
		###########################################################
		########Show form data start
		###########################################################

		$info =  $this->__employeeLoan_search($id);
		$this->set(compact('info'));


		###########################################################
		########Show form data end
		###########################################################

		###########################################################
		########Submitted form data start
		###########################################################

		if ($this->request->is('post') || $this->request->is('put'))
		{
			$install_release = $this->__installment_release_check($this->request->data('id'));


			if($this->request->data('installment_release_no') == 2 && !empty($install_release['2nd'][0]['EmployeeLoan']['second_installment_amount']))
			{
				$this->Session->setFlash(__('Second Installment already release'), 'flash/error');
				$this->redirect(array('action' => 'index'));
				
			}

			else if($this->request->data('installment_release_no') == 3 && !empty($install_release['3rd'][0]['EmployeeLoan']['second_installment_amount']))
			{
				$this->Session->setFlash(__('Third Installment already release'), 'flash/error');
				$this->redirect(array('action' => 'index'));
			}


			if($this->request->data('installment_release_no') == 2)
			{
				$data['second_installment_amount'] = $this->request->data('installment_amount');
				$data['second_installment_date'] = date ("Y-m-d", strtotime($this->request->data('installment_date')));
			}
			else if($this->request->data('installment_release_no') == 3)
			{
				$data['third_installment_amount'] = $this->request->data('installment_amount');
				$data['third_installment_date'] = date ("Y-m-d", strtotime($this->request->data('installment_date')));
			}

			$this->loadModel('EmployeeLoan');
			$this->EmployeeLoan->id = $this->request->data('id');

			if (!$this->EmployeeLoan->exists( $this->request->data('id'))) {
				throw new NotFoundException(__('Invalid EmployeeLoan info'));
			}

			$this->request->data['EmployeeLoan']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->EmployeeLoan->save($data)) {
				$this->Session->setFlash(__('Installment release successfull'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('Installment Failed, try again.'), 'flash/error');
			}
		}



		###########################################################
		########Submitted Form data End
		###########################################################
	}

	private function __employeeLoan_search($id =null)
	{
		$this->loadModel('EmployeeLoan');
		$this->EmployeeLoan->recursive = 2;

		$info = $this->EmployeeLoan->find('all', array('conditions' => array('EmployeeLoan.id' => $id)));
		return $info;
	}

	private function __installment_release_check($id = null)
	{
		$this->loadModel('EmployeeLoan');
		$ins_release['2nd'] = $this->EmployeeLoan->find('all', array('fields' => array('second_installment_amount'), 'conditions' => array('EmployeeLoan.id' => $id)));
		$ins_release['3rd'] = $this->EmployeeLoan->find('all', array('fields' => array('third_installment_amount'), 'conditions' => array('EmployeeLoan.id' => $id)));

		return $ins_release;
	}

}