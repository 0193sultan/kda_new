<?php
App::uses('BankInfo', 'Model');

/**
 * BankInfo Test Case
 *
 */
class BankInfoTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.bank_info',
		'app.user'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->BankInfo = ClassRegistry::init('BankInfo');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->BankInfo);

		parent::tearDown();
	}

}
