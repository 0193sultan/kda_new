<?php
App::uses('MonthlyOthersEnty', 'Model');

/**
 * MonthlyOthersEnty Test Case
 *
 */
class MonthlyOthersEntyTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.monthly_others_enty',
		'app.designation',
		'app.employee',
		'app.employee_grade',
		'app.scale',
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
		'app.employee_loan',
		'app.loan_type',
		'app.loan',
		'app.monthly_attendance_entry',
		'app.fiscal_year',
		'app.fiscal_year_setting',
		'app.month',
		'app.employee_salary_sheet',
		'app.gpf_subscription',
		'app.loan_recovery',
		'app.monthly_salary_note'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->MonthlyOthersEnty = ClassRegistry::init('MonthlyOthersEnty');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->MonthlyOthersEnty);

		parent::tearDown();
	}

}
