<?php
App::uses('AppModel', 'Model');
/**
 * MonthlySalaryNote Model
 *
 * @property Month $Month
 * @property FiscalYear $FiscalYear
 * @property BankInfo $BankInfo
 */
class MonthlySalaryNote extends AppModel {


	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
		'Month' => array(
			'className' => 'Month',
			'foreignKey' => 'month_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'FiscalYear' => array(
			'className' => 'FiscalYear',
			'foreignKey' => 'fiscal_year_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'BankInfo' => array(
			'className' => 'BankInfo',
			'foreignKey' => 'bank_info_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
