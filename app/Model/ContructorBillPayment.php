<?php

App::uses('AppModel', 'Model');

/**
 * ContructorBillPayment Model
 *
 * @property WorkOrder $WorkOrder
 * @property FiscalYear $FiscalYear
 * @property User $User
 */
class ContructorBillPayment extends AppModel {
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
        'payment_type' => array(
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
        'bill_amount' => array(
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
        'vat_%' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'tax_%' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'security_money_%' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'advance_adjustment' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'net_pay' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'bill_pay_date' => array(
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
        'FiscalYear' => array(
            'className' => 'FiscalYear',
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
