<?php

App::uses('AppModel', 'Model');

/**
 * AccHeadList Model
 *
 * @property AccHeadType $AccHeadType
 * @property AccHeadList $ParentAccHeadList
 * @property AccEffect $AccEffect
 * @property ActionHead $ActionHead
 * @property ActionSubHead $ActionSubHead
 * @property User $User
 * @property AccHeadList $ChildAccHeadList
 * @property AssetDetail $AssetDetail
 * @property DailyTransaction $DailyTransaction
 * @property IncomeExpenseDetail $IncomeExpenseDetail
 */
class AccHeadList extends AppModel {

    /**
     * Validation rules
     *
     * @var array
     */
    public $displayField = 'id';
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
        'head_code' => array(
            'rule' => 'isUnique',
            'message' => 'Head Code already Exist'
        )
    );

    //The Associations below have been created with all possible keys, those that are not needed can be removed

    /**
     * belongsTo associations
     *
     * @var array
     */
    public $belongsTo = array(
        'AccHeadType' => array(
            'className' => 'AccHeadType',
            'foreignKey' => 'acc_head_type_id',
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
//        'ChildAccHeadList' => array(
//            'className' => 'ChildAccHeadList',
//            'foreignKey' => 'parent_id',
//            'dependent' => false,
//            'conditions' => '',
//            'fields' => '',
//            'order' => '',
//            'limit' => '',
//            'offset' => '',
//            'exclusive' => '',
//            'finderQuery' => '',
//            'counterQuery' => ''
//        ),
        'DailyTransaction' => array(
            'className' => 'DailyTransaction',
            'foreignKey' => 'acc_head_list_id',
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
