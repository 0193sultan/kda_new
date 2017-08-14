<?php
App::uses('AppController', 'Controller');
/**
 * EmployeeHouseRentSettings Controller
 *
 * @property EmployeeHouseRentSetting $EmployeeHouseRentSetting
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class EmployeeHouseRentSettingsController extends AppController {

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
		$this->set('page_title','Employee house rent setting List');
		$this->EmployeeHouseRentSetting->recursive = 0;
		$this->paginate = array('order' => array('EmployeeHouseRentSetting.id' => 'DESC'));
		$this->set('employeeHouseRentSettings', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Employee house rent setting Details');
		if (!$this->EmployeeHouseRentSetting->exists($id)) {
			throw new NotFoundException(__('Invalid employee house rent setting'));
		}
		$options = array('conditions' => array('EmployeeHouseRentSetting.' . $this->EmployeeHouseRentSetting->primaryKey => $id));
		$this->set('employeeHouseRentSetting', $this->EmployeeHouseRentSetting->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Employee house rent setting');
		if ($this->request->is('post')) {
			$this->EmployeeHouseRentSetting->create();

			$data = $this->request->data; 
			$data['EmployeeHouseRentSetting']['created_date'] = $this->current_datetime("YY-M-D :H:M:S");

			$this->request->data['EmployeeHouseRentSetting']['created_by'] = $this->UserAuth->getUserId();	
				
			if ($this->EmployeeHouseRentSetting->save($data)) {
				$this->Session->setFlash(__('The employee house rent setting has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The employee house rent setting could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$locations = $this->EmployeeHouseRentSetting->Location->find('list');
		$users = $this->EmployeeHouseRentSetting->User->find('list');
		$this->set(compact('locations', 'users'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {

        $this->set('page_title','Edit Employee house rent setting');
		$this->EmployeeHouseRentSetting->id = $id;
		if (!$this->EmployeeHouseRentSetting->exists($id)) {
			throw new NotFoundException(__('Invalid employee house rent setting'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['EmployeeHouseRentSetting']['updated_by'] = $this->UserAuth->getUserId();

			$data = $this->request->data; 
			$data['EmployeeHouseRentSetting']['update_date'] = $this->current_datetime("YY-M-D :H:M:S");

			if ($this->EmployeeHouseRentSetting->save($data)) {
				$this->Session->setFlash(__('The employee house rent setting has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The employee house rent setting could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('EmployeeHouseRentSetting.' . $this->EmployeeHouseRentSetting->primaryKey => $id));
			$this->request->data = $this->EmployeeHouseRentSetting->find('first', $options);
		}
		$locations = $this->EmployeeHouseRentSetting->Location->find('list');
		$users = $this->EmployeeHouseRentSetting->User->find('list');
		$this->set(compact('locations', 'users'));
		
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
		$this->EmployeeHouseRentSetting->id = $id;
		if (!$this->EmployeeHouseRentSetting->exists()) {
			throw new NotFoundException(__('Invalid employee house rent setting'));
		}
		if ($this->EmployeeHouseRentSetting->delete()) {
			$this->Session->setFlash(__('Employee house rent setting deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Employee house rent setting was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
