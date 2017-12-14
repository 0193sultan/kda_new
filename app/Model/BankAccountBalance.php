<?php
App::uses('AppModel', 'Model');
/**
 * BankAccountBalance Model
 *
 * @property DailyTransation $DailyTransation
 * @property BankInfo $BankInfo
 * @property Branch $Branch
 */
class BankAccountBalance extends AppModel {

/**
 * Use table
 *
 * @var mixed False or table name
 */
	public $useTable = 'bank_account_balance';

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'id';

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
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
		'DailyTransaction' => array(
			'className' => 'DailyTransaction',
			'foreignKey' => 'daily_transaction_id',
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
		),
		'Branch' => array(
			'className' => 'Branch',
			'foreignKey' => 'branch_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
