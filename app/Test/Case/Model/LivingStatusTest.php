<?php
App::uses('LivingStatus', 'Model');

/**
 * LivingStatus Test Case
 *
 */
class LivingStatusTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.living_status',
		'app.employee'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->LivingStatus = ClassRegistry::init('LivingStatus');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->LivingStatus);

		parent::tearDown();
	}

}
