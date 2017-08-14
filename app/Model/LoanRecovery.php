<?php

App::uses('AppModel', 'Model');

/**
 * LoanRecovery Model
 *
 * @property Month $Month
 * @property EmployeeLoan $EmployeeLoan
 */
class LoanRecovery extends AppModel {
    //The Associations below have been created with all possible keys, those that are not needed can be removed

    /**
     * belongsTo associations
     *
     * @var array
     */
    public $belongsTo = array(
        'Month' => array(
            'className' => 'Month',
            'foreignKey' => 'month_id',
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
        'Loan' => array(
            'className' => 'Loan',
            'foreignKey' => 'loan_id',
            'conditions' => '',
            'fields' => '',
            'order' => '',
        ),
        'EmployeeLoan' => array(
            'className' => 'EmployeeLoan',
            'foreignKey' => 'employee_loan_id',
            'conditions' => '',
            'fields' => '',
            'order' => '',
            'counterCache' => true #add by arafat
        ),
        'Employee' => array(
            'className' => 'Employee',
            'foreignKey' => 'employee_id',
            'conditions' => '',
            'fields' => '',
            'order' => '',
            'counterCache' => true #add by arafat
        )
    );

}
