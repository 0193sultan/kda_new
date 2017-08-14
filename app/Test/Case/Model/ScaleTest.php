<?php
App::uses('Scale', 'Model');

/**
 * Scale Test Case
 *
 */
class ScaleTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.scale',
		'app.employee'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->Scale = ClassRegistry::init('Scale');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->Scale);

		parent::tearDown();
	}

}
