<?php
App::uses('MonthlyAttendanceEntry', 'Model');

/**
 * MonthlyAttendanceEntry Test Case
 *
 */
class MonthlyAttendanceEntryTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
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
		$this->MonthlyAttendanceEntry = ClassRegistry::init('MonthlyAttendanceEntry');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->MonthlyAttendanceEntry);

		parent::tearDown();
	}

}
