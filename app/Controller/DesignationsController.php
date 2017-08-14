<?php
App::uses('AppController', 'Controller');
/**
 * Designations Controller
 *
 * @property Designation $Designation
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class DesignationsController extends AppController {

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
		$this->set('page_title','Designation List');
		$this->Designation->recursive = 0;
		$this->paginate = array('order' => array('Designation.id' => 'DESC'));
		$this->set('designations', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->set('page_title','Designation Details');
		if (!$this->Designation->exists($id)) {
			throw new NotFoundException(__('Invalid designation'));
		}
		$options = array('conditions' => array('Designation.' . $this->Designation->primaryKey => $id));
		$this->set('designation', $this->Designation->find('first', $options));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		$this->set('page_title','Add Designation');
		if ($this->request->is('post')) {
			$this->Designation->create();
			$this->request->data['Designation']['created_at'] = $this->current_datetime();
			$this->request->data['Designation']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->Designation->save($this->request->data)) {
				$this->Session->setFlash(__('The designation has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The designation could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Designation');
		$this->Designation->id = $id;
		if (!$this->Designation->exists($id)) {
			throw new NotFoundException(__('Invalid designation'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['Designation']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->Designation->save($this->request->data)) {
				$this->Session->setFlash(__('The designation has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The designation could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('Designation.' . $this->Designation->primaryKey => $id));
			$this->request->data = $this->Designation->find('first', $options);
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
		$this->Designation->id = $id;
		if (!$this->Designation->exists()) {
			throw new NotFoundException(__('Invalid designation'));
		}
		if ($this->Designation->delete()) {
			$this->Session->setFlash(__('Designation deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Designation was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->set('page_title','Designation List');
		$this->Designation->recursive = 0;
		$this->paginate = array('order' => array('Designation.id' => 'DESC'));
		$this->set('designations', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Designation Details');
		if (!$this->Designation->exists($id)) {
			throw new NotFoundException(__('Invalid designation'));
		}
		$options = array('conditions' => array('Designation.' . $this->Designation->primaryKey => $id));
		$this->set('designation', $this->Designation->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Designation');
		if ($this->request->is('post')) {
			$this->Designation->create();
			$this->request->data['Designation']['created_at'] = $this->current_datetime();
			$this->request->data['Designation']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->Designation->save($this->request->data)) {
				$this->Session->setFlash(__('The designation has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The designation could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Designation');
		$this->Designation->id = $id;
		if (!$this->Designation->exists($id)) {
			throw new NotFoundException(__('Invalid designation'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['Designation']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->Designation->save($this->request->data)) {
				$this->Session->setFlash(__('The designation has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The designation could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('Designation.' . $this->Designation->primaryKey => $id));
			$this->request->data = $this->Designation->find('first', $options);
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
		$this->Designation->id = $id;
		if (!$this->Designation->exists()) {
			throw new NotFoundException(__('Invalid designation'));
		}
		if ($this->Designation->delete()) {
			$this->Session->setFlash(__('Designation deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Designation was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
