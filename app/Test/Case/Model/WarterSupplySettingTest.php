<?php
App::uses('WarterSupplySetting', 'Model');

/**
 * WarterSupplySetting Test Case
 *
 */
class WarterSupplySettingTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.warter_supply_setting',
		'app.user'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->WarterSupplySetting = ClassRegistry::init('WarterSupplySetting');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->WarterSupplySetting);

		parent::tearDown();
	}

}
