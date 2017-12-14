<?php
App::uses('MonthlyOthersEntiesSetting', 'Model');

/**
 * MonthlyOthersEntiesSetting Test Case
 *
 */
class MonthlyOthersEntiesSettingTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.monthly_others_enties_setting'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->MonthlyOthersEntiesSetting = ClassRegistry::init('MonthlyOthersEntiesSetting');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->MonthlyOthersEntiesSetting);

		parent::tearDown();
	}

}
