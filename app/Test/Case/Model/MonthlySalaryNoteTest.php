<?php
App::uses('MonthlySalaryNote', 'Model');

/**
 * MonthlySalaryNote Test Case
 *
 */
class MonthlySalaryNoteTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.monthly_salary_note',
		'app.month',
		'app.fiscal_year',
		'app.fiscal_year_setting',
		'app.loan_recovery',
		'app.employee_loan',
		'app.employee',
		'app.employee_grade',
		'app.scale',
		'app.designation',
		'app.basic',
		'app.quota',
		'app.employee_type',
		'app.religion',
		'app.job_status',
		'app.bank_info',
		'app.sex',
		'app.marital_status',
		'app.living_status',
		'app.department',
		'app.employee_allowance',
		'app.employee_recovery',
		'app.employee_child',
		'app.edu_status',
		'app.loan_type',
		'app.loan',
		'app.bank_info',
		'app.user'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->MonthlySalaryNote = ClassRegistry::init('MonthlySalaryNote');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->MonthlySalaryNote);

		parent::tearDown();
	}

}
