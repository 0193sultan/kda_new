<?php

App::uses('AppModel', 'Model');

/**
 * MonthlyOthersEnty Model
 *
 * @property Designation $Designation
 * @property Department $Department
 * @property Employee $Employee
 * @property FiscalYear $FiscalYear
 * @property Month $Month
 */
class MonthlyOthersEnty extends AppModel {

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
        'designation_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'department_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'employee_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'fiscal_year_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'month_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
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
        'Designation' => array(
            'className' => 'Designation',
            'foreignKey' => 'designation_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'Department' => array(
            'className' => 'Department',
            'foreignKey' => 'department_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'Employee' => array(
            'className' => 'Employee',
            'foreignKey' => 'employee_id',
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
        )
    );

}
