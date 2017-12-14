<?php

App::uses('AppModel', 'Model');

/**
 * ContructorAdvancePayment Model
 *
 * @property WorkOrder $WorkOrder
 * @property FiscalYears $FiscalYears
 * @property User $User
 */
class ContructorAdvancePayment extends AppModel {
    //The Associations below have been created with all possible keys, those that are not needed can be removed

    /**
     * belongsTo associations
     *
     * @var array
     */
    public $validate = array(
        'contructor_project_name_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'contructor_name_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'work_order_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'advance_amount' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'voucher_no' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
            'isUnique' => array(
                'rule' => 'isUnique',
                'message' => 'This Voucher No already exists.'),
        ),
        'fiscal_year_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'payment_date' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        )
    );
    public $belongsTo = array(
        'WorkOrder' => array(
            'className' => 'WorkOrder',
            'foreignKey' => 'work_order_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'FiscalYears' => array(
            'className' => 'FiscalYears',
            'foreignKey' => 'fiscal_year_id',
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
