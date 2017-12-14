<?php
App::uses('AppModel', 'Model');
/**
 * AssetDetail Model
 *
 * @property EntryType $EntryType
 * @property DailyTransaction $DailyTransaction
 * @property AccHeadList $AccHeadList
 * @property AccSubHeadList $AccSubHeadList
 * @property User $User
 */
class AssetDetail extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'daily_transaction_id';

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
		'EntryType' => array(
			'className' => 'EntryType',
			'foreignKey' => 'entry_type_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'DailyTransaction' => array(
			'className' => 'DailyTransaction',
			'foreignKey' => 'daily_transaction_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'AccHeadList' => array(
			'className' => 'AccHeadList',
			'foreignKey' => 'acc_head_list_id',
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
