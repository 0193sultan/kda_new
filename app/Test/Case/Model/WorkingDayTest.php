<?php
App::uses('WorkingDay', 'Model');

/**
 * WorkingDay Test Case
 *
 */
class WorkingDayTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.working_day',
		'app.month',
		'app.fiscal_year',
		'app.monthly_attendance_entry',
		'app.employee',
		'app.employee_grade',
		'app.scale',
		'app.designation',
		'app.basic',
		'app.new_basic',
		'app.quota',
		'app.employee_type',
		'app.religion',
		'app.job_status',
		'app.bank',
		'app.sex',
		'app.marital_status',
		'app.living_status',
		'app.department',
		'app.employee_allowance',
		'app.employee_child',
		'app.edu_status'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->WorkingDay = ClassRegistry::init('WorkingDay');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->WorkingDay);

		parent::tearDown();
	}

}
