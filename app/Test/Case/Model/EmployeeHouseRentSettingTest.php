<?php
App::uses('EmployeeHouseRentSetting', 'Model');

/**
 * EmployeeHouseRentSetting Test Case
 *
 */
class EmployeeHouseRentSettingTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.employee_house_rent_setting',
		'app.location',
		'app.user'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->EmployeeHouseRentSetting = ClassRegistry::init('EmployeeHouseRentSetting');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->EmployeeHouseRentSetting);

		parent::tearDown();
	}

}
