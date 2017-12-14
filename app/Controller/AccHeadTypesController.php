<?php
App::uses('AppController', 'Controller');
/**
 * AccHeadTypes Controller
 *
 * @property AccHeadType $AccHeadType
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class AccHeadTypesController extends AppController {

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
		$this->set('page_title','Acc head type List');
		$this->AccHeadType->recursive = 0;
		$this->paginate = array('order' => array('AccHeadType.id' => 'ASC'));
		$this->set('accHeadTypes', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Acc head type Details');
		if (!$this->AccHeadType->exists($id)) {
			throw new NotFoundException(__('Invalid acc head type'));
		}
		$options = array('conditions' => array('AccHeadType.' . $this->AccHeadType->primaryKey => $id));
		$this->set('accHeadType', $this->AccHeadType->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Acc head type');
		if ($this->request->is('post')) {
			$this->AccHeadType->create();
			$this->request->data['AccHeadType']['created_at'] = $this->current_datetime();
			$this->request->data['AccHeadType']['user_id'] = $this->UserAuth->getUserId();			
			if ($this->AccHeadType->save($this->request->data)) {
				$this->Session->setFlash(__('The acc head type has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The accounting head type could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Acc head type');
		$this->AccHeadType->id = $id;
		if (!$this->AccHeadType->exists($id)) {
			throw new NotFoundException(__('Invalid acc head type'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['AccHeadType']['user_id'] = $this->UserAuth->getUserId();
			if ($this->AccHeadType->save($this->request->data)) {
				$this->Session->setFlash(__('The acc head type has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The acc head type could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('AccHeadType.' . $this->AccHeadType->primaryKey => $id));
			$this->request->data = $this->AccHeadType->find('first', $options);
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
		$this->AccHeadType->id = $id;
		if (!$this->AccHeadType->exists()) {
			throw new NotFoundException(__('Invalid acc head type'));
		}
		if ($this->AccHeadType->delete()) {
			$this->Session->setFlash(__('Acc head type deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Acc head type was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
