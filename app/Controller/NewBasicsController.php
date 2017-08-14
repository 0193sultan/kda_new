<?php
App::uses('AppController', 'Controller');
/**
 * NewBasics Controller
 *
 * @property NewBasic $NewBasic
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class NewBasicsController extends AppController {

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
		$this->set('page_title','New basic List');
		$this->NewBasic->recursive = 0;
		$this->paginate = array('order' => array('NewBasic.id' => 'DESC'));
		$this->set('newBasics', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->set('page_title','New basic Details');
		if (!$this->NewBasic->exists($id)) {
			throw new NotFoundException(__('Invalid new basic'));
		}
		$options = array('conditions' => array('NewBasic.' . $this->NewBasic->primaryKey => $id));
		$this->set('newBasic', $this->NewBasic->find('first', $options));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		$this->set('page_title','Add New basic');
		if ($this->request->is('post')) {
			$this->NewBasic->create();
			$this->request->data['NewBasic']['created_at'] = $this->current_datetime();
			$this->request->data['NewBasic']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->NewBasic->save($this->request->data)) {
				$this->Session->setFlash(__('The new basic has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The new basic could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit New basic');
		$this->NewBasic->id = $id;
		if (!$this->NewBasic->exists($id)) {
			throw new NotFoundException(__('Invalid new basic'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['NewBasic']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->NewBasic->save($this->request->data)) {
				$this->Session->setFlash(__('The new basic has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The new basic could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('NewBasic.' . $this->NewBasic->primaryKey => $id));
			$this->request->data = $this->NewBasic->find('first', $options);
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
		$this->NewBasic->id = $id;
		if (!$this->NewBasic->exists()) {
			throw new NotFoundException(__('Invalid new basic'));
		}
		if ($this->NewBasic->delete()) {
			$this->Session->setFlash(__('New basic deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('New basic was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->set('page_title','New basic List');
		$this->NewBasic->recursive = 0;
		$this->paginate = array('order' => array('NewBasic.id' => 'DESC'));
		$this->set('newBasics', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','New basic Details');
		if (!$this->NewBasic->exists($id)) {
			throw new NotFoundException(__('Invalid new basic'));
		}
		$options = array('conditions' => array('NewBasic.' . $this->NewBasic->primaryKey => $id));
		$this->set('newBasic', $this->NewBasic->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add New basic');
		if ($this->request->is('post')) {
			$this->NewBasic->create();
			$this->request->data['NewBasic']['created_at'] = $this->current_datetime();
			$this->request->data['NewBasic']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->NewBasic->save($this->request->data)) {
				$this->Session->setFlash(__('The new basic has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The new basic could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit New basic');
		$this->NewBasic->id = $id;
		if (!$this->NewBasic->exists($id)) {
			throw new NotFoundException(__('Invalid new basic'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['NewBasic']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->NewBasic->save($this->request->data)) {
				$this->Session->setFlash(__('The new basic has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The new basic could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('NewBasic.' . $this->NewBasic->primaryKey => $id));
			$this->request->data = $this->NewBasic->find('first', $options);
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
		$this->NewBasic->id = $id;
		if (!$this->NewBasic->exists()) {
			throw new NotFoundException(__('Invalid new basic'));
		}
		if ($this->NewBasic->delete()) {
			$this->Session->setFlash(__('New basic deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('New basic was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
