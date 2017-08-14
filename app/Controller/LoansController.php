<?php
App::uses('AppController', 'Controller');
/**
 * Loans Controller
 *
 * @property Loan $Loan
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class LoansController extends AppController {

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
		$this->set('page_title','Loan List');
		$this->Loan->recursive = 0;
		$this->paginate = array('order' => array('Loan.id' => 'DESC'));
		$this->set('loans', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Loan Details');
		if (!$this->Loan->exists($id)) {
			throw new NotFoundException(__('Invalid loan'));
		}
		$options = array('conditions' => array('Loan.' . $this->Loan->primaryKey => $id));
		$this->set('loan', $this->Loan->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Loan');
		if ($this->request->is('post')) {
			$this->Loan->create();
			$this->request->data['Loan']['created_at'] = $this->current_datetime();
			$this->request->data['Loan']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->Loan->save($this->request->data)) {
				$this->Session->setFlash(__('The loan has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The loan could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$loanTypes = $this->Loan->LoanType->find('list');
		$this->set(compact('loanTypes'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Loan');
		$this->Loan->id = $id;
		if (!$this->Loan->exists($id)) {
			throw new NotFoundException(__('Invalid loan'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['Loan']['updated_by'] = $this->UserAuth->getUserId();
		/*	echo "<pre>";
			print_r($this->request->data);
			exit();*/
			if ($this->Loan->save($this->request->data)) {
				$this->Session->setFlash(__('The loan has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The loan could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('Loan.' . $this->Loan->primaryKey => $id));
			$this->request->data = $this->Loan->find('first', $options);
		}
		$loanTypes = $this->Loan->LoanType->find('list');
		$this->set(compact('loanTypes'));
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
		$this->Loan->id = $id;
		if (!$this->Loan->exists()) {
			throw new NotFoundException(__('Invalid loan'));
		}
		if ($this->Loan->delete()) {
			$this->Session->setFlash(__('Loan deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Loan was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_loan_name_search ()
	{
		if($this->request->is('post'))
		{
			$query =  $this->request->data('loan_name');

			$this->Loan->recursive = 1; 
			$res = $this->Loan->find('all', array('conditions'=>array('Loan.name LIKE'=>"%$query%")));
			//echo "<pre>";
			//print_r($res);
			$this->set(compact('res'));

			$this->Loan->recursive = 0;
			$this->paginate = array('order' => array('Loan.id' => 'DESC'));
			$this->set('loans', $this->paginate());
		}

		//$this->autoRender =  false;
	}
}
