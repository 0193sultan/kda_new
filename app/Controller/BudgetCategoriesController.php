<?php
App::uses('AppController', 'Controller');
/**
 * BudgetCategories Controller
 *
 * @property BudgetCategory $BudgetCategory
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class BudgetCategoriesController extends AppController {

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
		$this->set('page_title','Budget category List');
		$this->BudgetCategory->recursive = 0;
		$this->paginate = array('order' => array('BudgetCategory.id' => 'DESC'));
		$this->set('budgetCategories', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Budget category Details');
		if (!$this->BudgetCategory->exists($id)) {
			throw new NotFoundException(__('Invalid budget category'));
		}
		$options = array('conditions' => array('BudgetCategory.' . $this->BudgetCategory->primaryKey => $id));
		$this->set('budgetCategory', $this->BudgetCategory->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Budget category');
		if ($this->request->is('post')) {
			$this->BudgetCategory->create();
			$this->request->data['BudgetCategory']['created_at'] = $this->current_datetime();
			$this->request->data['BudgetCategory']['user_id'] = $this->UserAuth->getUserId();			
			if ($this->BudgetCategory->save($this->request->data)) {
				$this->Session->setFlash(__('The budget category has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The budget category could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$users = $this->BudgetCategory->User->find('list');
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
        $this->set('page_title','Edit Budget category');
		$this->BudgetCategory->id = $id;
		if (!$this->BudgetCategory->exists($id)) {
			throw new NotFoundException(__('Invalid budget category'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['BudgetCategory']['user_id'] = $this->UserAuth->getUserId();
			$this->request->data['BudgetCategory']['updated_at'] = $this->current_datetime();
			if ($this->BudgetCategory->save($this->request->data)) {
				$this->Session->setFlash(__('The budget category has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The budget category could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('BudgetCategory.' . $this->BudgetCategory->primaryKey => $id));
			$this->request->data = $this->BudgetCategory->find('first', $options);
		}
		$users = $this->BudgetCategory->User->find('list');
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
		$this->BudgetCategory->id = $id;
		if (!$this->BudgetCategory->exists()) {
			throw new NotFoundException(__('Invalid budget category'));
		}
		if ($this->BudgetCategory->delete()) {
			$this->Session->setFlash(__('Budget category deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Budget category was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
