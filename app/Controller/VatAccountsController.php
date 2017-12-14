<?php
App::uses('AppController', 'Controller');
/**
 * VatAccounts Controller
 *
 * @property VatAccount $VatAccount
 * @property PaginatorComponent $Paginator
 * @property AClComponent $ACl
 * @property SessionComponent $Session
 */
class VatAccountsController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'ACl', 'Session');

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->set('page_title','Vat account List');
		$this->VatAccount->recursive = 0;
		$this->paginate = array('order' => array('VatAccount.id' => 'DESC'));
		$this->set('vatAccounts', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Vat account Details');
		if (!$this->VatAccount->exists($id)) {
			throw new NotFoundException(__('Invalid vat account'));
		}
		$options = array('conditions' => array('VatAccount.' . $this->VatAccount->primaryKey => $id));
		$this->set('vatAccount', $this->VatAccount->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Vat account');
		if ($this->request->is('post')) {
			$this->VatAccount->create();
			$this->request->data['VatAccount']['created_at'] = $this->current_datetime();
			$this->request->data['VatAccount']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->VatAccount->save($this->request->data)) {
				$this->Session->setFlash(__('The vat account has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The vat account could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Vat account');
		$this->VatAccount->id = $id;
		if (!$this->VatAccount->exists($id)) {
			throw new NotFoundException(__('Invalid vat account'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['VatAccount']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->VatAccount->save($this->request->data)) {
				$this->Session->setFlash(__('The vat account has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The vat account could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('VatAccount.' . $this->VatAccount->primaryKey => $id));
			$this->request->data = $this->VatAccount->find('first', $options);
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
		$this->VatAccount->id = $id;
		if (!$this->VatAccount->exists()) {
			throw new NotFoundException(__('Invalid vat account'));
		}
		if ($this->VatAccount->delete()) {
			$this->Session->setFlash(__('Vat account deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Vat account was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
