<?php
App::uses('EmployeeType', 'Model');

/**
 * EmployeeType Test Case
 *
 */
class EmployeeTypeTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.employee_type',
		'app.employee'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->EmployeeType = ClassRegistry::init('EmployeeType');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->EmployeeType);

		parent::tearDown();
	}

}
