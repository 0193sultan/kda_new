<?php
App::uses('AppController', 'Controller');
/**
 * EduStatuses Controller
 *
 * @property EduStatus $EduStatus
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class EduStatusesController extends AppController {

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
		$this->set('page_title','Edu status List');
		$this->EduStatus->recursive = 0;
		$this->paginate = array('order' => array('EduStatus.id' => 'DESC'));
		$this->set('eduStatuses', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Edu status Details');
		if (!$this->EduStatus->exists($id)) {
			throw new NotFoundException(__('Invalid edu status'));
		}
		$options = array('conditions' => array('EduStatus.' . $this->EduStatus->primaryKey => $id));
		$this->set('eduStatus', $this->EduStatus->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Edu status');
		if ($this->request->is('post')) {
			$this->EduStatus->create();
			$this->request->data['EduStatus']['created_at'] = $this->current_datetime();
			$this->request->data['EduStatus']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->EduStatus->save($this->request->data)) {
				$this->Session->setFlash(__('The edu status has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The edu status could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Edu status');
		$this->EduStatus->id = $id;
		if (!$this->EduStatus->exists($id)) {
			throw new NotFoundException(__('Invalid edu status'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['EduStatus']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->EduStatus->save($this->request->data)) {
				$this->Session->setFlash(__('The edu status has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The edu status could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('EduStatus.' . $this->EduStatus->primaryKey => $id));
			$this->request->data = $this->EduStatus->find('first', $options);
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
		$this->EduStatus->id = $id;
		if (!$this->EduStatus->exists()) {
			throw new NotFoundException(__('Invalid edu status'));
		}
		if ($this->EduStatus->delete()) {
			$this->Session->setFlash(__('Edu status deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Edu status was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
