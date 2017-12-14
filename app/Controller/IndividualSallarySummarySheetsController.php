<?php
App::uses('AppController', 'Controller');
/**
 * Departments Controller
 *
 * @property Department $Department
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class IndividualSallarySummarySheetsController extends AppController {

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
		$employee_name_id = $this->request->data('employee_name_id');
		$department_name_id = $this->request->data('department_name_id');

		$this->loadModel('FiscalYear');
		$this->FiscalYear->recursive = -1;
		$fiscalyears = $this->FiscalYear->find('list');
		
		$fYear = $this->FiscalYear->find('all',array('conditions' => array('FiscalYear.id' =>$fiscal_year_id)));

		$this->loadModel('Month');
		$months = $this->Month->find('list');
		
		$month_start = $this->Month->find('all', array('conditions' => array('Month.id' =>$month_id_start)));
		$month_end = $this->Month->find('all', array('conditions' => array('Month.id' =>$month_id_end)));


		$between_con = array('EmployeeSalarySheet.month_id >=' => $month_id_start,
      'EmployeeSalarySheet.month_id <=' => $month_id_end );

		$between_con_bonus = array('EmployeeBonus.month_id >=' => $month_id_start,
      'EmployeeBonus.month_id <=' => $month_id_end );


		$this->loadModel('EmployeeSalarySheet');
		$this->EmployeeSalarySheet->recursive = 2;
		$salarySheets = $this->EmployeeSalarySheet->find('all',array('fields' =>array('sum(EmployeeSalarySheet.current_basic) AS basic_salary', 'sum(EmployeeSalarySheet.new_basic_salary) AS new_basic_salary', 'sum(EmployeeSalarySheet.da) AS da', 'sum(EmployeeSalarySheet.pp) AS 	pp', 'sum(EmployeeSalarySheet.medical) AS 	medical', 'sum(EmployeeSalarySheet.convance) AS convance', 'sum(EmployeeSalarySheet.wash) AS wash', 'sum(EmployeeSalarySheet.mobile) AS mobile', 'sum(EmployeeSalarySheet.cycle) AS cycle', 'sum(EmployeeSalarySheet.charge) AS charge', 'sum(EmployeeSalarySheet.others_recovery) AS other_sub', 'sum(EmployeeSalarySheet.other) AS other', 'sum(EmployeeSalarySheet.gross_pay) AS gross_pay', 'sum(EmployeeSalarySheet.gpf) AS gpf', 'sum(EmployeeSalarySheet.gpf_loan) AS gpf_loan', 'sum(EmployeeSalarySheet.group_insurance) AS group_insurance', 'sum(EmployeeSalarySheet.house_rent) AS house_rent', 'sum(EmployeeSalarySheet.house_loan_recovery) AS house_loan_recovery', 'sum(EmployeeSalarySheet.vehicle_recovery) AS vechcale_recovery', 'sum(EmployeeSalarySheet.telephone_recovery) AS telephone_recovery', 'sum(EmployeeSalarySheet.tiffin) AS tiffin', 'sum(EmployeeSalarySheet.motorcycle_loan) AS motorcycle_loan', 'sum(EmployeeSalarySheet.house_build_recovery) AS house_build_recovery', 'sum(EmployeeSalarySheet.house_repair_recovery) AS house_repair_reovery', 'sum(EmployeeSalarySheet.bycycle_loan) AS bicycle_loan', 'sum(EmployeeSalarySheet.computer_loan) AS computer_loan', 'sum(EmployeeSalarySheet.car_loan) AS car_loan', 'sum(EmployeeSalarySheet.extra_loan) AS extra_loan', 'sum(EmployeeSalarySheet.education) AS education', 'sum(EmployeeSalarySheet.fixed_house_rent_recovery) AS fixed_house_rent_recovery', 'sum(EmployeeSalarySheet.health_insurance) AS health_insurance', 'sum(EmployeeSalarySheet.water_supply_recovery) AS water_supply_recovery', 'sum(EmployeeSalarySheet.electricity_recovery) AS electricity_recovery', 'sum(EmployeeSalarySheet.bf_recovery) AS bf_recovery', 'sum(EmployeeSalarySheet.gi) AS group_insurance_sum', 'sum(EmployeeSalarySheet.emp_tax) AS tax', 'sum(EmployeeSalarySheet.tin_shade_recovery) AS tin_shade_recovery', 'sum(EmployeeSalarySheet.total_recovery) AS total_payable' ),'conditions' => array('EmployeeSalarySheet.employee_id'=>$employee_name_id, 'EmployeeSalarySheet.fiscal_year_id'=>$fiscal_year_id, 'AND' => array($between_con))));

		$this->loadModel('EmployeeBonus');
		$individual_boisakh_employee_bonus = $this->EmployeeBonus->find('all', array(
				'conditions'=>array(
						'EmployeeBonus.festival_tracking_config_meta_id' => 32,
						'EmployeeBonus.employee_id' => $employee_name_id,
						'EmployeeBonus.fiscal_year_id' => $fiscal_year_id,
						'EmployeeBonus.month_id >=' => $month_id_start,
						'EmployeeBonus.month_id <=' => $month_id_end
					),
				'fields'=>array('sum(bonus_amount) as total_bonus')
			));

		$individual_festival_employee_bonus = $this->EmployeeBonus->find('all', array(
				'conditions'=>array(
						'EmployeeBonus.festival_tracking_config_meta_id !=' => 32,
						'EmployeeBonus.employee_id' => $employee_name_id,
						'EmployeeBonus.fiscal_year_id' => $fiscal_year_id,
						'EmployeeBonus.month_id >=' => $month_id_start,
						'EmployeeBonus.month_id <=' => $month_id_end
					),
				'fields'=>array('sum(bonus_amount) as total_bonus')
			));

        $this->loadModel('Department');
		$department_list = $this->Department->find('list');

        $this->loadModel('Employee');
		$employee_name_list = $this->Employee->find('list', array('fields'=>array('Employee.id', 'Employee.employee_name_bengali')));
		$employee_info = $this->Employee->find('first', array('conditions'=>array('Employee.id'=>$employee_name_id)));

		$this->set(compact('employee_name_list', 'fiscalyears','months','salarySheets', 'fYear', 'month_start', 'month_end', 'EmployeeBonus', 'department_list', 'department_name_id', 'employee_name_id', 'employee_info', 'individual_festival_employee_bonus', 'individual_boisakh_employee_bonus'));

	}


    /*------------------Ajax-----------------*/

    public function admin_get_employee_name_list() {
        $this->loadModel('Employee');
        $department_name_id = $this->request->data['department_name_id'];

        $a['Employee'] = array('id' => '', 'name' => '---- Please Select ----');
        $rs = array($a);

        $employee_name_list = $this->Employee->find('all', array(
                'conditions' => array('Employee.department_id' => $department_name_id),
                'fields' => array('id','employee_name_bengali as name'),
                'recursive'=>-1    
        ));
        $data_array = array_merge($rs,$employee_name_list);

        echo json_encode($data_array);

        $this->autoRender = false;
    }

}