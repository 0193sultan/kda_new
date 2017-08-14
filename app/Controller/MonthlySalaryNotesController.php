<?php
App::uses('AppController', 'Controller');
/**
 * MonthlySalaryNotes Controller
 *
 * @property MonthlySalaryNote $MonthlySalaryNote
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class MonthlySalaryNotesController extends AppController {

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

		$salary_id = $this->request->data('EmployeeSalarySheet_id');

		$bank_id = $this->request->data('bank_name');
		$fiscal_year_id = $this->request->data('fiscal_year');
		$month_id = $this->request->data('month_id');

		$this->loadModel('FiscalYear');
		$this->FiscalYear->recursive = -1;
		$fiscalyears = $this->FiscalYear->find('list');
		
		$fYear = $this->FiscalYear->find('all',array('conditions' => array('FiscalYear.id' =>$fiscal_year_id)));

		$this->loadModel('Month');
		$months = $this->Month->find('list');
	

		$this->loadModel('BankInfo');
		$banks = $this->BankInfo->find('list');

		############################################################
		############Search data in salary note
		############################################################
		$save_data_ready_for_print = $this->MonthlySalaryNote->find('all', array('conditions' => array('MonthlySalaryNote.fiscal_year_id' => $fiscal_year_id, 'AND' => array('MonthlySalaryNote.month_id' => $month_id, 'AND' => array('MonthlySalaryNote.bank_info_id' => $bank_id)))));

		if(!empty($save_data_ready_for_print))
		{
			$this->set(compact('save_data_ready_for_print','fiscalyears', 'months', 'banks'));
		}

		############################################################
		############Search data in salary note end
		############################################################

		else
		{

		$conditions = array();

		if($bank_id != 0)
			{
				$conditions['Employee.bank_info_id'] = $bank_id;
			}

		$conditions['EmployeeSalarySheet.fiscal_year_id'] = $fiscal_year_id;
		$conditions['EmployeeSalarySheet.month_id'] = $month_id;

		$this->loadModel('EmployeeSalarySheet');
		$this->EmployeeSalarySheet->recursive = 2;

		//$res = $this->EmployeeSalarySheet->find('all');
		$res = $this->EmployeeSalarySheet->find('all', array('conditions' => array('Employee.bank_info_id'=>$bank_id, 'AND' => array('EmployeeSalarySheet.fiscal_year_id' =>$fiscal_year_id), 'AND' => array('EmployeeSalarySheet.month_id' => $month_id) )));

		$this->set(compact('res', 'fiscalyears', 'months', 'banks'));
	}
}

	public function admin_print_view()
	{
		$salary_id = $this->request->data('EmployeeSalarySheet_id');

		$bank_id = $this->request->data('bank_name');
		$fiscal_year_id = $this->request->data('fiscal_year');
		$month_id = $this->request->data('month_id');

		$this->loadModel('EmployeeSalarySheet');
		$this->EmployeeSalarySheet->recursive = 2;


		#################################################################################
		####
		####Insert data into salary notes start
		####
		##################################################################################
		if(!empty($salary_id))
		{
			foreach ($salary_id as  $id) 
			{
				
				$insert = $this->EmployeeSalarySheet->find('all', array('conditions' => array('EmployeeSalarySheet.id' => $id)));

				$data['emp_name'] = $insert[0]['Employee']['name'];
				$data['emp_id'] = $insert[0]['Employee']['employeeID'];
				$data['designation'] = $insert[0]['Employee']['Designation']['name'];;
				$data['account_no'] = $insert[0]['Employee']['account_number'];
				$data['net_pay'] = $insert[0]['EmployeeSalarySheet']['total_payable'];
				$data['month_id'] = $insert[0]['EmployeeSalarySheet']['month_id'];
				$data['fiscal_year_id'] = $insert[0]['EmployeeSalarySheet']['fiscal_year_id'];
				$data['bank_info_id'] = $insert[0]['Employee']['bank_info_id'];
				$data['date'] = $this->current_datetime("yy-m-d h:m:s");

				$this->MonthlySalaryNote->create();
				$this->MonthlySalaryNote->save($data);

				$save_data_ready_for_print = $this->MonthlySalaryNote->find('all', array('conditions' => array('MonthlySalaryNote.fiscal_year_id' => $data['fiscal_year_id'], 'AND' => array('MonthlySalaryNote.month_id' => $data['month_id']))));

				$this->set(compact('save_data_ready_for_print'));
				
			}
		}
		#################################################################################
		####
		####Insert data into salary notes End
		####
		##################################################################################
	}



























/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Monthly salary note Details');
		if (!$this->MonthlySalaryNote->exists($id)) {
			throw new NotFoundException(__('Invalid monthly salary note'));
		}
		$options = array('conditions' => array('MonthlySalaryNote.' . $this->MonthlySalaryNote->primaryKey => $id));
		$this->set('monthlySalaryNote', $this->MonthlySalaryNote->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Monthly salary note');
		if ($this->request->is('post')) {
			$this->MonthlySalaryNote->create();
			$this->request->data['MonthlySalaryNote']['created_at'] = $this->current_datetime();
			$this->request->data['MonthlySalaryNote']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->MonthlySalaryNote->save($this->request->data)) {
				$this->Session->setFlash(__('The monthly salary note has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The monthly salary note could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$months = $this->MonthlySalaryNote->Month->find('list');
		$fiscalYears = $this->MonthlySalaryNote->FiscalYear->find('list');
		$bankInfos = $this->MonthlySalaryNote->BankInfo->find('list');
		$this->set(compact('months', 'fiscalYears', 'bankInfos'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Monthly salary note');
		$this->MonthlySalaryNote->id = $id;
		if (!$this->MonthlySalaryNote->exists($id)) {
			throw new NotFoundException(__('Invalid monthly salary note'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['MonthlySalaryNote']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->MonthlySalaryNote->save($this->request->data)) {
				$this->Session->setFlash(__('The monthly salary note has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The monthly salary note could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('MonthlySalaryNote.' . $this->MonthlySalaryNote->primaryKey => $id));
			$this->request->data = $this->MonthlySalaryNote->find('first', $options);
		}
		$months = $this->MonthlySalaryNote->Month->find('list');
		$fiscalYears = $this->MonthlySalaryNote->FiscalYear->find('list');
		$bankInfos = $this->MonthlySalaryNote->BankInfo->find('list');
		$this->set(compact('months', 'fiscalYears', 'bankInfos'));
	}

/**
 * admin_delete method
 *
 * @throws NotFoundException
 * @throws MethodNotAllowedException
 * @param string $id
 * @return void
 */
	public function admin_delete($id = null) {
		if (!$this->request->is('post')) {
			throw new MethodNotAllowedException();
		}
		$this->MonthlySalaryNote->id = $id;
		if (!$this->MonthlySalaryNote->exists()) {
			throw new NotFoundException(__('Invalid monthly salary note'));
		}
		if ($this->MonthlySalaryNote->delete()) {
			$this->Session->setFlash(__('Monthly salary note deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Monthly salary note was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
