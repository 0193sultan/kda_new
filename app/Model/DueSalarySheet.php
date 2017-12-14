<?php

App::uses('AppModel', 'Model');

/**
 * DueSalarySheet Model
 *
 * @property Employee $Employee
 * @property SalaryType $SalaryType
 * @property FiscalYear $FiscalYear
 * @property Month $Month
 */
class DueSalarySheet extends AppModel {

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
        'due_days' => array(
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
        'Employee' => array(
            'className' => 'Employee',
            'foreignKey' => 'employee_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        /* 'SalaryType' => array(
          'className' => 'SalaryType',
          'foreignKey' => 'salary_type_id',
          'conditions' => '',
          'fields' => '',
          'order' => ''
          ), */
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
