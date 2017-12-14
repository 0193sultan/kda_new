<?php
App::uses('AppModel', 'Model');
/**
 * AccEffect Model
 *
 * @property AccHeadList $AccHeadList
 * @property DailyTransition $DailyTransition
 */
class AccEffect extends AppModel {

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
		'acc_effect_head_name' => array(
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


}
