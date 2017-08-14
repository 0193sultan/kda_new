<?php
App::uses('AppModel', 'Model');
/**
 * MonthlyAttendanceEntry Model
 *
 * @property Employee $Employee
 */
class MonthlyAttendanceEntry extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'employee_id';


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
		)
	);
}
