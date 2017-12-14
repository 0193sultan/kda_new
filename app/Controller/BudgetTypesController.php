<?php
App::uses('AppController', 'Controller');
/**
 * BudgetTypes Controller
 *
 * @property BudgetType $BudgetType
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class BudgetTypesController extends AppController {

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
		$this->set('page_title','Budget type List');
		$this->BudgetType->recursive = 0;
		$this->paginate = array('order' => array('BudgetType.id' => 'DESC'));
		$this->set('budgetTypes', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Budget type Details');
		if (!$this->BudgetType->exists($id)) {
			throw new NotFoundException(__('Invalid budget type'));
		}
		$options = array('conditions' => array('BudgetType.' . $this->BudgetType->primaryKey => $id));
		$this->set('budgetType', $this->BudgetType->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Budget type');
		if ($this->request->is('post')) {
			$this->BudgetType->create();
			$this->request->data['BudgetType']['created_at'] = $this->current_datetime();
			$this->request->data['BudgetType']['user_id'] = $this->UserAuth->getUserId();			
			if ($this->BudgetType->save($this->request->data)) {
				$this->Session->setFlash(__('The budget type has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The budget type could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$users = $this->BudgetType->User->find('list');
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
        $this->set('page_title','Edit Budget type');
		$this->BudgetType->id = $id;
		if (!$this->BudgetType->exists($id)) {
			throw new NotFoundException(__('Invalid budget type'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['BudgetType']['user_id'] = $this->UserAuth->getUserId();
			$this->request->data['BudgetType']['updated_at'] = $this->current_datetime();
			if ($this->BudgetType->save($this->request->data)) {
				$this->Session->setFlash(__('The budget type has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The budget type could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('BudgetType.' . $this->BudgetType->primaryKey => $id));
			$this->request->data = $this->BudgetType->find('first', $options);
		}
		$users = $this->BudgetType->User->find('list');
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
		$this->BudgetType->id = $id;
		if (!$this->BudgetType->exists()) {
			throw new NotFoundException(__('Invalid budget type'));
		}
		if ($this->BudgetType->delete()) {
			$this->Session->setFlash(__('Budget type deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Budget type was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
