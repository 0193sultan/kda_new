<?php
App::uses('AppController', 'Controller');
/**
 * JobStatuses Controller
 *
 * @property JobStatus $JobStatus
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class JobStatusesController extends AppController {

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
		$this->set('page_title','Job status List');
		$this->JobStatus->recursive = 0;
		$this->paginate = array('order' => array('JobStatus.id' => 'DESC'));
		$this->set('jobStatuses', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Job status Details');
		if (!$this->JobStatus->exists($id)) {
			throw new NotFoundException(__('Invalid job status'));
		}
		$options = array('conditions' => array('JobStatus.' . $this->JobStatus->primaryKey => $id));
		$this->set('jobStatus', $this->JobStatus->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Job status');
		if ($this->request->is('post')) {
			$this->JobStatus->create();
			$this->request->data['JobStatus']['created_at'] = $this->current_datetime();
			$this->request->data['JobStatus']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->JobStatus->save($this->request->data)) {
				$this->Session->setFlash(__('The job status has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The job status could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Job status');
		$this->JobStatus->id = $id;
		if (!$this->JobStatus->exists($id)) {
			throw new NotFoundException(__('Invalid job status'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['JobStatus']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->JobStatus->save($this->request->data)) {
				$this->Session->setFlash(__('The job status has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The job status could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('JobStatus.' . $this->JobStatus->primaryKey => $id));
			$this->request->data = $this->JobStatus->find('first', $options);
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
		$this->JobStatus->id = $id;
		if (!$this->JobStatus->exists()) {
			throw new NotFoundException(__('Invalid job status'));
		}
		if ($this->JobStatus->delete()) {
			$this->Session->setFlash(__('Job status deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Job status was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
