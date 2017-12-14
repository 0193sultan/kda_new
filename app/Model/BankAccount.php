<?php
App::uses('AppModel', 'Model');
/**
 * BankAccount Model
 *
 * @property Bank $Bank
 * @property Branch $Branch
 * @property User $User
 * @property DailyTransaction $DailyTransaction
 */
class BankAccount extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'account_no';

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		'bank_info_id' => array(
			'notEmpty' => array(
				'rule' => array('notEmpty'),
				'message' => 'Please Select a Bank !',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'branch_id' => array(
			'notEmpty' => array(
				'rule' => array('notEmpty'),
				'message' => 'Please Select a Branch !',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'account_no' => array(
			'notEmpty' => array(
				'rule' => array('notEmpty'),
				'message' => 'Empty field not allowed !',
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
		),
		'User' => array(
			'className' => 'User',
			'foreignKey' => 'user_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);

/**
 * hasMany associations
 *
 * @var array
 */
	public $hasMany = array(
		'DailyTransaction' => array(
			'className' => 'DailyTransaction',
			'foreignKey' => 'bank_account_id',
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
