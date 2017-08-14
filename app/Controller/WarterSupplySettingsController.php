<?php
App::uses('AppController', 'Controller');
/**
 * WarterSupplySettings Controller
 *
 * @property WarterSupplySetting $WarterSupplySetting
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class WarterSupplySettingsController extends AppController {

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
		$this->set('page_title','Warter supply setting List');
		$this->WarterSupplySetting->recursive = 0;
		$this->paginate = array('order' => array('WarterSupplySetting.id' => 'DESC'));
		$this->set('warterSupplySettings', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Warter supply setting Details');
		if (!$this->WarterSupplySetting->exists($id)) {
			throw new NotFoundException(__('Invalid warter supply setting'));
		}
		$options = array('conditions' => array('WarterSupplySetting.' . $this->WarterSupplySetting->primaryKey => $id));
		$this->set('warterSupplySetting', $this->WarterSupplySetting->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Warter supply setting');
		if ($this->request->is('post')) {
			$this->WarterSupplySetting->create();
			$this->request->data['WarterSupplySetting']['created_at'] = $this->current_datetime();
			$this->request->data['WarterSupplySetting']['created_by'] = $this->UserAuth->getUserId();
			$data = $this->request->data; 

			$data['WarterSupplySetting']['create_date'] = $this->current_datetime("YY-M-D :H:M:S");

			if ($this->WarterSupplySetting->save($data)) {
				$this->Session->setFlash(__('The warter supply setting has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The warter supply setting could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$users = $this->WarterSupplySetting->User->find('list');
		$locations = $this->WarterSupplySetting->Location->find('list');
		$this->set(compact('users','locations'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Warter supply setting');
		$this->WarterSupplySetting->id = $id;
		if (!$this->WarterSupplySetting->exists($id)) {
			throw new NotFoundException(__('Invalid warter supply setting'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['WarterSupplySetting']['updated_by'] = $this->UserAuth->getUserId();
			
			$data = $this->request->data; 
			$data['WarterSupplySetting']['update_date'] = $this->current_datetime("YY-M-D :H:M:S");

			if ($this->WarterSupplySetting->save($data)) {
				$this->Session->setFlash(__('The warter supply setting has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The warter supply setting could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('WarterSupplySetting.' . $this->WarterSupplySetting->primaryKey => $id));
			$this->request->data = $this->WarterSupplySetting->find('first', $options);
		}
		$users = $this->WarterSupplySetting->User->find('list');
		$locations = $this->WarterSupplySetting->Location->find('list');
		$this->set(compact('users','locations'));
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
		$this->WarterSupplySetting->id = $id;
		if (!$this->WarterSupplySetting->exists()) {
			throw new NotFoundException(__('Invalid warter supply setting'));
		}
		if ($this->WarterSupplySetting->delete()) {
			$this->Session->setFlash(__('Warter supply setting deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Warter supply setting was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
