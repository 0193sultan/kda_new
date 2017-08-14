<?php
App::uses('EmployeeChild', 'Model');

/**
 * EmployeeChild Test Case
 *
 */
class EmployeeChildTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.employee_child',
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
		'app.edu_status'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->EmployeeChild = ClassRegistry::init('EmployeeChild');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->EmployeeChild);

		parent::tearDown();
	}

}
