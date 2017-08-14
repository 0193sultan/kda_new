<?php
App::uses('EduStatus', 'Model');

/**
 * EduStatus Test Case
 *
 */
class EduStatusTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.edu_status',
		'app.employee_child',
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
		'app.department'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->EduStatus = ClassRegistry::init('EduStatus');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->EduStatus);

		parent::tearDown();
	}

}
