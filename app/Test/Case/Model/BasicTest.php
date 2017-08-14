<?php
App::uses('Basic', 'Model');

/**
 * Basic Test Case
 *
 */
class BasicTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.basic',
		'app.employee'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->Basic = ClassRegistry::init('Basic');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->Basic);

		parent::tearDown();
	}

}
