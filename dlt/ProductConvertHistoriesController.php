<?php
App::uses('AppController', 'Controller');
/**
 * ProductConvertHistories Controller
 *
 * @property ProductConvertHistory $ProductConvertHistory
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ProductConvertHistoriesController extends AppController {

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
		$this->set('page_title','Product convert history List');
		$this->ProductConvertHistory->recursive = 0;
		$this->paginate = array('order' => array('ProductConvertHistory.id' => 'DESC'));

		$this->set('productConvertHistories', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Product convert history Details');
		if (!$this->ProductConvertHistory->exists($id)) {
			throw new NotFoundException(__('Invalid product convert history'));
		}
		$options = array('conditions' => array('ProductConvertHistory.' . $this->ProductConvertHistory->primaryKey => $id));
		$this->set('productConvertHistory', $this->ProductConvertHistory->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Product convert history');
		if ($this->request->is('post')) {
			$this->ProductConvertHistory->create();
			$this->request->data['ProductConvertHistory']['created_at'] = $this->current_datetime();
			$this->request->data['ProductConvertHistory']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->ProductConvertHistory->save($this->request->data)) {
				$this->Session->setFlash(__('The product convert history has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The product convert history could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$stores = $this->ProductConvertHistory->Store->find('list');
		$fromProducts = $this->ProductConvertHistory->FromProduct->find('list');
		$toProducts = $this->ProductConvertHistory->ToProduct->find('list');
		$fromStatuses = $this->ProductConvertHistory->FromStatus->find('list');
		$toStatuses = $this->ProductConvertHistory->ToStatus->find('list');
		$this->set(compact('stores', 'fromProducts', 'toProducts', 'fromStatuses', 'toStatuses'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Product convert history');
		$this->ProductConvertHistory->id = $id;
		if (!$this->ProductConvertHistory->exists($id)) {
			throw new NotFoundException(__('Invalid product convert history'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['ProductConvertHistory']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->ProductConvertHistory->save($this->request->data)) {
				$this->Session->setFlash(__('The product convert history has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The product convert history could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('ProductConvertHistory.' . $this->ProductConvertHistory->primaryKey => $id));
			$this->request->data = $this->ProductConvertHistory->find('first', $options);
		}
		$stores = $this->ProductConvertHistory->Store->find('list');
		$fromProducts = $this->ProductConvertHistory->FromProduct->find('list');
		$toProducts = $this->ProductConvertHistory->ToProduct->find('list');
		$fromStatuses = $this->ProductConvertHistory->FromStatus->find('list');
		$toStatuses = $this->ProductConvertHistory->ToStatus->find('list');
		$this->set(compact('stores', 'fromProducts', 'toProducts', 'fromStatuses', 'toStatuses'));
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
		$this->ProductConvertHistory->id = $id;
		if (!$this->ProductConvertHistory->exists()) {
			throw new NotFoundException(__('Invalid product convert history'));
		}
		if ($this->ProductConvertHistory->delete()) {
			$this->Session->setFlash(__('Product convert history deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Product convert history was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
