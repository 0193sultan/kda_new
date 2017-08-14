<?php
App::uses('EmployeeAllowance', 'Model');

/**
 * EmployeeAllowance Test Case
 *
 */
class EmployeeAllowanceTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.employee_allowance',
		'app.employee',
		'app.employee_grade',
		'app.scale',
		'app.designation',
		'app.basic',
		'app.new_basic',
		'app.quota',
		'app.employee_type',
		'app.religion',
		'app.job_status',
		'app.bank',
		'app.sex',
		'app.marital_status',
		'app.living_status',
		'app.department',
		'app.employee_child',
		'app.edu_status'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->EmployeeAllowance = ClassRegistry::init('EmployeeAllowance');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->EmployeeAllowance);

		parent::tearDown();
	}

}
