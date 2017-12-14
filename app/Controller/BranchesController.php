<?php
App::uses('AppController', 'Controller');
/**
 * Branches Controller
 *
 * @property Branch $Branch
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class BranchesController extends AppController {

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
		$this->set('page_title','Branch List');
		$this->Branch->recursive = 0;
		$this->paginate = array('order' => array('Branch.id' => 'DESC'));
		$this->set('branches', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Branch Details');
		if (!$this->Branch->exists($id)) {
			throw new NotFoundException(__('Invalid branch'));
		}
		$options = array('conditions' => array('Branch.' . $this->Branch->primaryKey => $id));
		$this->set('branch', $this->Branch->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Branch');
		if ($this->request->is('post')) {
			$this->Branch->create();
			$this->request->data['Branch']['created_at'] = $this->current_datetime();
			$this->request->data['Branch']['user_id'] = $this->UserAuth->getUserId();			
			if ($this->Branch->save($this->request->data)) {
				$this->Session->setFlash(__('The branch has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The branch could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$bankInfos = $this->Branch->BankInfo->find('list');
		$users = $this->Branch->User->find('list');
		$this->set(compact('bankInfos', 'users'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Branch');
		$this->Branch->id = $id;
		if (!$this->Branch->exists($id)) {
			throw new NotFoundException(__('Invalid branch'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['Branch']['updated_at'] = $this->current_datetime();
			$this->request->data['Branch']['user_id'] = $this->UserAuth->getUserId();
			if ($this->Branch->save($this->request->data)) {
				$this->Session->setFlash(__('The branch has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The branch could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('Branch.' . $this->Branch->primaryKey => $id));
			$this->request->data = $this->Branch->find('first', $options);
		}
		$bankInfos = $this->Branch->BankInfo->find('list');
		$users = $this->Branch->User->find('list');
		$this->set(compact('bankInfos', 'users'));
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
		$this->Branch->id = $id;
		if (!$this->Branch->exists()) {
			throw new NotFoundException(__('Invalid branch'));
		}
		if ($this->Branch->delete()) {
			$this->Session->setFlash(__('Branch deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Branch was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
