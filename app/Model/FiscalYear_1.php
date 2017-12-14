<?php
App::uses('AppModel', 'Model');
/**
 * FiscalYear Model
 *
 * @property AnnualDepriciation $AnnualDepriciation
 * @property BudgetDetail $BudgetDetail
 * @property ContructorAdvancePayment $ContructorAdvancePayment
 * @property ContructorBillPayment $ContructorBillPayment
 * @property DailyTransaction $DailyTransaction
 * @property DueSalarySheet $DueSalarySheet
 * @property EmployeeBonus $EmployeeBonus
 * @property EmployeeSalarySheet $EmployeeSalarySheet
 * @property FiscalYearSetting $FiscalYearSetting
 * @property GpfSubscription $GpfSubscription
 * @property LoanRecovery $LoanRecovery
 * @property MonthlyAttendanceEntry $MonthlyAttendanceEntry
 * @property MonthlyOthersEnty $MonthlyOthersEnty
 * @property MonthlySalaryNote $MonthlySalaryNote
 * @property SecurityDepositeReturn $SecurityDepositeReturn
 * @property WorkOrder $WorkOrder
 * @property YearClosingBalanceDetail $YearClosingBalanceDetail
 * @property YearClosing $YearClosing
 */
class FiscalYear extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'name';

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		'id' => array(
			'notEmpty' => array(
				'rule' => array('notEmpty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
	);

	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * hasMany associations
 *
 * @var array
 */
	public $hasMany = array(
		'AnnualDepriciation' => array(
			'className' => 'AnnualDepriciation',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'BudgetDetail' => array(
			'className' => 'BudgetDetail',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'ContructorAdvancePayment' => array(
			'className' => 'ContructorAdvancePayment',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'ContructorBillPayment' => array(
			'className' => 'ContructorBillPayment',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'DailyTransaction' => array(
			'className' => 'DailyTransaction',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'DueSalarySheet' => array(
			'className' => 'DueSalarySheet',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'EmployeeBonus' => array(
			'className' => 'EmployeeBonus',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'EmployeeSalarySheet' => array(
			'className' => 'EmployeeSalarySheet',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'FiscalYearSetting' => array(
			'className' => 'FiscalYearSetting',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'GpfSubscription' => array(
			'className' => 'GpfSubscription',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'LoanRecovery' => array(
			'className' => 'LoanRecovery',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'MonthlyAttendanceEntry' => array(
			'className' => 'MonthlyAttendanceEntry',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'MonthlyOthersEnty' => array(
			'className' => 'MonthlyOthersEnty',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'MonthlySalaryNote' => array(
			'className' => 'MonthlySalaryNote',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'SecurityDepositeReturn' => array(
			'className' => 'SecurityDepositeReturn',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'WorkOrder' => array(
			'className' => 'WorkOrder',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'YearClosingBalanceDetail' => array(
			'className' => 'YearClosingBalanceDetail',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		),
		'YearClosing' => array(
			'className' => 'YearClosing',
			'foreignKey' => 'fiscal_year_id',
			'dependent' => false,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		)
	);

}
