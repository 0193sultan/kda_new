<?php
App::uses('FixDeposit', 'Model');

/**
 * FixDeposit Test Case
 *
 */
class FixDepositTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.fix_deposit',
		'app.daily_trasation'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->FixDeposit = ClassRegistry::init('FixDeposit');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->FixDeposit);

		parent::tearDown();
	}

}
