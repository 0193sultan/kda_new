<?php
App::uses('AccHeadList', 'Model');

/**
 * AccHeadList Test Case
 *
 */
class AccHeadListTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.acc_head_list',
		'app.acc_head_type',
		'app.daily_transaction',
		'app.entry_type',
		'app.asset_detail',
		'app.user',
		'app.income_expense_detail',
		'app.bank',
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
		'app.monthly_attendance_entry',
		'app.fiscal_year',
		'app.fiscal_year_setting',
		'app.month',
		'app.employee_salary_sheet',
		'app.gpf_subscription',
		'app.loan_recovery',
		'app.monthly_salary_note',
		'app.employee_bonus',
		'app.branch',
		'app.bank_account',
		'app.acc_effect',
		'app.action_head',
		'app.action_sub_head'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->AccHeadList = ClassRegistry::init('AccHeadList');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->AccHeadList);

		parent::tearDown();
	}

}
