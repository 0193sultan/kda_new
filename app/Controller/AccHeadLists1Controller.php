<?php
App::uses('AppController', 'Controller');
/**
 * AccHeadLists Controller
 *
 * @property AccHeadList $AccHeadList
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class AccHeadLists1Controller extends AppController {

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
		$this->set('page_title','Acc head list List');
		$this->AccHeadList->recursive = 0;
		$this->paginate = array('order' => array('AccHeadList.id' => 'DESC'));
		$this->set('accHeadLists', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Acc head list Details');
		if (!$this->AccHeadList->exists($id)) {
			throw new NotFoundException(__('Invalid acc head list'));
		}
		$options = array('conditions' => array('AccHeadList.' . $this->AccHeadList->primaryKey => $id));
		$this->set('accHeadList', $this->AccHeadList->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Acc head list');
		if ($this->request->is('post')) {
			$this->AccHeadList->create();
			$this->request->data['AccHeadList']['created_at'] = $this->current_datetime();
			$this->request->data['AccHeadList']['user_id'] = $this->UserAuth->getUserId();
			if ($this->request->data['AccHeadList']['parent_id'] != '') {
				$this->request->data['AccHeadList']['parent_id'] = $this->request->data['AccHeadList']['parent_id'];
			} else {
				$this->request->data['AccHeadList']['parent_id'] = 0;
			}
					
			if ($this->AccHeadList->save($this->request->data)) {
				$this->Session->setFlash(__('The acc head list has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The acc head list could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$accEffects = $this->AccHeadList->AccEffect->find('list', array('fields'=>array('AccEffect.id','AccEffect.acc_effect_head_name')));
		$accHeadTypes = $this->AccHeadList->AccHeadType->find('list', array('fields'=>array('AccHeadType.id','AccHeadType.head_type_name'),'conditions'=>array('AccHeadType.status'=>'Active')));
		$this->set(compact('accEffects', 'accHeadTypes'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Acc head list');
		$this->AccHeadList->id = $id;
		if (!$this->AccHeadList->exists($id)) {
			throw new NotFoundException(__('Invalid acc head list'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['AccHeadList']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->AccHeadList->save($this->request->data)) {
				$this->Session->setFlash(__('The acc head list has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The acc head list could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('AccHeadList.' . $this->AccHeadList->primaryKey => $id));
			$this->request->data = $this->AccHeadList->find('first', $options);
		}

		$head_type_id = $this->AccHeadList->find('first',array('conditions'=>array('AccHeadList.id'=>$id),'recursive'=>-1));

		$accEffects = $this->AccHeadList->AccEffect->find('list', array('fields'=>array('AccEffect.id','AccEffect.acc_effect_head_name')));
		$accHeadTypes = $this->AccHeadList->AccHeadType->find('list', array('fields'=>array('AccHeadType.id','AccHeadType.head_type_name'),'conditions'=>array('AccHeadType.status'=>'Active')));
		$parent_head_list = $this->AccHeadList->find('list', array('fields'=>array('AccHeadList.id','AccHeadList.head_name'),'conditions'=>array('AccHeadList.status'=>'Active','AccHeadList.parent_id'=>0,'AccHeadList.acc_head_type_id'=>$head_type_id['AccHeadList']['acc_head_type_id'])));

		$this->set(compact('parent_head_list', 'accEffects', 'accHeadTypes'));
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
		$this->AccHeadList->id = $id;
		if (!$this->AccHeadList->exists()) {
			throw new NotFoundException(__('Invalid acc head list'));
		}
		if ($this->AccHeadList->delete()) {
			$this->Session->setFlash(__('Acc head list deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Acc head list was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}

}
