<?php
App::uses('LoanType', 'Model');

/**
 * LoanType Test Case
 *
 */
class LoanTypeTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.loan_type',
		'app.employee_loan',
		'app.loan'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->LoanType = ClassRegistry::init('LoanType');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->LoanType);

		parent::tearDown();
	}

}
