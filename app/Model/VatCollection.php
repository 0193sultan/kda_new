<?php

App::uses('AppModel', 'Model');

/**
 * VatCollection Model
 *
 * @property VatAccount $VatAccount
 * @property DailyTransaction $DailyTransaction
 * @property HeadWiseAccountBalance $HeadWiseAccountBalance
 * @property ContructorProjectName $ContructorProjectName
 * @property ContructorName $ContructorName
 * @property WorkOrder $WorkOrder
 */
class VatCollection extends AppModel {

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
        'id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            //'message' => 'Your custom message here',
            //'allowEmpty' => false,
            //'required' => false,
            //'last' => false, // Stop validation after this rule
            //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        )
    );

    //The Associations below have been created with all possible keys, those that are not needed can be removed

    /**
     * belongsTo associations
     *
     * @var array
     */
    public $belongsTo = array(
        'VatAccount' => array(
            'className' => 'VatAccount',
            'foreignKey' => 'vat_account_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'DailyTransaction' => array(
            'className' => 'DailyTransaction',
            'foreignKey' => 'daily_transaction_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'HeadWiseAccountBalance' => array(
            'className' => 'HeadWiseAccountBalance',
            'foreignKey' => 'head_wise_account_balance_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'ContructorProjectName' => array(
            'className' => 'ContructorProjectName',
            'foreignKey' => 'contructor_project_name_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'ContructorName' => array(
            'className' => 'ContructorName',
            'foreignKey' => 'contructor_name_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'WorkOrder' => array(
            'className' => 'WorkOrder',
            'foreignKey' => 'work_order_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        )
    );

}
