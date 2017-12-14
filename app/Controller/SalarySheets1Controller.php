<?php
App::uses('AppController', 'Controller');
/**
 * Sallery Shit
 *
 * @property Employee $Employee
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class SalarySheetsController extends AppController {
 public $uses = array();
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
		$this->set('page_title','Sallery Shit');
		$this->loadModel('Employee');
		$this->Employee->recursive = 0;
		$this->paginate = array('order' => array('Employee.id' => 'DESC'));
		$departments=$this->Employee->Department->find('list');
		
		$this->set('employees', $this->paginate());
		$this->set('department',$departments);
	}
}
