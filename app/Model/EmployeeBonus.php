<?php
App::uses('AppModel', 'Model');
/**
 * EmployeeBonus Model
 *
 * @property Employee $Employee
 * @property Scale $Scale
 * @property FiscalYear $FiscalYear
 * @property Month $Month
 * @property User $User
 */
class EmployeeBonus extends AppModel {

/**
 * Use table
 *
 * @var mixed False or table name
 */
	public $useTable = 'employee_bonus';

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
		'Employee' => array(
			'className' => 'Employee',
			'foreignKey' => 'employee_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
//		'Scale' => array(
//			'className' => 'Scale',
//			'foreignKey' => 'scale_id',
//			'conditions' => '',
//			'fields' => '',
//			'order' => ''
//		),
		'FiscalYear' => array(
			'className' => 'FiscalYear',
			'foreignKey' => 'fiscal_year_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Month' => array(
			'className' => 'Month',
			'foreignKey' => 'month_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
