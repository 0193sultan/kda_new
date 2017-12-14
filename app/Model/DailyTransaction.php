<?php

App::uses('AppModel', 'Model');

/**
 * DailyTransaction Model
 *
 * @property AccHeadList $AccHeadList
 * @property AccEffect $AccEffect
 * @property Bank $Bank
 * @property Branch $Branch
 * @property BankAccount $BankAccount
 * @property FiscalYear $FiscalYear
 * @property Month $Month
 * @property User $User
 */
class DailyTransaction extends AppModel {

    /**
     * Display field
     *
     * @var string
     */
    public $displayField = 'voucher_no';

    /**
     * Validation rules
     *
     * @var array
     */
    public $validate = array(
        'entry_type_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
                'message' => 'Empty field not allowed',
            //'allowEmpty' => false,
            //'required' => false,
            //'last' => false, // Stop validation after this rule
            //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
        'acc_head_type_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
                'message' => 'Empty field not allowed',
            //'allowEmpty' => false,
            //'required' => false,
            //'last' => false, // Stop validation after this rule
            //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
        'fiscal_year_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
                'message' => 'Empty field not allowed',
            //'allowEmpty' => false,
            //'required' => false,
            //'last' => false, // Stop validation after this rule
            //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
        'month_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
                'message' => 'Empty field not allowed',
            //'allowEmpty' => false,
            //'required' => false,
            //'last' => false, // Stop validation after this rule
            //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
        'deposit_amount' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
                'message' => 'Empty field not allowed',
            //'allowEmpty' => false,
            //'required' => false,
            //'last' => false, // Stop validation after this rule
            //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
        'voucher_no' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
                'message' => 'Empty field not allowed',
            //'allowEmpty' => false,
            //'required' => false,
            //'last' => false, // Stop validation after this rule
            //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
        'transaction_date' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
                'message' => 'Empty field not allowed',
            //'allowEmpty' => false,
            //'required' => false,
            //'last' => false, // Stop validation after this rule
            //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
        'posting_date' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
                'message' => 'Empty field not allowed',
            //'allowEmpty' => false,
            //'required' => false,
            //'last' => false, // Stop validation after this rule
            //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
    );

    //The Associations below have been created with all possible keys, those that are not needed can be removed

    /**
     * belongsTo associations
     *
     * @var array
     */
    public $belongsTo = array(
        'AccHeadList' => array(
            'className' => 'AccHeadList',
            'foreignKey' => 'acc_head_list_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'EntryType' => array(
            'className' => 'EntryType',
            'foreignKey' => 'entry_type_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'AccHeadType' => array(
            'className' => 'AccHeadType',
            'foreignKey' => 'acc_head_type_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'BankInfo' => array(
            'className' => 'BankInfo',
            'foreignKey' => 'bank_info_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'Branch' => array(
            'className' => 'Branch',
            'foreignKey' => 'branch_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'BankAccount' => array(
            'className' => 'BankAccount',
            'foreignKey' => 'bank_account_id',
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
        'Month' => array(
            'className' => 'Month',
            'foreignKey' => 'month_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'TransactionType' => array(
            'className' => 'TransactionType',
            'foreignKey' => 'transaction_type_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'TransactionCategory' => array(
            'className' => 'TransactionCategory',
            'foreignKey' => 'transaction_category_id',
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

    /**
     * hasMany associations
     *
     * @var array
     */
    public $hasMany = array(
        'HeadWiseAccountBalance' => array(
            'className' => 'HeadWiseAccountBalance',
            'foreignKey' => 'daily_transaction_id',
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
        'BankAccountBalance' => array(
            'className' => 'BankAccountBalance',
            'foreignKey' => 'daily_transaction_id',
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
        'StockGood' => array(
            'className' => 'StockGood',
            'foreignKey' => 'daily_transaction_id',
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
        'FixDeposit' => array(
            'className' => 'StockGood',
            'foreignKey' => 'daily_transaction_id',
            'dependent' => false,
            'conditions' => '',
            'fields' => '',
            'order' => '',
            'limit' => '',
            'offset' => '',
            'exclusive' => '',
            'finderQuery' => '',
            'counterQuery' => ''
        )
    );

}
