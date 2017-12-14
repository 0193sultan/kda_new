<?php
App::uses('AppModel', 'Model');
/**
 * AccHeadType Model
 *
 * @property AccHeadList $AccHeadList
 */
class AccHeadType extends AppModel {

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
		'head_type_name' => array(
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
		'AccHeadList' => array(
			'className' => 'AccHeadList',
			'foreignKey' => 'acc_head_type_id',
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
			'foreignKey' => 'acc_head_type_id',
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
