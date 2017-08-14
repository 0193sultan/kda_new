<?php
App::uses('AppController', 'Controller');
/**
 * Basics Controller
 *
 * @property Basic $Basic
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class BasicsController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $helpers = array('Html', 'Form');
	public $components = array('Paginator', 'Session');

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->set('page_title','Basic List');
		$this->Basic->recursive = 0;
		$this->paginate = array('order' => array('Basic.id' => 'DESC'));
		$this->set('basics', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Basic Details');
		if (!$this->Basic->exists($id)) {
			throw new NotFoundException(__('Invalid basic'));
		}
		$options = array('conditions' => array('Basic.' . $this->Basic->primaryKey => $id));
		$this->set('basic', $this->Basic->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Basic');
		if ($this->request->is('post')) {
			$this->Basic->create();
			$this->request->data['Basic']['created_at'] = $this->current_datetime();
			$this->request->data['Basic']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->Basic->save($this->request->data)) {
				$this->Session->setFlash(__('The basic has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The basic could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Basic');
		$this->Basic->id = $id;
		if (!$this->Basic->exists($id)) {
			throw new NotFoundException(__('Invalid basic'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['Basic']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->Basic->save($this->request->data)) {
				$this->Session->setFlash(__('The basic has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The basic could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('Basic.' . $this->Basic->primaryKey => $id));
			$this->request->data = $this->Basic->find('first', $options);
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
		$this->Basic->id = $id;
		if (!$this->Basic->exists()) {
			throw new NotFoundException(__('Invalid basic'));
		}
		if ($this->Basic->delete()) {
			$this->Session->setFlash(__('Basic deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Basic was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
