<?php
App::uses('Quota', 'Model');

/**
 * Quota Test Case
 *
 */
class QuotaTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.quota',
		'app.employee'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->Quota = ClassRegistry::init('Quota');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->Quota);

		parent::tearDown();
	}

}
