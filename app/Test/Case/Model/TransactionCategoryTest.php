<?php
App::uses('TransactionCategory', 'Model');

/**
 * TransactionCategory Test Case
 *
 */
class TransactionCategoryTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.transaction_category'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->TransactionCategory = ClassRegistry::init('TransactionCategory');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->TransactionCategory);

		parent::tearDown();
	}

}
