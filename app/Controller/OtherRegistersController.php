<?php

App::uses('AppController', 'Controller');

class OtherRegistersController extends AppController
{
	public $components = array('Paginator', 'Session');

	public function admin_index()
	{
		#########################################################################
		###Fill form data start
		#########################################################################

		$this->loadModel('Department');
		$Department = $this->Department->find('list');

		$this->loadModel('Employee');
		$Employee = $this->Employee->find('list');

		#########################################################################
		###Fill form data End
		#########################################################################



		##########################################################################
		###Submitted form data
		##########################################################################

		$employee_id = $this->request->data('employee_id');
		$register_id = $this->request->data('register_id');
		$this->loadModel('EmployeeSalarySheet');

		if($employee_id != 0)
		{
			if($register_id == 1)
			{
				$con = array('EmployeeSalarySheet.employee_id' => $employee_id);
				$fileds = array('sum(EmployeeSalarySheet.bf_recovery) as ttl','EmployeeSalarySheet.employee_id as employee_id');
				$type = 'BF';
			}
			else if($register_id == 2)
			{
				$con = array('EmployeeSalarySheet.employee_id' => $employee_id);
				$fileds = array('sum(EmployeeSalarySheet.gi) as ttl','EmployeeSalarySheet.employee_id as employee_id');
				$type = 'GI';
			}
			else
			{
				$con = array('EmployeeSalarySheet.employee_id' => $employee_id);
				$fileds = array('sum(EmployeeSalarySheet.gpf) as ttl','EmployeeSalarySheet.employee_id as employee_id');
				$type = 'GPF Subcription';
			}

			$res = $this->EmployeeSalarySheet->find('all', array('fields' => $fileds, 'conditions' => $con, 'group' => array('EmployeeSalarySheet.employee_id')));
		}
		else
		{
			if($register_id == 1)
			{
				$fileds = array('sum(EmployeeSalarySheet.bf_recovery) as ttl','EmployeeSalarySheet.employee_id as employee_id');
				$type = 'BF';
			}
			else if($register_id == 2)
			{
				$fileds = array('sum(EmployeeSalarySheet.gi) as ttl','EmployeeSalarySheet.employee_id as employee_id');
				$type = 'GI';
			}
			else
			{
				$fileds = array('sum(EmployeeSalarySheet.gpf) as ttl','EmployeeSalarySheet.employee_id as employee_id');
				$type = 'GPF Subcription';

			}

			$res = $this->EmployeeSalarySheet->find('all', array('fields' => $fileds,'group' => array('EmployeeSalarySheet.employee_id')));		

		}

		#########################################################################
		###Submitted form data end
		#########################################################################

		$this->set(compact('Department', 'Employee', 'res','type'));
	}

	public function admin_get_employee_names() {

	    $department_id = $this->request->data('department_id');

	    $this->loadModel('Employee');
	    $employee = $this->Employee->find('list', array('conditions' => array('Employee.department_id' => $department_id )));

	    echo "<option value=''> select </option>";
	    foreach ($employee as $key => $value) 
	    {
	        echo "<option value=" . $key . ">" . $value . "</option>";
	    }

	    $this->autoRender = false;
	}

	public function get_name_designation_byId($id = null)
	{
		$this->loadModel('Employee');
		$data = $this->Employee->find('all', array('conditions' => array('Employee.id' => $id)));
		return $data;
	}

	public function admin_details($employee_id=null, $register_id = null)
	{
		$this->loadModel('EmployeeSalarySheet');
		if($register_id == 1)
		{
			$con = array('EmployeeSalarySheet.employee_id' => $employee_id);
			$fileds = array('sum(EmployeeSalarySheet.bf_recovery) as ttl','EmployeeSalarySheet.employee_id as employee_id');
			$type = 'BF';
		}
		else if($register_id == 2)
		{
			$con = array('EmployeeSalarySheet.employee_id' => $employee_id);
			$fileds = array('sum(EmployeeSalarySheet.gi) as ttl','EmployeeSalarySheet.employee_id as employee_id');
			$type = 'GI';
		}
		else
		{
			$con = array('EmployeeSalarySheet.employee_id' => $employee_id);
			$fileds = array('sum(EmployeeSalarySheet.gpf) as ttl','EmployeeSalarySheet.employee_id as employee_id');
			$type = 'GPF Subcription';
		}

		$res = $this->EmployeeSalarySheet->find('all', array('fields' => $fileds, 'conditions' => $con, 'group' => array('EmployeeSalarySheet.employee_id')));
		$details = $this->EmployeeSalarySheet->find('all', array('conditions' => $con));
               // $this->EmployeeSalarySheet->recursive=2;
		$this->set(compact('res','type','details'));


	}
}