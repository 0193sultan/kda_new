<?php
App::uses('AppModel', 'Model');
/**
 * EntryType Model
 *
 * @property DailyTransaction $DailyTransaction
 */
class EntryType extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'entry_type';

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		'entry_type' => array(
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
 * hasMany associations
 *
 * @var array
 */
	public $hasMany = array(
		'DailyTransaction' => array(
			'className' => 'DailyTransaction',
			'foreignKey' => 'entry_type_id',
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
		'AssetDetail' => array(
			'className' => 'AssetDetail',
			'foreignKey' => 'entry_type_id',
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
		'IncomeExpenseDetail' => array(
			'className' => 'IncomeExpenseDetail',
			'foreignKey' => 'entry_type_id',
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
