<?php
App::uses('VatAccount', 'Model');

/**
 * VatAccount Test Case
 *
 */
class VatAccountTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.vat_account',
		'app.vat_collection'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->VatAccount = ClassRegistry::init('VatAccount');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->VatAccount);

		parent::tearDown();
	}

}
