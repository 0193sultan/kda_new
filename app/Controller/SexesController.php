<?php
App::uses('AppController', 'Controller');
/**
 * Sexes Controller
 *
 * @property Sex $Sex
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class SexesController extends AppController {

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
		$this->set('page_title','Sex List');
		$this->Sex->recursive = 0;
		$this->paginate = array('order' => array('Sex.id' => 'DESC'));
		$this->set('sexes', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Sex Details');
		if (!$this->Sex->exists($id)) {
			throw new NotFoundException(__('Invalid sex'));
		}
		$options = array('conditions' => array('Sex.' . $this->Sex->primaryKey => $id));
		$this->set('sex', $this->Sex->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Sex');
		if ($this->request->is('post')) {
			$this->Sex->create();
			$this->request->data['Sex']['created_at'] = $this->current_datetime();
			$this->request->data['Sex']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->Sex->save($this->request->data)) {
				$this->Session->setFlash(__('The sex has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The sex could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Sex');
		$this->Sex->id = $id;
		if (!$this->Sex->exists($id)) {
			throw new NotFoundException(__('Invalid sex'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['Sex']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->Sex->save($this->request->data)) {
				$this->Session->setFlash(__('The sex has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The sex could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('Sex.' . $this->Sex->primaryKey => $id));
			$this->request->data = $this->Sex->find('first', $options);
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
		$this->Sex->id = $id;
		if (!$this->Sex->exists()) {
			throw new NotFoundException(__('Invalid sex'));
		}
		if ($this->Sex->delete()) {
			$this->Session->setFlash(__('Sex deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Sex was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
