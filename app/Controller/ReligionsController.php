<?php
App::uses('AppController', 'Controller');
/**
 * Religions Controller
 *
 * @property Religion $Religion
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ReligionsController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');

/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->set('page_title','Religion List');
		$this->Religion->recursive = 0;
		$this->paginate = array('order' => array('Religion.id' => 'DESC'));
		$this->set('religions', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->set('page_title','Religion Details');
		if (!$this->Religion->exists($id)) {
			throw new NotFoundException(__('Invalid religion'));
		}
		$options = array('conditions' => array('Religion.' . $this->Religion->primaryKey => $id));
		$this->set('religion', $this->Religion->find('first', $options));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		$this->set('page_title','Add Religion');
		if ($this->request->is('post')) {
			$this->Religion->create();
			$this->request->data['Religion']['created_at'] = $this->current_datetime();
			$this->request->data['Religion']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->Religion->save($this->request->data)) {
				$this->Session->setFlash(__('The religion has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The religion could not be saved. Please, try again.'), 'flash/error');
			}
		}
	}

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
        $this->set('page_title','Edit Religion');
		$this->Religion->id = $id;
		if (!$this->Religion->exists($id)) {
			throw new NotFoundException(__('Invalid religion'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['Religion']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->Religion->save($this->request->data)) {
				$this->Session->setFlash(__('The religion has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The religion could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('Religion.' . $this->Religion->primaryKey => $id));
			$this->request->data = $this->Religion->find('first', $options);
		}
	}

/**
 * delete method
 *
 * @throws NotFoundException
 * @throws MethodNotAllowedException
 * @param string $id
 * @return void
 */
	public function delete($id = null) {
		if (!$this->request->is('post')) {
			throw new MethodNotAllowedException();
		}
		$this->Religion->id = $id;
		if (!$this->Religion->exists()) {
			throw new NotFoundException(__('Invalid religion'));
		}
		if ($this->Religion->delete()) {
			$this->Session->setFlash(__('Religion deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Religion was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->set('page_title','Religion List');
		$this->Religion->recursive = 0;
		$this->paginate = array('order' => array('Religion.id' => 'DESC'));
		$this->set('religions', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Religion Details');
		if (!$this->Religion->exists($id)) {
			throw new NotFoundException(__('Invalid religion'));
		}
		$options = array('conditions' => array('Religion.' . $this->Religion->primaryKey => $id));
		$this->set('religion', $this->Religion->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Religion');
		if ($this->request->is('post')) {
			$this->Religion->create();
			$this->request->data['Religion']['created_at'] = $this->current_datetime();
			$this->request->data['Religion']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->Religion->save($this->request->data)) {
				$this->Session->setFlash(__('The religion has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The religion could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Religion');
		$this->Religion->id = $id;
		if (!$this->Religion->exists($id)) {
			throw new NotFoundException(__('Invalid religion'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['Religion']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->Religion->save($this->request->data)) {
				$this->Session->setFlash(__('The religion has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The religion could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('Religion.' . $this->Religion->primaryKey => $id));
			$this->request->data = $this->Religion->find('first', $options);
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
		$this->Religion->id = $id;
		if (!$this->Religion->exists()) {
			throw new NotFoundException(__('Invalid religion'));
		}
		if ($this->Religion->delete()) {
			$this->Session->setFlash(__('Religion deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Religion was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
