<?php
App::uses('AppController', 'Controller');
/**
 * Designations Controller
 *
 * @property Designation $Designation
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class EmployeeTaxesController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');

	public function admin_index()
	{
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

		$this->set(compact('departments', 'Designations', 'FiscalYears', 'Employees'));
		
		#################################################
		#### For Search form data End 
		#################################################

		#################################################
		#### Receive submitted form data
		#################################################

			$emp_id = $this->request->data('name');
			$fiscalYear_id = $this->request->data('fiscal_year_id');
			$con = array();

			if($emp_id != 0)
			{
				$con = array('EmployeeSalarySheet.employee_id' => $emp_id, 'AND' => array('EmployeeSalarySheet.fiscal_year_id' => $fiscalYear_id));
				$tax_amount = $this->get_ttl_tax($emp_id,$fiscalYear_id);
			}
			else
			{
				$con =  array('EmployeeSalarySheet.fiscal_year_id' => $fiscalYear_id);
			    $tax_amount = $this->__net_total_tax($fiscalYear_id);

			}

			$this->loadModel('EmployeeSalarySheet');
			$this->EmployeeSalarySheet->recursive = 2;
			/*$sal = $this->EmployeeSalarySheet->find('all', array('fields' => array('DISTINCT EmployeeSalarySheet.employee_id','EmployeeSalarySheet.id','EmployeeSalarySheet.current_basic','EmployeeSalarySheet.current_basic','EmployeeSalarySheet.fiscal_year_id','EmployeeSalarySheet.month_id'),'conditions' => $con));*/
			$sal = $this->EmployeeSalarySheet->find('all', array('fields' => array('DISTINCT EmployeeSalarySheet.employee_id', 'EmployeeSalarySheet.fiscal_year_id'),'conditions' => $con));
			//pr($sal);
			$this->set(compact('sal','tax_amount'),'emp_id',$emp_id,'fiscalYear',$fiscalYear_id);

		#################################################
		#### Receive submitted form data End 
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

	public function get_ttl_tax($id = null, $fiscalYear = null)
	{
		$this->loadModel('EmployeeSalarySheet');
		$ttl_tax = $this->EmployeeSalarySheet->find('all', array('fields' => array('sum(EmployeeSalarySheet.emp_tax) as emp_tax'), 'conditions' => array('EmployeeSalarySheet.employee_id' => $id, 'AND' => array('EmployeeSalarySheet.fiscal_year_id' =>$fiscalYear))));
		return $ttl_tax;
	}

	private function __net_total_tax($fiscalYear = null)
	{
		$this->loadModel('EmployeeSalarySheet');
		$tax_amount = $this->EmployeeSalarySheet->find('all',array('fields' => array('sum(EmployeeSalarySheet.emp_tax) as emp_tax'), 'conditions' => array('EmployeeSalarySheet.fiscal_year_id' => $fiscalYear)));

		return $tax_amount;
	}

	public function admin_emp_tax_details($em_id = null, $fiscal_year_id = null)
	{
		$this->loadModel('EmployeeSalarySheet');
		$this->EmployeeSalarySheet->recursive = 2;
		$details = $this->EmployeeSalarySheet->find('all',array('conditions' => array('EmployeeSalarySheet.employee_id' => $em_id, 'AND' => array('EmployeeSalarySheet.fiscal_year_id' =>$fiscal_year_id) ) ) );

		$ttl_tax = $this->get_ttl_tax($em_id,$fiscal_year_id);

		$this->set(compact('details', 'ttl_tax'));
	}
}