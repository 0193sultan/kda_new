<?php
App::uses('LoanRecovery', 'Model');

/**
 * LoanRecovery Test Case
 *
 */
class LoanRecoveryTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.loan_recovery',
		'app.month',
		'app.fiscal_year',
		'app.monthly_attendance_entry',
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
		$this->LoanRecovery = ClassRegistry::init('LoanRecovery');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->LoanRecovery);

		parent::tearDown();
	}

}
