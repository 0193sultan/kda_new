<?php
App::uses('AppModel', 'Model');
/**
 * BudgetDetail Model
 *
 * @property FiscalYear $FiscalYear
 * @property BudgetSchedule $BudgetSchedule
 * @property BudgetHeadList $BudgetHeadList
 * @property BudgetCategory $BudgetCategory
 * @property BudgetType $BudgetType
 */
class BudgetDetail extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'budget_schedule_id';

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
		'FiscalYear' => array(
			'className' => 'FiscalYear',
			'foreignKey' => 'fiscal_year_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'BudgetSchedule' => array(
			'className' => 'BudgetSchedule',
			'foreignKey' => 'budget_schedule_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'BudgetHeadList' => array(
			'className' => 'BudgetHeadList',
			'foreignKey' => 'budget_head_list_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'BudgetCategory' => array(
			'className' => 'BudgetCategory',
			'foreignKey' => 'budget_category_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'BudgetType' => array(
			'className' => 'BudgetType',
			'foreignKey' => 'budget_type_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
