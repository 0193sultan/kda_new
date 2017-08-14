<?php
App::uses('FiscalYearSetting', 'Model');

/**
 * FiscalYearSetting Test Case
 *
 */
class FiscalYearSettingTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.fiscal_year_setting',
		'app.fiscal_year',
		'app.month'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->FiscalYearSetting = ClassRegistry::init('FiscalYearSetting');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->FiscalYearSetting);

		parent::tearDown();
	}

}
