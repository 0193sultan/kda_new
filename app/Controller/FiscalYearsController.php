<?php
App::uses('AppController', 'Controller');
/**
 * FiscalYears Controller
 *
 * @property FiscalYear $FiscalYear
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class FiscalYearsController extends AppController {

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
		$this->set('page_title','Fiscal year List');
		$this->FiscalYear->recursive = 0;
		$this->paginate = array('order' => array('FiscalYear.id' => 'DESC'));
		$this->set('fiscalYears', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Fiscal year Details');
		if (!$this->FiscalYear->exists($id)) {
			throw new NotFoundException(__('Invalid fiscal year'));
		}
		$options = array('conditions' => array('FiscalYear.' . $this->FiscalYear->primaryKey => $id));
		$this->set('fiscalYear', $this->FiscalYear->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Fiscal year');
		if ($this->request->is('post')) {
			$this->FiscalYear->create();
			$this->request->data['FiscalYear']['created_at'] = $this->current_datetime();
			$this->request->data['FiscalYear']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->FiscalYear->save($this->request->data)) {
				$this->Session->setFlash(__('The fiscal year has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The fiscal year could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title','Edit Fiscal year');
		$this->FiscalYear->id = $id;
		if (!$this->FiscalYear->exists($id)) {
			throw new NotFoundException(__('Invalid fiscal year'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['FiscalYear']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->FiscalYear->save($this->request->data)) {
				$this->Session->setFlash(__('The fiscal year has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The fiscal year could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('FiscalYear.' . $this->FiscalYear->primaryKey => $id));
			$this->request->data = $this->FiscalYear->find('first', $options);
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
		$this->FiscalYear->id = $id;
		if (!$this->FiscalYear->exists()) {
			throw new NotFoundException(__('Invalid fiscal year'));
		}
		if ($this->FiscalYear->delete()) {
			$this->Session->setFlash(__('Fiscal year deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Fiscal year was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
