<?php
App::uses('AppController', 'Controller');
/**
 * Departments Controller
 *
 * @property Department $Department
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class bkup_01_augest_MonthlySalaryNotesController extends AppController {

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
	public function admin_index() 
	{
		pr($this->request->data);

		$bank_id = $this->request->data('bank_name');
		$fiscal_year_id = $this->request->data('fiscal_year');
		$month_id = $this->request->data('month_id');

		$this->loadModel('FiscalYear');
		$this->FiscalYear->recursive = -1;
		$fiscalyears = $this->FiscalYear->find('list');
		
		$fYear = $this->FiscalYear->find('all',array('conditions' => array('FiscalYear.id' =>$fiscal_year_id)));

		$this->loadModel('Month');
		$months = $this->Month->find('list');
		
		//$mnth = $this->Month->find('all', array('conditions' => array('Month.id' =>$month_id_start)));

		$this->loadModel('BankInfo');
		$banks = $this->BankInfo->find('list');

		$conditions = array();

		if($bank_id != 0)
		{
			$conditions['Employee.bank_info_id'] = $bank_id;
		}

		$conditions['EmployeeSalarySheet.fiscal_year_id'] = $fiscal_year_id;
		$conditions['EmployeeSalarySheet.month_id'] = $month_id;

		$this->loadModel('EmployeeSalarySheet');
		$this->EmployeeSalarySheet->recursive = 2;

		//$res = $this->EmployeeSalarySheet->find('all');
		
		$res = $this->EmployeeSalarySheet->find('all', array('conditions' => $conditions));

		$this->set(compact('res', 'fiscalyears', 'months', 'banks'));
	}


}