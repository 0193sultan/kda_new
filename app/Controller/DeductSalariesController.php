<?php
App::uses('AppController', 'Controller');
/**
 * DeductSalaries Controller
 *
 * @property DeductSalary $DeductSalary
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class DeductSalariesController extends AppController {

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
		$this->set('page_title','Deduct salary List');
		$this->DeductSalary->recursive = 0;
		$this->paginate = array('order' => array('DeductSalary.id' => 'DESC'));
		$this->set('deductSalaries', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Deduct salary Details');
		if (!$this->DeductSalary->exists($id)) {
			throw new NotFoundException(__('Invalid deduct salary'));
		}
		$options = array('conditions' => array('DeductSalary.' . $this->DeductSalary->primaryKey => $id));
		$this->set('deductSalary', $this->DeductSalary->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Deduct salary');
		if ($this->request->is('post')) {
			$this->DeductSalary->create();
			$this->request->data['DeductSalary']['created_at'] = $this->current_datetime();
			$this->request->data['DeductSalary']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->DeductSalary->save($this->request->data)) {
				$this->Session->setFlash(__('The deduct salary has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The deduct salary could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Deduct salary');
		$this->DeductSalary->id = $id;
		if (!$this->DeductSalary->exists($id)) {
			throw new NotFoundException(__('Invalid deduct salary'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['DeductSalary']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->DeductSalary->save($this->request->data)) {
				$this->Session->setFlash(__('The deduct salary has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The deduct salary could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('DeductSalary.' . $this->DeductSalary->primaryKey => $id));
			$this->request->data = $this->DeductSalary->find('first', $options);
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
		$this->DeductSalary->id = $id;
		if (!$this->DeductSalary->exists()) {
			throw new NotFoundException(__('Invalid deduct salary'));
		}
		if ($this->DeductSalary->delete()) {
			$this->Session->setFlash(__('Deduct salary deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Deduct salary was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
