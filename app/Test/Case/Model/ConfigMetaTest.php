<?php
App::uses('ConfigMeta', 'Model');

/**
 * ConfigMeta Test Case
 *
 */
class ConfigMetaTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.config_meta',
		'app.user'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->ConfigMeta = ClassRegistry::init('ConfigMeta');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->ConfigMeta);

		parent::tearDown();
	}

}
