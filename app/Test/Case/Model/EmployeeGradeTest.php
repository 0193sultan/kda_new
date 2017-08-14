<?php
App::uses('EmployeeGrade', 'Model');

/**
 * EmployeeGrade Test Case
 *
 */
class EmployeeGradeTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.employee_grade',
		'app.employee'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->EmployeeGrade = ClassRegistry::init('EmployeeGrade');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->EmployeeGrade);

		parent::tearDown();
	}

}
