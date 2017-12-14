<?php
App::uses('LoanAdjustment', 'Model');

/**
 * LoanAdjustment Test Case
 *
 */
class LoanAdjustmentTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.loan_adjustment',
		'app.employee_loan',
		'app.employee',
		'app.employee_grade',
		'app.scale',
		'app.designation',
		'app.quota',
		'app.employee_type',
		'app.religion',
		'app.job_status',
		'app.bank_info',
		'app.sex',
		'app.marital_status',
		'app.living_status',
		'app.department',
		'app.location',
		'app.employee_allowance',
		'app.employee_recovery',
		'app.employee_child',
		'app.edu_status',
		'app.monthly_other',
		'app.monthly_attendance_entry',
		'app.fiscal_year',
		'app.fiscal_year_setting',
		'app.month',
		'app.employee_salary_sheet',
		'app.gpf_subscription',
		'app.loan_recovery',
		'app.loan',
		'app.loan_type',
		'app.monthly_salary_note'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->LoanAdjustment = ClassRegistry::init('LoanAdjustment');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->LoanAdjustment);

		parent::tearDown();
	}

}
