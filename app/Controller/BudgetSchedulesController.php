<?php
App::uses('AppController', 'Controller');
/**
 * BudgetSchedules Controller
 *
 * @property BudgetSchedule $BudgetSchedule
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class BudgetSchedulesController extends AppController {

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
		$this->set('page_title','Budget schedule List');
		$this->BudgetSchedule->recursive = 0;
		$this->paginate = array('order' => array('BudgetSchedule.id' => 'DESC'));
		$this->set('budgetSchedules', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Budget schedule Details');
		if (!$this->BudgetSchedule->exists($id)) {
			throw new NotFoundException(__('Invalid budget schedule'));
		}
		$options = array('conditions' => array('BudgetSchedule.' . $this->BudgetSchedule->primaryKey => $id));
		$this->set('budgetSchedule', $this->BudgetSchedule->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Budget schedule');
		if ($this->request->is('post')) {
			$this->BudgetSchedule->create();
			$this->request->data['BudgetSchedule']['created_at'] = $this->current_datetime();
			$this->request->data['BudgetSchedule']['user_id'] = $this->UserAuth->getUserId();			
			if ($this->BudgetSchedule->save($this->request->data)) {
				$this->Session->setFlash(__('The budget schedule has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The budget schedule could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$users = $this->BudgetSchedule->User->find('list');
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
        $this->set('page_title','Edit Budget schedule');
		$this->BudgetSchedule->id = $id;
		if (!$this->BudgetSchedule->exists($id)) {
			throw new NotFoundException(__('Invalid budget schedule'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['BudgetSchedule']['updated_at'] = $this->current_datetime();
			$this->request->data['BudgetSchedule']['user_id'] = $this->UserAuth->getUserId();
			if ($this->BudgetSchedule->save($this->request->data)) {
				$this->Session->setFlash(__('The budget schedule has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The budget schedule could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('BudgetSchedule.' . $this->BudgetSchedule->primaryKey => $id));
			$this->request->data = $this->BudgetSchedule->find('first', $options);
		}
		$users = $this->BudgetSchedule->User->find('list');
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
		$this->BudgetSchedule->id = $id;
		if (!$this->BudgetSchedule->exists()) {
			throw new NotFoundException(__('Invalid budget schedule'));
		}
		if ($this->BudgetSchedule->delete()) {
			$this->Session->setFlash(__('Budget schedule deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Budget schedule was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
