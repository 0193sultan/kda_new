<?php
App::uses('AppController', 'Controller');
/**
 * BankInfos Controller
 *
 * @property BankInfo $BankInfo
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class BankInfosController extends AppController {

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
		$this->set('page_title','Bank info List');
		$this->BankInfo->recursive = 2;
		$this->paginate = array('order' => array('BankInfo.id' => 'DESC'));
		$this->set('bankInfos', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Bank info Details');
		if (!$this->BankInfo->exists($id)) {
			throw new NotFoundException(__('Invalid bank info'));
		}
		$options = array('conditions' => array('BankInfo.' . $this->BankInfo->primaryKey => $id));
		$this->set('bankInfo', $this->BankInfo->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Bank info');
		if ($this->request->is('post')) {
			$this->BankInfo->create();
			$this->request->data['BankInfo']['created_at'] = $this->current_datetime();
			$this->request->data['BankInfo']['created_by'] = $this->UserAuth->getUserId();

			$data = $this->request->data; 

			$data['BankInfo']['create_date'] = $this->current_datetime("YY-M-D :H:M:S");

			if ($this->BankInfo->save($data)) {
				$this->Session->setFlash(__('The bank info has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The bank info could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$users = $this->BankInfo->find('list');
		$this->set(compact('users'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Bank info');
		$this->BankInfo->id = $id;
		if (!$this->BankInfo->exists($id)) {
			throw new NotFoundException(__('Invalid bank info'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['BankInfo']['updated_by'] = $this->UserAuth->getUserId();
			
			$data = $this->request->data; 

			$data['BankInfo']['update_date'] = $this->current_datetime("YY-M-D :H:M:S");

			if ($this->BankInfo->save($data)) {
				$this->Session->setFlash(__('The bank info has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The bank info could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('BankInfo.' . $this->BankInfo->primaryKey => $id));
			$this->request->data = $this->BankInfo->find('first', $options);
		}
		$users = $this->BankInfo->find('list');
		$this->set(compact('users'));
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
		$this->BankInfo->id = $id;
		if (!$this->BankInfo->exists()) {
			throw new NotFoundException(__('Invalid bank info'));
		}
		if ($this->BankInfo->delete()) {
			$this->Session->setFlash(__('Bank info deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Bank info was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
