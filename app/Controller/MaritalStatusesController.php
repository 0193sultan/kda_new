<?php
App::uses('AppController', 'Controller');
/**
 * MaritalStatuses Controller
 *
 * @property MaritalStatus $MaritalStatus
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class MaritalStatusesController extends AppController {

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
		$this->set('page_title','Marital status List');
		$this->MaritalStatus->recursive = 0;
		$this->paginate = array('order' => array('MaritalStatus.id' => 'DESC'));
		$this->set('maritalStatuses', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->set('page_title','Marital status Details');
		if (!$this->MaritalStatus->exists($id)) {
			throw new NotFoundException(__('Invalid marital status'));
		}
		$options = array('conditions' => array('MaritalStatus.' . $this->MaritalStatus->primaryKey => $id));
		$this->set('maritalStatus', $this->MaritalStatus->find('first', $options));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		$this->set('page_title','Add Marital status');
		if ($this->request->is('post')) {
			$this->MaritalStatus->create();
			$this->request->data['MaritalStatus']['created_at'] = $this->current_datetime();
			$this->request->data['MaritalStatus']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->MaritalStatus->save($this->request->data)) {
				$this->Session->setFlash(__('The marital status has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The marital status could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Marital status');
		$this->MaritalStatus->id = $id;
		if (!$this->MaritalStatus->exists($id)) {
			throw new NotFoundException(__('Invalid marital status'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['MaritalStatus']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->MaritalStatus->save($this->request->data)) {
				$this->Session->setFlash(__('The marital status has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The marital status could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('MaritalStatus.' . $this->MaritalStatus->primaryKey => $id));
			$this->request->data = $this->MaritalStatus->find('first', $options);
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
		$this->MaritalStatus->id = $id;
		if (!$this->MaritalStatus->exists()) {
			throw new NotFoundException(__('Invalid marital status'));
		}
		if ($this->MaritalStatus->delete()) {
			$this->Session->setFlash(__('Marital status deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Marital status was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->set('page_title','Marital status List');
		$this->MaritalStatus->recursive = 0;
		$this->paginate = array('order' => array('MaritalStatus.id' => 'DESC'));
		$this->set('maritalStatuses', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Marital status Details');
		if (!$this->MaritalStatus->exists($id)) {
			throw new NotFoundException(__('Invalid marital status'));
		}
		$options = array('conditions' => array('MaritalStatus.' . $this->MaritalStatus->primaryKey => $id));
		$this->set('maritalStatus', $this->MaritalStatus->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Marital status');
		if ($this->request->is('post')) {
			$this->MaritalStatus->create();
			$this->request->data['MaritalStatus']['created_at'] = $this->current_datetime();
			$this->request->data['MaritalStatus']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->MaritalStatus->save($this->request->data)) {
				$this->Session->setFlash(__('The marital status has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The marital status could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Marital status');
		$this->MaritalStatus->id = $id;
		if (!$this->MaritalStatus->exists($id)) {
			throw new NotFoundException(__('Invalid marital status'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['MaritalStatus']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->MaritalStatus->save($this->request->data)) {
				$this->Session->setFlash(__('The marital status has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The marital status could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('MaritalStatus.' . $this->MaritalStatus->primaryKey => $id));
			$this->request->data = $this->MaritalStatus->find('first', $options);
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
		$this->MaritalStatus->id = $id;
		if (!$this->MaritalStatus->exists()) {
			throw new NotFoundException(__('Invalid marital status'));
		}
		if ($this->MaritalStatus->delete()) {
			$this->Session->setFlash(__('Marital status deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Marital status was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
