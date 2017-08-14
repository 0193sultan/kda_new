<?php
App::uses('AppController', 'Controller');
/**
 * LivingStatuses Controller
 *
 * @property LivingStatus $LivingStatus
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class LivingStatusesController extends AppController {

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
		$this->set('page_title','Living status List');
		$this->LivingStatus->recursive = 0;
		$this->paginate = array('order' => array('LivingStatus.id' => 'DESC'));
		$this->set('livingStatuses', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->set('page_title','Living status Details');
		if (!$this->LivingStatus->exists($id)) {
			throw new NotFoundException(__('Invalid living status'));
		}
		$options = array('conditions' => array('LivingStatus.' . $this->LivingStatus->primaryKey => $id));
		$this->set('livingStatus', $this->LivingStatus->find('first', $options));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		$this->set('page_title','Add Living status');
		if ($this->request->is('post')) {
			$this->LivingStatus->create();
			$this->request->data['LivingStatus']['created_at'] = $this->current_datetime();
			$this->request->data['LivingStatus']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->LivingStatus->save($this->request->data)) {
				$this->Session->setFlash(__('The living status has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The living status could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Living status');
		$this->LivingStatus->id = $id;
		if (!$this->LivingStatus->exists($id)) {
			throw new NotFoundException(__('Invalid living status'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['LivingStatus']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->LivingStatus->save($this->request->data)) {
				$this->Session->setFlash(__('The living status has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The living status could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('LivingStatus.' . $this->LivingStatus->primaryKey => $id));
			$this->request->data = $this->LivingStatus->find('first', $options);
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
		$this->LivingStatus->id = $id;
		if (!$this->LivingStatus->exists()) {
			throw new NotFoundException(__('Invalid living status'));
		}
		if ($this->LivingStatus->delete()) {
			$this->Session->setFlash(__('Living status deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Living status was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->set('page_title','Living status List');
		$this->LivingStatus->recursive = 0;
		$this->paginate = array('order' => array('LivingStatus.id' => 'DESC'));
		$this->set('livingStatuses', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Living status Details');
		if (!$this->LivingStatus->exists($id)) {
			throw new NotFoundException(__('Invalid living status'));
		}
		$options = array('conditions' => array('LivingStatus.' . $this->LivingStatus->primaryKey => $id));
		$this->set('livingStatus', $this->LivingStatus->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Living status');
		if ($this->request->is('post')) {
			$this->LivingStatus->create();
			$this->request->data['LivingStatus']['created_at'] = $this->current_datetime();
			$this->request->data['LivingStatus']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->LivingStatus->save($this->request->data)) {
				$this->Session->setFlash(__('The living status has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The living status could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Living status');
		$this->LivingStatus->id = $id;
		if (!$this->LivingStatus->exists($id)) {
			throw new NotFoundException(__('Invalid living status'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['LivingStatus']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->LivingStatus->save($this->request->data)) {
				$this->Session->setFlash(__('The living status has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The living status could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('LivingStatus.' . $this->LivingStatus->primaryKey => $id));
			$this->request->data = $this->LivingStatus->find('first', $options);
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
		$this->LivingStatus->id = $id;
		if (!$this->LivingStatus->exists()) {
			throw new NotFoundException(__('Invalid living status'));
		}
		if ($this->LivingStatus->delete()) {
			$this->Session->setFlash(__('Living status deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Living status was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
