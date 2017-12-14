<?php
App::uses('AppModel', 'Model');
/**
 * SecurityDepositeReturn Model
 *
 * @property WorkOrder $WorkOrder
 * @property FiscalYear $FiscalYear
 * @property User $User
 */
class SecurityDepositeReturn extends AppModel {

/**
 * Use table
 *
 * @var mixed False or table name
 */
	public $useTable = 'security_deposite_return';


	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
		'WorkOrder' => array(
			'className' => 'WorkOrder',
			'foreignKey' => 'work_order_id',
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
		'User' => array(
			'className' => 'User',
			'foreignKey' => 'user_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
