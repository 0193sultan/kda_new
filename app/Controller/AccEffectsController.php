<?php
App::uses('AppController', 'Controller');
/**
 * AccEffects Controller
 *
 * @property AccEffect $AccEffect
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class AccEffectsController extends AppController {

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
		$this->set('page_title','Acc effect List');
		$this->AccEffect->recursive = 0;
		$this->paginate = array('order' => array('AccEffect.id' => 'ASC'));
		$this->set('accEffects', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Acc effect Details');
		if (!$this->AccEffect->exists($id)) {
			throw new NotFoundException(__('Invalid acc effect'));
		}
		$options = array('conditions' => array('AccEffect.' . $this->AccEffect->primaryKey => $id));
		$this->set('accEffect', $this->AccEffect->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Acc effect');
		if ($this->request->is('post')) {
			$this->AccEffect->create();
			$this->request->data['AccEffect']['created_at'] = $this->current_datetime();
			$this->request->data['AccEffect']['user_id'] = $this->UserAuth->getUserId();			
			if ($this->AccEffect->save($this->request->data)) {
				$this->Session->setFlash(__('The acc effect has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The acc effect could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Acc effect');
		$this->AccEffect->id = $id;
		if (!$this->AccEffect->exists($id)) {
			throw new NotFoundException(__('Invalid acc effect'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['AccEffect']['user_id'] = $this->UserAuth->getUserId();
			$this->request->data['AccEffect']['updated_at'] = $this->current_datetime();
			if ($this->AccEffect->save($this->request->data)) {
				$this->Session->setFlash(__('The acc effect has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The acc effect could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('AccEffect.' . $this->AccEffect->primaryKey => $id));
			$this->request->data = $this->AccEffect->find('first', $options);
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
		$this->AccEffect->id = $id;
		if (!$this->AccEffect->exists()) {
			throw new NotFoundException(__('Invalid acc effect'));
		}
		if ($this->AccEffect->delete()) {
			$this->Session->setFlash(__('Acc effect deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Acc effect was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
