<?php
App::uses('EmployeeSalarySheet', 'Model');

/**
 * EmployeeSalarySheet Test Case
 *
 */
class EmployeeSalarySheetTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.employee_salary_sheet',
		'app.employee',
		'app.employee_grade',
		'app.scale',
		'app.designation',
		'app.basic',
		'app.quota',
		'app.employee_type',
		'app.religion',
		'app.job_status',
		'app.bank',
		'app.sex',
		'app.marital_status',
		'app.living_status',
		'app.department',
		'app.employee_allowance',
		'app.employee_recovery',
		'app.employee_child',
		'app.edu_status',
		'app.salary_type',
		'app.fiscal_year',
		'app.fiscal_year_setting',
		'app.month',
		'app.loan_recovery',
		'app.employee_loan',
		'app.loan_type',
		'app.loan'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->EmployeeSalarySheet = ClassRegistry::init('EmployeeSalarySheet');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->EmployeeSalarySheet);

		parent::tearDown();
	}

}
