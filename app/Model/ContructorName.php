<?php

App::uses('AppModel', 'Model');

/**
 * ContructorName Model
 *
 * @property LicenceCategory $LicenceCategory
 * @property User $User
 */
class ContructorName extends AppModel {

    /**
     * Display field
     *
     * @var string
     */
    public $displayField = 'name';


    //The Associations below have been created with all possible keys, those that are not needed can be removed

    /**
     * belongsTo associations
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
        'name' => array('Only letters allowed.
                ' => array('rule' => array('custom', '/[A-Za-z ]+/')
            )),
        'owner_name' => array('Only letters allowed.
                ' => array('rule' => array('custom', '/[A-Za-z ]+/')
            )),
        'phone' => array(
            'rule' => 'isUnique',
            'allowEmpty' => false,
            'message' => 'Phone Number Must be Unique !',
        ),
        'licence_category_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
    );
    public $belongsTo = array(
        'LicenceCategory' => array(
            'className' => 'LicenceCategory',
            'foreignKey' => 'licence_category_id',
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
