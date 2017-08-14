<?php
App::uses('AppController', 'Controller');
/**
 * ConfigMetas Controller
 *
 * @property ConfigMeta $ConfigMeta
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ConfigMetasController extends AppController {

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
		$this->set('page_title','Config meta List');
		$this->ConfigMeta->recursive = 0;
		$this->paginate = array('order' => array('ConfigMeta.id' => 'DESC'));
		$this->set('configMetas', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Config meta Details');
		if (!$this->ConfigMeta->exists($id)) {
			throw new NotFoundException(__('Invalid config meta'));
		}
		$options = array('conditions' => array('ConfigMeta.' . $this->ConfigMeta->primaryKey => $id));
		$this->set('configMeta', $this->ConfigMeta->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Config meta');
		if ($this->request->is('post')) {
			$this->ConfigMeta->create();

			$data = $this->request->data;
			$data['ConfigMeta']['create_date'] = $this->current_datetime("YY-M-D :H:M:S");

			$this->request->data['ConfigMeta']['created_at'] = $this->current_datetime();
			$this->request->data['ConfigMeta']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->ConfigMeta->save($data)) {
				$this->Session->setFlash(__('The config meta has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The config meta could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$users = $this->ConfigMeta->User->find('list');
		$this->set(compact('users'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Config meta');
		$this->ConfigMeta->id = $id;
		if (!$this->ConfigMeta->exists($id)) {
			throw new NotFoundException(__('Invalid config meta'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['ConfigMeta']['updated_by'] = $this->UserAuth->getUserId();
			$data = $this->request->data;
			$data['ConfigMeta']['update_date'] = $this->current_datetime("YY-M-D :H:M:S");

			if ($this->ConfigMeta->save($data)) {
				$this->Session->setFlash(__('The config meta has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The config meta could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('ConfigMeta.' . $this->ConfigMeta->primaryKey => $id));
			$this->request->data = $this->ConfigMeta->find('first', $options);
		}
		$users = $this->ConfigMeta->User->find('list');
		$this->set(compact('users'));
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
		$this->ConfigMeta->id = $id;
		if (!$this->ConfigMeta->exists()) {
			throw new NotFoundException(__('Invalid config meta'));
		}
		if ($this->ConfigMeta->delete()) {
			$this->Session->setFlash(__('Config meta deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Config meta was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
