<?php
App::uses('BankAccountBalance', 'Model');

/**
 * BankAccountBalance Test Case
 *
 */
class BankAccountBalanceTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.bank_account_balance',
		'app.daily_transation',
		'app.bank_info',
		'app.employee',
		'app.employee_grade',
		'app.scale',
		'app.designation',
		'app.quota',
		'app.employee_type',
		'app.religion',
		'app.job_status',
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
		'app.user',
		'app.bank_account',
		'app.bank',
		'app.daily_transaction',
		'app.acc_head_list',
		'app.acc_head_type',
		'app.asset_detail',
		'app.entry_type',
		'app.income_expense_detail',
		'app.transaction_type',
		'app.transaction_category'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->BankAccountBalance = ClassRegistry::init('BankAccountBalance');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->BankAccountBalance);

		parent::tearDown();
	}

}
