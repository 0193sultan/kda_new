<?php
App::uses('HeadWiseAccountBalance', 'Model');

/**
 * HeadWiseAccountBalance Test Case
 *
 */
class HeadWiseAccountBalanceTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.head_wise_account_balance',
		'app.daily_transation',
		'app.head_list'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->HeadWiseAccountBalance = ClassRegistry::init('HeadWiseAccountBalance');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->HeadWiseAccountBalance);

		parent::tearDown();
	}

}
