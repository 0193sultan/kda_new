<?php
App::uses('AppController', 'Controller');
/**
 * ContructorProjectNames Controller
 *
 * @property ContructorProjectName $ContructorProjectName
 * @property PaginatorComponent $Paginator
 */
class ContructorProjectNamesController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator');

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->set('page_title','Contructor project name List');
		$this->ContructorProjectName->recursive = 0;
		$this->paginate = array('order' => array('ContructorProjectName.id' => 'DESC'));
		$this->set('contructorProjectNames', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Contructor project name Details');
		if (!$this->ContructorProjectName->exists($id)) {
			throw new NotFoundException(__('Invalid contructor project name'));
		}
		$options = array('conditions' => array('ContructorProjectName.' . $this->ContructorProjectName->primaryKey => $id));
		$this->set('contructorProjectName', $this->ContructorProjectName->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Contructor project name');
		if ($this->request->is('post')) {
			/*pr($this->request->data['ContructorProjectName']['project_start_date']);
			die();*/
			$this->ContructorProjectName->create();
			$this->request->data['ContructorProjectName']['created_at'] = $this->current_datetime();
			$this->request->data['ContructorProjectName']['user_id'] = $this->UserAuth->getUserId();
			$this->request->data['ContructorProjectName']['project_start_date'] = date("Y-m-d", strtotime($this->request->data['ContructorProjectName']['project_start_date'])); 
			$total_project_value = $this->request->data['ContructorProjectName']['project_value'];
			$shedule_money_percentage = $this->request->data['ContructorProjectName']['schedule_money_%']; 
			$schedule_money = ($total_project_value * $shedule_money_percentage)/100;


			$security_money_percentage = $this->request->data['ContructorProjectName']['security_money_%']; 
			$security_money = ($total_project_value * $security_money_percentage)/100;

			$this->request->data['ContructorProjectName']['schedule_money'] = $schedule_money;
			$this->request->data['ContructorProjectName']['security_money'] = $security_money;
			// $this->request->data['ContructorProjectName']['schedule_money'] = 0;			
			if ($this->ContructorProjectName->save($this->request->data)) {
				$this->Session->setFlash(__('The contructor project name has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The contructor project name could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$projectTypes = $this->ContructorProjectName->ProjectType->find('list');
		$users = $this->ContructorProjectName->User->find('list');
		$this->set(compact('projectTypes', 'users'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Contructor project name');
		$this->ContructorProjectName->id = $id;
		if (!$this->ContructorProjectName->exists($id)) {
			throw new NotFoundException(__('Invalid contructor project name'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['ContructorProjectName']['updated_by'] = $this->UserAuth->getUserId();
			$this->request->data['ContructorProjectName']['updated_at'] = $this->current_datetime();
			$this->request->data['ContructorProjectName']['project_start_date'] = date("Y-m-d", strtotime($this->request->data['ContructorProjectName']['project_start_date']));

			$total_project_value = $this->request->data['ContructorProjectName']['project_value'];
			$shedule_money_percentage = $this->request->data['ContructorProjectName']['schedule_money_%']; 
			$schedule_money = ($total_project_value * $shedule_money_percentage)/100;


			$security_money_percentage = $this->request->data['ContructorProjectName']['security_money_%']; 
			$security_money = ($total_project_value * $security_money_percentage)/100;

			$this->request->data['ContructorProjectName']['schedule_money'] = $schedule_money;
			$this->request->data['ContructorProjectName']['security_money'] = $security_money;
			
			
			if ($this->ContructorProjectName->save($this->request->data)) {
				$this->Session->setFlash(__('The contructor project name has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The contructor project name could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('ContructorProjectName.' . $this->ContructorProjectName->primaryKey => $id));
			$this->request->data = $this->ContructorProjectName->find('first', $options);
		}
		$projectTypes = $this->ContructorProjectName->ProjectType->find('list');
		$users = $this->ContructorProjectName->User->find('list');
		$this->set(compact('projectTypes', 'users'));
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
		$this->ContructorProjectName->id = $id;
		if (!$this->ContructorProjectName->exists()) {
			throw new NotFoundException(__('Invalid contructor project name'));
		}
		if ($this->ContructorProjectName->delete()) {
			$this->Session->setFlash(__('Contructor project name deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Contructor project name was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
