<?php
App::uses('NewBasic', 'Model');

/**
 * NewBasic Test Case
 *
 */
class NewBasicTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.new_basic',
		'app.employee'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->NewBasic = ClassRegistry::init('NewBasic');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->NewBasic);

		parent::tearDown();
	}

}
