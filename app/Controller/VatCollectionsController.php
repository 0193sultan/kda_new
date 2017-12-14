<?php
App::uses('AppController', 'Controller');
/**
 * VatCollections Controller
 *
 * @property VatCollection $VatCollection
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class VatCollectionsController extends AppController {

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
		$this->set('page_title','Vat collection List');
		$this->VatCollection->recursive = 0;
		$this->paginate = array('order' => array('VatCollection.id' => 'DESC'));
		$this->set('vatCollections', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Vat collection Details');
		if (!$this->VatCollection->exists($id)) {
			throw new NotFoundException(__('Invalid vat collection'));
		}
		$options = array('conditions' => array('VatCollection.' . $this->VatCollection->primaryKey => $id));
		$this->set('vatCollection', $this->VatCollection->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Vat collection');
		if ($this->request->is('post')) {
			$this->VatCollection->create();
			$this->request->data['VatCollection']['created_at'] = $this->current_datetime();
			$this->request->data['VatCollection']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->VatCollection->save($this->request->data)) {
				$this->Session->setFlash(__('The vat collection has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The vat collection could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$vatAccounts = $this->VatCollection->VatAccount->find('list');
		$dailyTransactions = $this->VatCollection->DailyTransaction->find('list');
		$headWiseAccountBalances = $this->VatCollection->HeadWiseAccountBalance->find('list');
		$contructorProjectNames = $this->VatCollection->ContructorProjectName->find('list');
		$contructorNames = $this->VatCollection->ContructorName->find('list');
		$workOrders = $this->VatCollection->WorkOrder->find('list');
		$this->set(compact('vatAccounts', 'dailyTransactions', 'headWiseAccountBalances', 'contructorProjectNames', 'contructorNames', 'workOrders'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Vat collection');
		$this->VatCollection->id = $id;
		if (!$this->VatCollection->exists($id)) {
			throw new NotFoundException(__('Invalid vat collection'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['VatCollection']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->VatCollection->save($this->request->data)) {
				$this->Session->setFlash(__('The vat collection has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The vat collection could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('VatCollection.' . $this->VatCollection->primaryKey => $id));
			$this->request->data = $this->VatCollection->find('first', $options);
		}
		$vatAccounts = $this->VatCollection->VatAccount->find('list');
		$dailyTransactions = $this->VatCollection->DailyTransaction->find('list');
		$headWiseAccountBalances = $this->VatCollection->HeadWiseAccountBalance->find('list');
		$contructorProjectNames = $this->VatCollection->ContructorProjectName->find('list');
		$contructorNames = $this->VatCollection->ContructorName->find('list');
		$workOrders = $this->VatCollection->WorkOrder->find('list');
		$this->set(compact('vatAccounts', 'dailyTransactions', 'headWiseAccountBalances', 'contructorProjectNames', 'contructorNames', 'workOrders'));
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
		$this->VatCollection->id = $id;
		if (!$this->VatCollection->exists()) {
			throw new NotFoundException(__('Invalid vat collection'));
		}
		if ($this->VatCollection->delete()) {
			$this->Session->setFlash(__('Vat collection deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Vat collection was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
