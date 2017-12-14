<?php
App::uses('StockGood', 'Model');

/**
 * StockGood Test Case
 *
 */
class StockGoodTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.stock_good',
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
		$this->StockGood = ClassRegistry::init('StockGood');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->StockGood);

		parent::tearDown();
	}

}
