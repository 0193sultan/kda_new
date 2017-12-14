<?php
App::uses('AppController', 'Controller');
/**
 * BudgetHeadLists Controller
 *
 * @property BudgetHeadList $BudgetHeadList
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class BudgetHeadListsController extends AppController {

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
		$this->set('page_title','Budget head list List');
		$this->BudgetHeadList->recursive = 0;
		$this->paginate = array('order' => array('BudgetHeadList.id' => 'DESC'));
		$this->set('budgetHeadLists', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Budget head list Details');
		if (!$this->BudgetHeadList->exists($id)) {
			throw new NotFoundException(__('Invalid budget head list'));
		}
		$options = array('conditions' => array('BudgetHeadList.' . $this->BudgetHeadList->primaryKey => $id));
		$this->set('budgetHeadList', $this->BudgetHeadList->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Budget head list');
		if ($this->request->is('post')) {
			$this->BudgetHeadList->create();
			$this->request->data['BudgetHeadList']['created_at'] = $this->current_datetime();
			$this->request->data['BudgetHeadList']['user_id'] = $this->UserAuth->getUserId();			
			if ($this->BudgetHeadList->save($this->request->data)) {
				$this->Session->setFlash(__('The budget head list has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The budget head list could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$budgetSchedules = $this->BudgetHeadList->BudgetSchedule->find('list');
		$this->set(compact('budgetSchedules'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Budget head list');
		$this->BudgetHeadList->id = $id;
		if (!$this->BudgetHeadList->exists($id)) {
			throw new NotFoundException(__('Invalid budget head list'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['BudgetHeadList']['updated_at'] = $this->current_datetime();
			$this->request->data['BudgetHeadList']['user_id'] = $this->UserAuth->getUserId();
			if ($this->BudgetHeadList->save($this->request->data)) {
				$this->Session->setFlash(__('The budget head list has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The budget head list could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('BudgetHeadList.' . $this->BudgetHeadList->primaryKey => $id));
			$this->request->data = $this->BudgetHeadList->find('first', $options);
		}
		$budgetSchedules = $this->BudgetHeadList->BudgetSchedule->find('list');
		$this->set(compact('budgetSchedules'));
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
		$this->BudgetHeadList->id = $id;
		if (!$this->BudgetHeadList->exists()) {
			throw new NotFoundException(__('Invalid budget head list'));
		}
		if ($this->BudgetHeadList->delete()) {
			$this->Session->setFlash(__('Budget head list deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Budget head list was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
