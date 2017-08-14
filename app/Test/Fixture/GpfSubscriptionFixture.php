<?php
/**
 * GpfSubscriptionFixture
 *
 */
class GpfSubscriptionFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'employee_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'employee_loan_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'subscription_amount' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'subscription_date' => array('type' => 'date', 'null' => true, 'default' => null),
		'current_balance' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'loan_amount' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'loan_date' => array('type' => 'date', 'null' => true, 'default' => null),
		'created_at' => array('type' => 'date', 'null' => true, 'default' => null),
		'updated_at' => array('type' => 'date', 'null' => true, 'default' => null),
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
			'employee_loan_id' => 1,
			'subscription_amount' => 1,
			'subscription_date' => '2017-08-13',
			'current_balance' => 1,
			'loan_amount' => 1,
			'loan_date' => '2017-08-13',
			'created_at' => '2017-08-13',
			'updated_at' => '2017-08-13'
		),
	);

}
