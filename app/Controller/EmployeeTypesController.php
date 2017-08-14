<?php
App::uses('AppController', 'Controller');
/**
 * EmployeeTypes Controller
 *
 * @property EmployeeType $EmployeeType
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class EmployeeTypesController extends AppController {

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
	public function index() {
		$this->set('page_title','Employee type List');
		$this->EmployeeType->recursive = 0;
		$this->paginate = array('order' => array('EmployeeType.id' => 'DESC'));
		$this->set('employeeTypes', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->set('page_title','Employee type Details');
		if (!$this->EmployeeType->exists($id)) {
			throw new NotFoundException(__('Invalid employee type'));
		}
		$options = array('conditions' => array('EmployeeType.' . $this->EmployeeType->primaryKey => $id));
		$this->set('employeeType', $this->EmployeeType->find('first', $options));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		$this->set('page_title','Add Employee type');
		if ($this->request->is('post')) {
			$this->EmployeeType->create();
			$this->request->data['EmployeeType']['created_at'] = $this->current_datetime();
			$this->request->data['EmployeeType']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->EmployeeType->save($this->request->data)) {
				$this->Session->setFlash(__('The employee type has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The employee type could not be saved. Please, try again.'), 'flash/error');
			}
		}
	}

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
        $this->set('page_title','Edit Employee type');
		$this->EmployeeType->id = $id;
		if (!$this->EmployeeType->exists($id)) {
			throw new NotFoundException(__('Invalid employee type'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['EmployeeType']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->EmployeeType->save($this->request->data)) {
				$this->Session->setFlash(__('The employee type has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The employee type could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('EmployeeType.' . $this->EmployeeType->primaryKey => $id));
			$this->request->data = $this->EmployeeType->find('first', $options);
		}
	}

/**
 * delete method
 *
 * @throws NotFoundException
 * @throws MethodNotAllowedException
 * @param string $id
 * @return void
 */
	public function delete($id = null) {
		if (!$this->request->is('post')) {
			throw new MethodNotAllowedException();
		}
		$this->EmployeeType->id = $id;
		if (!$this->EmployeeType->exists()) {
			throw new NotFoundException(__('Invalid employee type'));
		}
		if ($this->EmployeeType->delete()) {
			$this->Session->setFlash(__('Employee type deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Employee type was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->set('page_title','Employee type List');
		$this->EmployeeType->recursive = 0;
		$this->paginate = array('order' => array('EmployeeType.id' => 'DESC'));
		$this->set('employeeTypes', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Employee type Details');
		if (!$this->EmployeeType->exists($id)) {
			throw new NotFoundException(__('Invalid employee type'));
		}
		$options = array('conditions' => array('EmployeeType.' . $this->EmployeeType->primaryKey => $id));
		$this->set('employeeType', $this->EmployeeType->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Employee type');
		if ($this->request->is('post')) {
			$this->EmployeeType->create();
			$this->request->data['EmployeeType']['created_at'] = $this->current_datetime();
			$this->request->data['EmployeeType']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->EmployeeType->save($this->request->data)) {
				$this->Session->setFlash(__('The employee type has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The employee type could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Employee type');
		$this->EmployeeType->id = $id;
		if (!$this->EmployeeType->exists($id)) {
			throw new NotFoundException(__('Invalid employee type'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['EmployeeType']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->EmployeeType->save($this->request->data)) {
				$this->Session->setFlash(__('The employee type has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The employee type could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('EmployeeType.' . $this->EmployeeType->primaryKey => $id));
			$this->request->data = $this->EmployeeType->find('first', $options);
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
		$this->EmployeeType->id = $id;
		if (!$this->EmployeeType->exists()) {
			throw new NotFoundException(__('Invalid employee type'));
		}
		if ($this->EmployeeType->delete()) {
			$this->Session->setFlash(__('Employee type deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Employee type was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
