<?php
App::uses('DeductSalary', 'Model');

/**
 * DeductSalary Test Case
 *
 */
class DeductSalaryTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.deduct_salary'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->DeductSalary = ClassRegistry::init('DeductSalary');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->DeductSalary);

		parent::tearDown();
	}

}
