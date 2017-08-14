<?php
App::uses('AppModel', 'Model');
/**
 * GpfSubscription Model
 *
 * @property Employee $Employee
 * @property EmployeeLoan $EmployeeLoan
 */
class GpfSubscription extends AppModel {

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
		'EmployeeLoan' => array(
			'className' => 'EmployeeLoan',
			'foreignKey' => 'employee_loan_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
