<?php
App::uses('FiscalYear', 'Model');

/**
 * FiscalYear Test Case
 *
 */
class FiscalYearTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.fiscal_year',
		'app.fiscal_year_setting'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->FiscalYear = ClassRegistry::init('FiscalYear');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->FiscalYear);

		parent::tearDown();
	}

}
