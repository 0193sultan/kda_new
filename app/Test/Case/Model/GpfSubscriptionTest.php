<?php
App::uses('GpfSubscription', 'Model');

/**
 * GpfSubscription Test Case
 *
 */
class GpfSubscriptionTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.gpf_subscription',
		'app.employee',
		'app.employee_grade',
		'app.scale',
		'app.designation',
		'app.quota',
		'app.employee_type',
		'app.religion',
		'app.job_status',
		'app.bank_info',
		'app.sex',
		'app.marital_status',
		'app.living_status',
		'app.department',
		'app.location',
		'app.employee_allowance',
		'app.employee_recovery',
		'app.employee_child',
		'app.edu_status',
		'app.monthly_other',
		'app.employee_loan',
		'app.loan_type',
		'app.loan',
		'app.monthly_attendance_entry'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->GpfSubscription = ClassRegistry::init('GpfSubscription');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->GpfSubscription);

		parent::tearDown();
	}

}
