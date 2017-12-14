<?php
App::uses('AppModel', 'Model');
/**
 * BudgetHeadList Model
 *
 * @property BudgetSchedule $BudgetSchedule
 * @property BudgetDetail $BudgetDetail
 */
class BudgetHeadList extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'head_name';

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
		'BudgetSchedule' => array(
			'className' => 'BudgetSchedule',
			'foreignKey' => 'budget_schedule_id',
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
		'BudgetDetail' => array(
			'className' => 'BudgetDetail',
			'foreignKey' => 'budget_head_list_id',
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
