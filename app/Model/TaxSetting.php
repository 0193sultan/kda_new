<?php

App::uses('AppModel', 'Model');

/**
 * TaxSetting Model
 *
 */
class TaxSetting extends AppModel {

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
        'tax_applied_year' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'tax_name' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'tax_executable_amount' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'location_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'applied_tax_amount' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'monthly_recovery' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'tax_adjustment_for_last_month' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'add_sub' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
    );
    public $belongsTo = array(
	'Location' => array(
		'className' => 'Location',
		'foreignKey' => 'location_id',
		'conditions' => '',
		'fields' => '',
		'order' => ''
		)

	);

}
