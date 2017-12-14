<?php
App::uses('AppController', 'Controller');
/**
 * WorkOrders Controller
 *
 * @property WorkOrder $WorkOrder
 * @property PaginatorComponent $Paginator
 */
class WorkOrdersController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator');

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->set('page_title','Work order List');
		$this->WorkOrder->recursive = 0;
		$this->paginate = array('order' => array('WorkOrder.id' => 'DESC'));
		$this->set('workOrders', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Work order Details');
		if (!$this->WorkOrder->exists($id)) {
			throw new NotFoundException(__('Invalid work order'));
		}
		$options = array('conditions' => array('WorkOrder.' . $this->WorkOrder->primaryKey => $id));
		$this->set('workOrder', $this->WorkOrder->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Work order');
		if ($this->request->is('post')) {
			$this->WorkOrder->create();
			$this->request->data['WorkOrder']['created_at'] = $this->current_datetime();
			$this->request->data['WorkOrder']['user_id'] = $this->UserAuth->getUserId();
			$this->request->data['WorkOrder']['work_order_date'] = date("Y-m-d", strtotime($this->request->data['WorkOrder']['work_order_date'])) ;			
			if ($this->WorkOrder->save($this->request->data)) {
				$this->Session->setFlash(__('The work order has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The work order could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$contructorProjectNames = $this->WorkOrder->ContructorProjectName->find('list');
		$contructorNames = $this->WorkOrder->ContructorName->find('list');
		$this->loadModel('FiscalYear');
		$fiscalYears = $this->FiscalYear->find('list');
		$users = $this->WorkOrder->User->find('list');
		$this->set(compact('contructorProjectNames', 'contructorNames', 'fiscalYears', 'users'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Work order');
		$this->WorkOrder->id = $id;
		if (!$this->WorkOrder->exists($id)) {
			throw new NotFoundException(__('Invalid work order'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['WorkOrder']['updated_by'] = $this->UserAuth->getUserId();
			$this->request->data['WorkOrder']['updated_at'] = $this->current_datetime();
			if ($this->WorkOrder->save($this->request->data)) {
				$this->Session->setFlash(__('The work order has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The work order could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('WorkOrder.' . $this->WorkOrder->primaryKey => $id));
			$this->request->data = $this->WorkOrder->find('first', $options);
		}
		$contructorProjectNames = $this->WorkOrder->ContructorProjectName->find('list');
		$contructorNames = $this->WorkOrder->ContructorName->find('list');
		$this->loadModel('FiscalYear');
		$fiscalYears = $this->FiscalYear->find('list');
		$users = $this->WorkOrder->User->find('list');
		$this->set(compact('contructorProjectNames', 'contructorNames', 'fiscalYears', 'users'));
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
		$this->WorkOrder->id = $id;
		if (!$this->WorkOrder->exists()) {
			throw new NotFoundException(__('Invalid work order'));
		}
		if ($this->WorkOrder->delete()) {
			$this->Session->setFlash(__('Work order deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Work order was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
