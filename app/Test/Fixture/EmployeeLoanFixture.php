<?php
/**
 * EmployeeLoanFixture
 *
 */
class EmployeeLoanFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'employee_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'loan_type_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'loan_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'loan_amount' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'number_of_installment' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'installment_amount' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'loan_apply_date' => array('type' => 'date', 'null' => false, 'default' => null),
		'loan_approved_date' => array('type' => 'date', 'null' => false, 'default' => null),
		'status' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 4, 'unsigned' => false),
		'indexes' => array(
			'PRIMARY' => array('column' => 'id', 'unique' => 1)
		),
		'tableParameters' => array('charset' => 'utf8', 'collate' => 'utf8_general_ci', 'engine' => 'InnoDB')
	);

/**
 * Records
 *
 * @var array
 */
	public $records = array(
		array(
			'id' => 1,
			'employee_id' => 1,
			'loan_type_id' => 1,
			'loan_id' => 1,
			'loan_amount' => 1,
			'number_of_installment' => 1,
			'installment_amount' => 1,
			'loan_apply_date' => '2017-07-09',
			'loan_approved_date' => '2017-07-09',
			'status' => 1
		),
	);

}
