<?php
App::uses('AppController', 'Controller');
/**
 * Quotas Controller
 *
 * @property Quota $Quota
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class QuotasController extends AppController {

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
		$this->set('page_title','Quota List');
		$this->Quota->recursive = 0;
		$this->paginate = array('order' => array('Quota.id' => 'DESC'));
		$this->set('quotas', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->set('page_title','Quota Details');
		if (!$this->Quota->exists($id)) {
			throw new NotFoundException(__('Invalid quota'));
		}
		$options = array('conditions' => array('Quota.' . $this->Quota->primaryKey => $id));
		$this->set('quota', $this->Quota->find('first', $options));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		$this->set('page_title','Add Quota');
		if ($this->request->is('post')) {
			$this->Quota->create();
			$this->request->data['Quota']['created_at'] = $this->current_datetime();
			$this->request->data['Quota']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->Quota->save($this->request->data)) {
				$this->Session->setFlash(__('The quota has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The quota could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Quota');
		$this->Quota->id = $id;
		if (!$this->Quota->exists($id)) {
			throw new NotFoundException(__('Invalid quota'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['Quota']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->Quota->save($this->request->data)) {
				$this->Session->setFlash(__('The quota has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The quota could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('Quota.' . $this->Quota->primaryKey => $id));
			$this->request->data = $this->Quota->find('first', $options);
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
		$this->Quota->id = $id;
		if (!$this->Quota->exists()) {
			throw new NotFoundException(__('Invalid quota'));
		}
		if ($this->Quota->delete()) {
			$this->Session->setFlash(__('Quota deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Quota was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->set('page_title','Quota List');
		$this->Quota->recursive = 0;
		$this->paginate = array('order' => array('Quota.id' => 'DESC'));
		$this->set('quotas', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Quota Details');
		if (!$this->Quota->exists($id)) {
			throw new NotFoundException(__('Invalid quota'));
		}
		$options = array('conditions' => array('Quota.' . $this->Quota->primaryKey => $id));
		$this->set('quota', $this->Quota->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Quota');
		if ($this->request->is('post')) {
			$this->Quota->create();
			$this->request->data['Quota']['created_at'] = $this->current_datetime();
			$this->request->data['Quota']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->Quota->save($this->request->data)) {
				$this->Session->setFlash(__('The quota has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The quota could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Quota');
		$this->Quota->id = $id;
		if (!$this->Quota->exists($id)) {
			throw new NotFoundException(__('Invalid quota'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['Quota']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->Quota->save($this->request->data)) {
				$this->Session->setFlash(__('The quota has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The quota could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('Quota.' . $this->Quota->primaryKey => $id));
			$this->request->data = $this->Quota->find('first', $options);
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
		$this->Quota->id = $id;
		if (!$this->Quota->exists()) {
			throw new NotFoundException(__('Invalid quota'));
		}
		if ($this->Quota->delete()) {
			$this->Session->setFlash(__('Quota deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Quota was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
