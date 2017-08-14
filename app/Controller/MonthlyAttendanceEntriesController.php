<?php
App::uses('AppController', 'Controller');
/**
 * MonthlyAttendanceEntries Controller
 *
 * @property MonthlyAttendanceEntry $MonthlyAttendanceEntry
 * @property PaginatorComponent $Paginator
 */
class MonthlyAttendanceEntriesController extends AppController {

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
		$this->set('page_title','Monthly attendance entry List');
		$this->MonthlyAttendanceEntry->recursive = 0;
		$this->paginate = array('order' => array('MonthlyAttendanceEntry.id' => 'DESC'));
		$this->set('monthlyAttendanceEntries', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Monthly attendance entry Details');
		if (!$this->MonthlyAttendanceEntry->exists($id)) {
			throw new NotFoundException(__('Invalid monthly attendance entry'));
		}
		$options = array('conditions' => array('MonthlyAttendanceEntry.' . $this->MonthlyAttendanceEntry->primaryKey => $id));
		$this->set('monthlyAttendanceEntry', $this->MonthlyAttendanceEntry->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
	/*	$this->set('page_title','Add Monthly attendance entry');
		if ($this->request->is('post')) {
			$this->MonthlyAttendanceEntry->create();
			$this->request->data['MonthlyAttendanceEntry']['created_at'] = $this->current_datetime();
			$this->request->data['MonthlyAttendanceEntry']['created_by'] = $this->UserAuth->getUserId();			
			if ($this->MonthlyAttendanceEntry->save($this->request->data)) {
				$this->flash(__('Monthlyattendanceentry saved.'), array('action' => 'index'));
			} else {
			}
		}
		$employees = $this->MonthlyAttendanceEntry->Employee->find('list');
		$this->set(compact('employees'));*/

		//++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		//+++++++++++++++=> Manual code
		//++++++++++++++++++++++++++++++++++++++++++++++++++++++++

		$this->loadModel('Department');
		$department = $this->Department->find('list');

		$this->loadModel('Designation');
		$designation = $this->Designation->find('list');

		$this->loadModel('FiscalYear');
		$fiscalyear = $this->FiscalYear->find('list');

		/*$this->loadModel('Month');
		$month = $this->Month->find('list');*/

		$this->set(compact('department','designation','fiscalyear','month'));

	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Monthly attendance entry');
		$this->MonthlyAttendanceEntry->id = $id;
		if (!$this->MonthlyAttendanceEntry->exists($id)) {
			throw new NotFoundException(__('Invalid monthly attendance entry'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['MonthlyAttendanceEntry']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->MonthlyAttendanceEntry->save($this->request->data)) {
				$this->flash(__('The monthly attendance entry has been saved.'), array('action' => 'index'));
			} else {
			}
		} else {
			$options = array('conditions' => array('MonthlyAttendanceEntry.' . $this->MonthlyAttendanceEntry->primaryKey => $id));
			$this->request->data = $this->MonthlyAttendanceEntry->find('first', $options);
		}
		$employees = $this->MonthlyAttendanceEntry->Employee->find('list');
		$this->set(compact('employees'));
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
		$this->MonthlyAttendanceEntry->id = $id;
		if (!$this->MonthlyAttendanceEntry->exists()) {
			throw new NotFoundException(__('Invalid monthly attendance entry'));
		}
		if ($this->MonthlyAttendanceEntry->delete()) {
			$this->flash(__('Monthly attendance entry deleted'), array('action' => 'index'));
		}
		$this->flash(__('Monthly attendance entry was not deleted'), array('action' => 'index'));
		$this->redirect(array('action' => 'index'));
	}

	public function add()
	{
		$this->loadModel('Department');
		$department = $this->Department->find('list');

		$this->loadModel('Designation');
		$designation = $this->Designation->find('list');

		$this->loadModel('FiscalYear');
		$fiscalyear = $this->FiscalYear->find('list');

		/*$this->loadModel('Month');
		$month = $this->Month->find('list');*/

		$this->set(compact('department','designation','fiscalyear','month'));
	}

	public function get_call()
	{
		$department_id = $this->request->data('department_name');
		$designation_id = $this->request->data('designation');
		$this->loadModel('Employee');
		$employee = $this->Employee->find('list', array('conditions' => array('Employee.department_id' => $department_id, 'Employee.designation_id' => $designation_id) ));
		echo "<option>select</option>";
		foreach ($employee as  $key=>$row) {
			echo "<option value='$key'> $row </option>";
		}

		$this->autoRender = false; #this prevent from search a view ........
	}

	public function get_months()
	{
		$year_id = $this->request->data('fiscal_year');
		$this->loadModel('Month');
		$month = $this->Month->find('list', array('conditions' => array('Month.fiscal_year_id' => $year_id) ));
		echo "<option>select</option>";
		foreach ($month as $key => $value) 
		{
			echo "<option value='$key'> $value </option>";
		}
		$this->autoRender = false; #this prevent from search a view ........
	}

	public function attendance_entry_autoComplete()
	{
		$month_id = $this->request->data('month');
		$this->loadModel('working_days');
		$working_days = $this->working_days->find('all', array('conditions' => array('working_days.month_id' => $month_id),'fields' => array('working_days.total_days')));

		foreach ($working_days as $value) {
			foreach ($value as $val) {
				foreach ($val as $row) {
					echo $row;
				}
			}
		}
		$this->autoRender = false; #this prevent from search a view ........
	}

	public function form_data()
	{
		if ($this->request->is('post')) {
		    $this->MonthlyAttendanceEntry->create();
		    $this->MonthlyAttendanceEntry->save($this->request->data);
		}
		//$this->autoRender = false; #this prevent from search a view ........
		$url = BASE_URL."admin/MonthlyAttendanceEntries/";
		header("location:$url");
	}
}
