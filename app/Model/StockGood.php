<?php
App::uses('AppModel', 'Model');
/**
 * StockGood Model
 *
 * @property DailyTransation $DailyTransation
 * @property HeadList $HeadList
 */
class StockGood extends AppModel {

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
		'DailyTransation' => array(
			'className' => 'DailyTransation',
			'foreignKey' => 'daily_transation_id',
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
		)
	);
}
