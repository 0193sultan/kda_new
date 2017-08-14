<?php
App::uses('AppController', 'Controller');
/**
 * LoanTypes Controller
 *
 * @property LoanType $LoanType
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class LoanTypesController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');

/**
 * index method
 *
 * @return void
 */
/*	public function index() {
		$this->set('page_title','Loan type List');
		$this->LoanType->recursive = 0;
		$this->paginate = array('order' => array('LoanType.id' => 'DESC'));
		$this->set('loanTypes', $this->paginate());
	}*/

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
/*	public function view($id = null) {
		$this->set('page_title','Loan type Details');
		if (!$this->LoanType->exists($id)) {
			throw new NotFoundException(__('Invalid loan type'));
		}
		$options = array('conditions' => array('LoanType.' . $this->LoanType->primaryKey => $id));
		$this->set('loanType', $this->LoanType->find('first', $options));
	}*/

/**
 * add method
 *
 * @return void
 */
	/*public function add() {
		$this->set('page_title','Add Loan type');
		if ($this->request->is('post')) {
			$this->LoanType->create();
			$this->request->data['LoanType']['created_at'] = $this->current_datetime();
			$this->request->data['LoanType']['created_by'] = $this->UserAuth->getUserId();

			$this->request->data['LoanType']['created_date'] = date ("Y-m-d", strtotime($this->request->data['LoanType']['created_date'])); #add by arafat	

			if ($this->LoanType->save($this->request->data)) {
				$this->Session->setFlash(__('The loan type has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The loan type could not be saved. Please, try again.'), 'flash/error');
			}
		}
	}*/

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	/*public function edit($id = null) {
        $this->set('page_title','Edit Loan type');
		$this->LoanType->id = $id;
		if (!$this->LoanType->exists($id)) {
			throw new NotFoundException(__('Invalid loan type'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['LoanType']['updated_by'] = $this->UserAuth->getUserId();

			$this->request->data['LoanType']['created_date'] = date ("Y-m-d", strtotime($this->request->data['LoanType']['created_date'])); #add by arafat

			if ($this->LoanType->save($this->request->data)) {
				$this->Session->setFlash(__('The loan type has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The loan type could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('LoanType.' . $this->LoanType->primaryKey => $id));
			$this->request->data = $this->LoanType->find('first', $options);
		}
	}*/

/**
 * delete method
 *
 * @throws NotFoundException
 * @throws MethodNotAllowedException
 * @param string $id
 * @return void
 */
	/*public function delete($id = null) {
		if (!$this->request->is('post')) {
			throw new MethodNotAllowedException();
		}
		$this->LoanType->id = $id;
		if (!$this->LoanType->exists()) {
			throw new NotFoundException(__('Invalid loan type'));
		}
		if ($this->LoanType->delete()) {
			$this->Session->setFlash(__('Loan type deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Loan type was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}*/
/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->set('page_title','Loan type List');
		$this->LoanType->recursive = 0;
		$this->paginate = array('order' => array('LoanType.id' => 'DESC'));
		$this->set('loanTypes', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Loan type Details');
		if (!$this->LoanType->exists($id)) {
			throw new NotFoundException(__('Invalid loan type'));
		}
		$options = array('conditions' => array('LoanType.' . $this->LoanType->primaryKey => $id));
		$this->set('loanType', $this->LoanType->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Loan type');
		if ($this->request->is('post')) {
			$this->LoanType->create();
			$this->request->data['LoanType']['created_at'] = $this->current_datetime();
			$this->request->data['LoanType']['created_by'] = $this->UserAuth->getUserId();	
			$this->request->data['LoanType']['created_date'] = date ("Y-m-d", strtotime($this->request->data['LoanType']['created_date'])); #add by arafat		
			if ($this->LoanType->save($this->request->data)) {
				$this->Session->setFlash(__('The loan type has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The loan type could not be saved. Please, try again.'), 'flash/error');
			}
		}
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Loan type');
		$this->LoanType->id = $id;
		if (!$this->LoanType->exists($id)) {
			throw new NotFoundException(__('Invalid loan type'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['LoanType']['updated_by'] = $this->UserAuth->getUserId();
			$this->request->data['LoanType']['created_date'] = date ("Y-m-d", strtotime($this->request->data['LoanType']['created_date'])); #add by arafat
			if ($this->LoanType->save($this->request->data)) {
				$this->Session->setFlash(__('The loan type has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The loan type could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('LoanType.' . $this->LoanType->primaryKey => $id));
			$this->request->data = $this->LoanType->find('first', $options);
		}
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
		$this->LoanType->id = $id;
		if (!$this->LoanType->exists()) {
			throw new NotFoundException(__('Invalid loan type'));
		}
		if ($this->LoanType->delete()) {
			$this->Session->setFlash(__('Loan type deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Loan type was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
