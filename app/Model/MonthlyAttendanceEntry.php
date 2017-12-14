<?php

App::uses('AppModel', 'Model');

/**
 * MonthlyAttendanceEntry Model
 *
 * @property Employee $Employee
 */
class MonthlyAttendanceEntry extends AppModel {

    /**
     * Display field
     *
     * @var string
     */
    public $displayField = 'employee_id';


    //The Associations below have been created with all possible keys, those that are not needed can be removed

    /**
     * belongsTo associations
     *
     * @var array
     */
    public $validate = array(
        'fiscal_year_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            //'message' => 'Your custom message here',
            //'allowEmpty' => false,
            //'required' => false,
            //'last' => false, // Stop validation after this rule
            //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
        'month_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        ),
        'monthly_attendance_entry_type_id' => array(
            'notEmpty' => array(
                'rule' => array('notEmpty'),
            ),
        )
    );
    public $belongsTo = array(
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
