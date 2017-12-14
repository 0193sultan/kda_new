<?php

App::uses('AppModel', 'Model');

/**
 * ContructorProjectName Model
 *
 * @property ProjectType $ProjectType
 * @property User $User
 */
class ContructorProjectName extends AppModel {

    /**
     * Display field
     *
     * @var string
     */
    public $displayField = 'name';

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
        'project_type_id' => array(
            'required' => array(
                'rule' => 'notEmpty',
                'message' => 'Required.'
            )
        ),
        'project_value' => array(
            'required' => array(
                'rule' => 'notEmpty',
                'message' => 'Required.'
            ),
            'numeric' => array(
                'rule' => 'numeric',
                'message' => 'Numbers only'
            )
        ),
        'schedule_money_%' => array(
            'required' => array(
                'rule' => 'notEmpty',
                'message' => 'Required.'
            ),
            'numeric' => array(
                'rule' => 'numeric',
                'message' => 'Numbers only'
            )
        ),
        'security_money_%' => array(
            'required' => array(
                'rule' => 'notEmpty',
                'message' => 'Required.'
            ),
            'numeric' => array(
                'rule' => 'numeric',
                'message' => 'Numbers only'
            )
        ),
        'name' => array('Only letters allowed.
                ' => array('rule' => array('custom', '/[A-Za-z ]+/')
            )),
    );

    //The Associations below have been created with all possible keys, those that are not needed can be removed

    /**
     * belongsTo associations
     *
     * @var array
     */
    public $belongsTo = array(
        'ProjectType' => array(
            'className' => 'ProjectType',
            'foreignKey' => 'project_type_id',
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

}
