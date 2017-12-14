<?php
App::uses('AppController', 'Controller');
/**
 * ContructorNames Controller
 *
 * @property ContructorName $ContructorName
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ContructorNamesController extends AppController {

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
		$this->set('page_title','Contructor name List');
		$this->ContructorName->recursive = 0;
		$this->paginate = array('order' => array('ContructorName.id' => 'DESC'));
		$this->set('contructorNames', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Contructor name Details');
		if (!$this->ContructorName->exists($id)) {
			throw new NotFoundException(__('Invalid contructor name'));
		}
		$options = array('conditions' => array('ContructorName.' . $this->ContructorName->primaryKey => $id));
		$this->set('contructorName', $this->ContructorName->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Contructor name');
		if ($this->request->is('post')) {
			$this->ContructorName->create();
			$this->request->data['ContructorName']['created_at'] = $this->current_datetime();
			$this->request->data['ContructorName']['user_id'] = $this->UserAuth->getUserId();
			$this->request->data['ContructorName']['enlisted_date'] = date("Y-m-d", strtotime($this->request->data['ContructorName']['enlisted_date'])) ;			
			if ($this->ContructorName->save($this->request->data)) {
				$this->Session->setFlash(__('The contructor name has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The contructor name could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$licenceCategories = $this->ContructorName->LicenceCategory->find('list');
		$users = $this->ContructorName->User->find('list');
		$this->set(compact('licenceCategories', 'users'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Contructor name');
		$this->ContructorName->id = $id;
		if (!$this->ContructorName->exists($id)) {
			throw new NotFoundException(__('Invalid contructor name'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['ContructorName']['updated_by'] = $this->UserAuth->getUserId();
			$this->request->data['ContructorName']['updated_at'] = $this->current_datetime();
			if ($this->ContructorName->save($this->request->data)) {
				$this->Session->setFlash(__('The contructor name has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The contructor name could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('ContructorName.' . $this->ContructorName->primaryKey => $id));
			$this->request->data = $this->ContructorName->find('first', $options);
		}
		$licenceCategories = $this->ContructorName->LicenceCategory->find('list');
		$users = $this->ContructorName->User->find('list');
		$this->set(compact('licenceCategories', 'users'));
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
		$this->ContructorName->id = $id;
		if (!$this->ContructorName->exists()) {
			throw new NotFoundException(__('Invalid contructor name'));
		}
		if ($this->ContructorName->delete()) {
			$this->Session->setFlash(__('Contructor name deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Contructor name was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
