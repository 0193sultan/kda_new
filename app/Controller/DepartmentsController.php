<?php
App::uses('AppController', 'Controller');
/**
 * Departments Controller
 *
 * @property Department $Department
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class DepartmentsController extends AppController {

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
		$this->set('page_title','Department List');
		$this->Department->recursive = 0;
		$this->paginate = array('order' => array('Department.id' => 'DESC'));
		$this->set('departments', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Department Details');
		if (!$this->Department->exists($id)) {
			throw new NotFoundException(__('Invalid department'));
		}
		$options = array('conditions' => array('Department.' . $this->Department->primaryKey => $id));
		$this->set('department', $this->Department->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Department');
		if ($this->request->is('post')) {
			$this->Department->create();
			$this->request->data['Department']['created_at'] = $this->current_datetime();
			$this->request->data['Department']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->Department->save($this->request->data)) {
				$this->Session->setFlash(__('The department has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The department could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Department');
		$this->Department->id = $id;
		if (!$this->Department->exists($id)) {
			throw new NotFoundException(__('Invalid department'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['Department']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->Department->save($this->request->data)) {
				$this->Session->setFlash(__('The department has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The department could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('Department.' . $this->Department->primaryKey => $id));
			$this->request->data = $this->Department->find('first', $options);
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
		$this->Department->id = $id;
		if (!$this->Department->exists()) {
			throw new NotFoundException(__('Invalid department'));
		}
		if ($this->Department->delete()) {
			$this->Session->setFlash(__('Department deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Department was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}