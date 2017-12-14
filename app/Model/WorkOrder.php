<?php

App::uses('AppModel', 'Model');

/**
 * WorkOrder Model
 *
 * @property ContructorProjectName $ContructorProjectName
 * @property ContructorName $ContructorName
 * @property FiscalYears $FiscalYears
 * @property User $User
 */
class WorkOrder extends AppModel {
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
        'work_order_no' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'fiscal_year_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'work_order_date' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        )
    );
    public $belongsTo = array(
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
