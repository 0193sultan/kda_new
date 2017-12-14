<?php
App::uses('AppModel', 'Model');
/**
 * SecurityDepositeReturn Model
 *
 * @property WorkOrder $WorkOrder
 * @property FiscalYear $FiscalYear
 * @property User $User
 */
class SecurityDepositeReturn extends AppModel {


	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
		'WorkOrder' => array(
			'className' => 'WorkOrder',
			'foreignKey' => 'work_order_id',
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
		)
	);
}
