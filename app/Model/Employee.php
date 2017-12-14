<?php

App::uses('AppModel', 'Model');

/**
 * Employee Model
 *
 * @property EmployeeGrade $EmployeeGrade
 * @property Scale $Scale
 * @property Designation $Designation
 * @property Basic $Basic
 * @property NewBasic $NewBasic
 * @property Quota $Quota
 * @property EmployeeType $EmployeeType
 * @property Religion $Religion
 * @property JobStatus $JobStatus
 * @property Bank $Bank
 * @property Sex $Sex
 * @property MaritalStatus $MaritalStatus
 * @property LivingStatus $LivingStatus
 */
class Employee extends AppModel {

    /**
     * Display field
     *
     * @var string
     */
    public $displayField = 'name';

    /**
     * Validation rules
     *
     * @var array
     */
    // public $validate = array(
    // 	'name' => array(
    // 		'alphaNumeric' => array(
    // 			'rule' => array('alphaNumeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 		'notEmpty' => array(
    // 			'rule' => array('notEmpty'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'employee_id' => array(
    // 		'numeric' => array(
    // 			'rule' => array('numeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'employee_grade_id' => array(
    // 		'numeric' => array(
    // 			'rule' => array('numeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'scale_id' => array(
    // 		'numeric' => array(
    // 			'rule' => array('numeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'designation_id' => array(
    // 		'numeric' => array(
    // 			'rule' => array('numeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'basic_id' => array(
    // 		'numeric' => array(
    // 			'rule' => array('numeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'new_basic_id' => array(
    // 		'numeric' => array(
    // 			'rule' => array('numeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'date_of_birth' => array(
    // 		'date' => array(
    // 			'rule' => array('date'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'joining_date' => array(
    // 		'date' => array(
    // 			'rule' => array('date'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'quota_id' => array(
    // 		'numeric' => array(
    // 			'rule' => array('numeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'employee_type_id' => array(
    // 		'numeric' => array(
    // 			'rule' => array('numeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'religion_id' => array(
    // 		'numeric' => array(
    // 			'rule' => array('numeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'job_status_id' => array(
    // 		'numeric' => array(
    // 			'rule' => array('numeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'current_posting_place' => array(
    // 		'numeric' => array(
    // 			'rule' => array('numeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'account_number' => array(
    // 		'alphaNumeric' => array(
    // 			'rule' => array('alphaNumeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'bank_id' => array(
    // 		'numeric' => array(
    // 			'rule' => array('numeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'fathers_name' => array(
    // 		'alphaNumeric' => array(
    // 			'rule' => array('alphaNumeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 		'notEmpty' => array(
    // 			'rule' => array('notEmpty'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'mothers_name' => array(
    // 		'notEmpty' => array(
    // 			'rule' => array('notEmpty'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 		'alphaNumeric' => array(
    // 			'rule' => array('alphaNumeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'sex_id' => array(
    // 		'numeric' => array(
    // 			'rule' => array('numeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'marital_status_id' => array(
    // 		'numeric' => array(
    // 			'rule' => array('numeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'spouse_name' => array(
    // 		'notEmpty' => array(
    // 			'rule' => array('notEmpty'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 		'alphaNumeric' => array(
    // 			'rule' => array('alphaNumeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'living_status_id' => array(
    // 		'numeric' => array(
    // 			'rule' => array('numeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'present_address' => array(
    // 		'notEmpty' => array(
    // 			'rule' => array('notEmpty'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'permanent_address' => array(
    // 		'alphaNumeric' => array(
    // 			'rule' => array('alphaNumeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // 	'contact_no' => array(
    // 		'alphaNumeric' => array(
    // 			'rule' => array('alphaNumeric'),
    // 			//'message' => 'Your custom message here',
    // 			//'allowEmpty' => false,
    // 			//'required' => false,
    // 			//'last' => false, // Stop validation after this rule
    // 			//'on' => 'create', // Limit validation to 'create' or 'update' operations
    // 		),
    // 	),
    // );
    //The Associations below have been created with all possible keys, those that are not needed can be removed

    /**
     * belongsTo associations
     *
     * @var array
     */
    public $belongsTo = array(
        'EmployeeGrade' => array(
            'className' => 'EmployeeGrade',
            'foreignKey' => 'employee_grade_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'Scale' => array(
            'className' => 'Scale',
            'foreignKey' => 'scale_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'Designation' => array(
            'className' => 'Designation',
            'foreignKey' => 'designation_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'Quota' => array(
            'className' => 'Quota',
            'foreignKey' => 'quota_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'EmployeeType' => array(
            'className' => 'EmployeeType',
            'foreignKey' => 'employee_type_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'Religion' => array(
            'className' => 'Religion',
            'foreignKey' => 'religion_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'JobStatus' => array(
            'className' => 'JobStatus',
            'foreignKey' => 'job_status_id',
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
        'Sex' => array(
            'className' => 'Sex',
            'foreignKey' => 'sex_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'MaritalStatus' => array(
            'className' => 'MaritalStatus',
            'foreignKey' => 'marital_status_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        ),
        'LivingStatus' => array(
            'className' => 'LivingStatus',
            'foreignKey' => 'living_status_id',
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
        'Location' => array(
            'className' => 'Location',
            'foreignKey' => 'location_id',
            'conditions' => '',
            'fields' => '',
            'order' => ''
        )
    );

    /**
     * HasMany  associations
     *
     * @var array
     */
    public $hasMany = array(
        'EmployeeChild' => array(
            'className' => 'EmployeeChild',
            'foreignKey' => 'employee_id',
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
        'MonthlyOther' => array(
            'className' => 'MonthlyOther',
            'foreignKey' => 'employee_id',
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
        'EmployeeLoan' => array(
            'className' => 'EmployeeLoan',
            'foreignKey' => 'employee_id',
            'dependent' => false,
            'conditions' => 'status=1',
            'fields' => '',
            'order' => '',
            'limit' => '',
            'offset' => '',
            'exclusive' => '',
            'finderQuery' => '',
            'counterQuery' => ''
        ),
        'MonthlyAttendanceEntry' => array(
            'className' => 'MonthlyAttendanceEntry',
            'foreignKey' => 'employee_id',
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
        'EmployeeBonus' => array(
            'className' => 'EmployeeBonus',
            'foreignKey' => 'employee_id',
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

    /**
     * HasMany  associations
     *
     * @var array
     */
    public $hasOne = array(
        'EmployeeAllowance' => array(
            'className' => 'EmployeeAllowance',
            'foreignKey' => 'employee_id',
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
        'EmployeeRecovery' => array(
            'className' => 'EmployeeRecovery',
            'foreignKey' => 'employee_id',
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
