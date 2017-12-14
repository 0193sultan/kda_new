<?php
App::uses('AppModel', 'Model');
/**
 * Month Model
 *
 * @property EmployeeSalarySheet $EmployeeSalarySheet
 * @property FiscalYearSetting $FiscalYearSetting
 * @property GpfSubscription $GpfSubscription
 * @property LoanRecovery $LoanRecovery
 * @property MonthlyAttendanceEntry $MonthlyAttendanceEntry
 * @property MonthlyOther $MonthlyOther
 * @property MonthlySalaryNote $MonthlySalaryNote
 */
class Month extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'name';


	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * hasMany associations
 *
 * @var array
 */
	public $hasMany = array(
		'EmployeeSalarySheet' => array(
			'className' => 'EmployeeSalarySheet',
			'foreignKey' => 'month_id',
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
			'foreignKey' => 'month_id',
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
			'foreignKey' => 'month_id',
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
			'foreignKey' => 'month_id',
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
			'foreignKey' => 'month_id',
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
		'MonthlyOther' => array(
			'className' => 'MonthlyOther',
			'foreignKey' => 'month_id',
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
			'foreignKey' => 'month_id',
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
