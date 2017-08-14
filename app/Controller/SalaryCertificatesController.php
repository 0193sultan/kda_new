<?php
App::uses('AppController', 'Controller');
/**
 * BankInfos Controller
 *
 * @property BankInfo $BankInfo
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class SalaryCertificatesController extends AppController {

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
		#################################################
		#### For Search form data
		#################################################

		$this->loadModel('Department');
		$departments = $this->Department->find('list');	

		$this->loadModel('Designation');
		$Designations = $this->Designation->find('list');

		$this->loadModel('FiscalYear');
		$FiscalYears = $this->FiscalYear->find('list');

		$this->loadModel('Employee');
		$Employees = $this->Employee->find('list');

		$this->loadModel('Month');
		$Month = $this->Month->find('list');


		$this->set(compact('departments', 'Designations', 'FiscalYears', 'Employees', 'Month'));
		
		#################################################
		#### For Search form data End 
		#################################################


		#################################################
		#### Received submitted form data start
		#################################################

		pr($this->request->data);
		if($this->request->data('department_id') !=0)
		{
			$query = array('Employee.department_id' => $this->request->data('department_id')); 

		}

		if($this->request->data('designation_id') !=0)
		{
			$query = array('Employee.designation_id' => $this->request->data('designation_id')); 

		}

		$query = array('EmployeeSalarySheet.fiscal_year_id' => $this->request->data('fiscal_year_id'));

		if($this->request->data('name') !=0)
		{
			$query = array('EmployeeSalarySheet.fiscal_year_id' => $this->request->data('fiscal_year_id'),'AND' => array('EmployeeSalarySheet.employee_id' => $this->request->data('name')));

		}

			$between_con = array('EmployeeSalarySheet.month_id >= ' => $this->request->data('start_month_id'),'EmployeeSalarySheet.month_id <= ' => $this->request->data('end_month_id'));
		
		###############################################################
		##### for get start month and end month in print page start
		###############################################################

			$_SESSION['start_month'] = $this->request->data('start_month_id');
			$_SESSION['end_month'] = $this->request->data('end_month_id');

		###############################################################
		##### for get start month and end month in print page end
		###############################################################

		$this->loadModel('EmployeeSalarySheet');
		$this->EmployeeSalarySheet->recursive = 2;
		$sal = $this->EmployeeSalarySheet->find('all',array('conditions' => array($query, 'AND' => array($between_con))));
		
		$this->set(compact('sal'));

		#################################################
		#### Received submitted form data end
		#################################################

	}

	public function get_call()
	{
		$department = $this->request->data('department_name');
		$designation = $this->request->data('designation');
		$condition = array();
		if($department != 0 && $designation != 0)
		{
			$condition = array('Employee.department_id' => $department, 'AND' => array('Employee.designation_id' =>$designation));
		}

		else if($designation != 0 && $department == 0)
		{
			$condition['Employee.designation_id'] = $designation;
		}

		else if($designation == 0 && $department != 0)
		{
			$condition['Employee.department_id'] = $department;
		}

		$this->loadModel('Employee');
		$emp =  $this->Employee->find('list',array('conditions' => array($condition)));
		$empls = array('All') + $emp;
		foreach ($empls as $key => $value) 
		{
			echo "<option value= ".$key.">".$value."</option>";
		}

		$this->autoRender =  false;
	}

	public function admin_print_view($emp_id = null, $fiscal_year_id = null)
	{
		$this->loadModel('EmployeeSalarySheet');
		$this->EmployeeSalarySheet->recursive = 2;

		//$res =  $this->EmployeeSalarySheet->find('all', array('conditions' => array('EmployeeSalarySheet.id' => $id)));

		$start_month_id =  $_SESSION['start_month'];
		$end_month_id = $_SESSION['end_month'];

		$between_con = array('EmployeeSalarySheet.month_id <= ' => $start_month_id,'EmployeeSalarySheet.month_id >= ' => $end_month_id);

		$res =  $this->EmployeeSalarySheet->find('all', array('fields' => array('Employee.name as name', 'Employee.id as id', 'EmployeeSalarySheet.current_basic as current_basic', 'EmployeeSalarySheet.fiscal_year_id as fiscal_year_id', 'Employee.joining_date as joining_date', 'sum(EmployeeSalarySheet.current_basic) as current_basic_sum', 'sum(EmployeeSalarySheet.house_rent) as house_rent', 'sum(EmployeeSalarySheet.education) as education', 'sum(EmployeeSalarySheet.medical) as medical', 'sum(EmployeeSalarySheet.tiffin) as tiffin', 'sum(EmployeeSalarySheet.convance) as convance', 'sum(EmployeeSalarySheet.bicycle_loan) as bicycle_loan', 'sum(EmployeeSalarySheet.gpf) as gpf', 'sum(EmployeeSalarySheet.house_build_recovery) as house_build_recovery', 'sum(EmployeeSalarySheet.computer_loan) as computer_loan') ,'conditions' => array('EmployeeSalarySheet.employee_id' => $emp_id, 'AND' => array('EmployeeSalarySheet.fiscal_year_id' =>$fiscal_year_id, 'AND' => array($between_con) ))));

		$this->loadModel('Month');
		$start_month = $this->Month->find('list',array('conditions' => array('Month.id' => $start_month_id)));
		$end_month = $this->Month->find('list',array('conditions' => array('Month.id' => $end_month_id)));
		$start_month = array_values($start_month); #start array values from 0 ;
		$end_month = array_values($end_month);
		
		$this->loadModel('Employee');
		$designation = $this->Employee->find('all',array('conditions' => array('Employee.id' =>$res[0]['Employee']['id'])));


		$this->set(compact('res','start_month','end_month','designation'));
	}



}