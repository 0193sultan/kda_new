<?php
App::uses('AppController', 'Controller');
/**
 * EntryTypes Controller
 *
 * @property EntryType $EntryType
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class EntryTypesController extends AppController {

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
		$this->set('page_title','Entry type List');
		$this->EntryType->recursive = 0;
		$this->paginate = array('order' => array('EntryType.id' => 'ASC'));
		$this->set('entryTypes', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Entry type Details');
		if (!$this->EntryType->exists($id)) {
			throw new NotFoundException(__('Invalid entry type'));
		}
		$options = array('conditions' => array('EntryType.' . $this->EntryType->primaryKey => $id));
		$this->set('entryType', $this->EntryType->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Entry type');
		if ($this->request->is('post')) {
			$this->EntryType->create();
			$this->request->data['EntryType']['created_at'] = $this->current_datetime();
			$this->request->data['EntryType']['user_id'] = $this->UserAuth->getUserId();			
			if ($this->EntryType->save($this->request->data)) {
				$this->Session->setFlash(__('The entry type has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The entry type could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Entry type');
		$this->EntryType->id = $id;
		if (!$this->EntryType->exists($id)) {
			throw new NotFoundException(__('Invalid entry type'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['EntryType']['user_id'] = $this->UserAuth->getUserId();
			$this->request->data['EntryType']['updated_at'] = $this->current_datetime();
			if ($this->EntryType->save($this->request->data)) {
				$this->Session->setFlash(__('The entry type has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The entry type could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('EntryType.' . $this->EntryType->primaryKey => $id));
			$this->request->data = $this->EntryType->find('first', $options);
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
		$this->EntryType->id = $id;
		if (!$this->EntryType->exists()) {
			throw new NotFoundException(__('Invalid entry type'));
		}
		if ($this->EntryType->delete()) {
			$this->Session->setFlash(__('Entry type deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Entry type was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
