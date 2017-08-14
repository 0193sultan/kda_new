<?php
App::uses('AppController', 'Controller');
/**
 * Departments Controller
 *
 * @property Department $Department
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class SallarySummarySheetsController extends AppController {

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

		$month_id_start = $this->request->data('month_id_start');
		$month_id_end = $this->request->data('month_id_end');
		$fiscal_year_id = $this->request->data('fiscal_year_id');

		$this->loadModel('FiscalYear');
		$this->FiscalYear->recursive = -1;
		$fiscalyears = $this->FiscalYear->find('list');
		
		$fYear = $this->FiscalYear->find('all',array('conditions' => array('FiscalYear.id' =>$fiscal_year_id)));

		$this->loadModel('Month');
		$months = $this->Month->find('list');
		
		$month_start = $this->Month->find('all', array('conditions' => array('Month.id' =>$month_id_start)));
		$month_end = $this->Month->find('all', array('conditions' => array('Month.id' =>$month_id_end)));


		$between_con = array('EmployeeSalarySheet.month_id <= ' => $month_id_start,
      'EmployeeSalarySheet.month_id >= ' => $month_id_end );
		$this->loadModel('EmployeeSalarySheet');
		$this->EmployeeSalarySheet->recursive = -1;
		$salarySheets = $this->EmployeeSalarySheet->find('all',array('fields' =>array('sum(EmployeeSalarySheet.current_basic) AS basic_salary', 'sum(EmployeeSalarySheet.new_basic_salary) AS new_basic_salary', 'sum(EmployeeSalarySheet.da) AS da', 'sum(EmployeeSalarySheet.pp) AS 	pp', 'sum(EmployeeSalarySheet.medical) AS 	medical', 'sum(EmployeeSalarySheet.convance) AS 	convance', 'sum(EmployeeSalarySheet.wash) AS wash', 'sum(EmployeeSalarySheet.mobile) AS mobile', 'sum(EmployeeSalarySheet.charge) AS charge', 'sum(EmployeeSalarySheet.other) AS other', 'sum(EmployeeSalarySheet.gross_pay) AS gross_pay', 'sum(EmployeeSalarySheet.gpf) AS gpf', 'sum(EmployeeSalarySheet.group_insurance) AS group_insurance', 'sum(EmployeeSalarySheet.house_rent) AS house_rent', 'sum(EmployeeSalarySheet.house_loan_recovery) AS house_loan_recovery', 'sum(EmployeeSalarySheet.vehicle_recovery) AS vechcale_recovery', 'sum(EmployeeSalarySheet.telephone_allowance) AS telephone_allowance', 'sum(EmployeeSalarySheet.tiffin) AS tiffin', 'sum(EmployeeSalarySheet.motorcycle_loan) AS motorcycle_loan', 'sum(EmployeeSalarySheet.house_build_recovery) AS house_build_recovery', 'sum(EmployeeSalarySheet.house_repair_reovery) AS house_repair_reovery', 'sum(EmployeeSalarySheet.bicycle_loan) AS bicycle_loan', 'sum(EmployeeSalarySheet.computer_loan) AS computer_loan', 'sum(EmployeeSalarySheet.car_loan) AS car_loan', 'sum(EmployeeSalarySheet.extra_loan) AS extra_loan', 'sum(EmployeeSalarySheet.education) AS education', 'sum(EmployeeSalarySheet.fixed_house_rent_recovery) AS fixed_house_rent_recovery', 'sum(EmployeeSalarySheet.health_insurance) AS health_insurance', 'sum(EmployeeSalarySheet.water_supply_recovery) AS water_supply_recovery', 'sum(EmployeeSalarySheet.electricity_recovery) AS electricity_recovery', 'sum(EmployeeSalarySheet.bf_recovery) AS bf_recovery', 'sum(EmployeeSalarySheet.gi_recovery) AS gi_recovery', 'sum(EmployeeSalarySheet.tin_shade_recovery) AS tin_shade_recovery', 'sum(EmployeeSalarySheet.total_payable) AS total_payable' ),'conditions' => array('EmployeeSalarySheet.fiscal_year_id'=>$fiscal_year_id, 'AND' => array($between_con) )) );

		$this->set(compact('fiscalyears','months','salarySheets', 'fYear', 'month_start', 'month_end'));

	}


}