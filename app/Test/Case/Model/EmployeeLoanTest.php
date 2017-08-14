<?php
App::uses('EmployeeLoan', 'Model');

/**
 * EmployeeLoan Test Case
 *
 */
class EmployeeLoanTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.employee_loan',
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
		$this->EmployeeLoan = ClassRegistry::init('EmployeeLoan');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->EmployeeLoan);

		parent::tearDown();
	}

}
