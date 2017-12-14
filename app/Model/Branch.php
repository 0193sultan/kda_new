<?php
App::uses('AppModel', 'Model');
/**
 * Branch Model
 *
 * @property Bank $Bank
 * @property User $User
 * @property BankAccount $BankAccount
 * @property DailyTransaction $DailyTransaction
 */
class Branch extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'branch';

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		'bank_id' => array(
			'notEmpty' => array(
				'rule' => array('notEmpty'),
				'message' => 'Please Select a Bank',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'branch' => array(
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
		'BankAccount' => array(
			'className' => 'BankAccount',
			'foreignKey' => 'branch_id',
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
			'foreignKey' => 'branch_id',
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
