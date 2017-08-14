<?php
App::uses('AppModel', 'Model');
/**
 * EmployeeSalarySheet Model
 *
 */
class EmployeeSalarySheet extends AppModel {
     public $belongsTo = array(
 	'Employee' => array(
 		'className' => 'Employee',
 		'foreignKey' => 'employee_id',
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
         );

}
