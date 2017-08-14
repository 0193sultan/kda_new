<?php
App::uses('AppModel', 'Model');
/**
 * WarterSupplySetting Model
 *
 * @property User $User
 */
class WarterSupplySetting extends AppModel {

/**
 * Use table
 *
 * @var mixed False or table name
 */
	public $useTable = 'warter_supply_setting';


	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
		'User' => array(
			'className' => 'User',
			'foreignKey' => 'user_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),

		'Location' => array(
			'className' => 'Location',
			'foreignKey' => 'location_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
