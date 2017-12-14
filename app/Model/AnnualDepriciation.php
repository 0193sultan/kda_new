<?php
App::uses('AppModel', 'Model');
/**
 * AnnualDepriciation Model
 *
 * @property AccHeadList $AccHeadList
 * @property AnnualDepriciation $ParentAnnualDepriciation
 * @property FiscalYear $FiscalYear
 * @property User $User
 * @property AnnualDepriciation $ChildAnnualDepriciation
 */
class AnnualDepriciation extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'fiscal_year_id';

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
		'AccHeadList' => array(
			'className' => 'AccHeadList',
			'foreignKey' => 'acc_head_list_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'ParentAnnualDepriciation' => array(
			'className' => 'AnnualDepriciation',
			'foreignKey' => 'parent_id',
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

/**
 * hasMany associations
 *
 * @var array
 */
	public $hasMany = array(
		'ChildAnnualDepriciation' => array(
			'className' => 'AnnualDepriciation',
			'foreignKey' => 'parent_id',
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
