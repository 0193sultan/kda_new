<?php
/**
 * LoanAdjustmentFixture
 *
 */
class LoanAdjustmentFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'employee_loan_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'adjustment_amount' => array('type' => 'float', 'null' => false, 'default' => '0.00', 'length' => '10,2', 'unsigned' => false),
		'previous_current_due' => array('type' => 'float', 'null' => false, 'default' => '0.00', 'length' => '10,2', 'unsigned' => false),
		'previous_interest_amount_due' => array('type' => 'float', 'null' => false, 'default' => '0.00', 'length' => '10,2', 'unsigned' => false),
		'adjustment_on_current_due' => array('type' => 'float', 'null' => false, 'default' => '0.00', 'length' => '10,2', 'unsigned' => false),
		'adjustment_on_interest_amount_due' => array('type' => 'float', 'null' => false, 'default' => '0.00', 'length' => '10,2', 'unsigned' => false),
		'adjustment_date' => array('type' => 'date', 'null' => false, 'default' => null),
		'created_at' => array('type' => 'date', 'null' => false, 'default' => null),
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
			'employee_loan_id' => 1,
			'adjustment_amount' => 1,
			'previous_current_due' => 1,
			'previous_interest_amount_due' => 1,
			'adjustment_on_current_due' => 1,
			'adjustment_on_interest_amount_due' => 1,
			'adjustment_date' => '2017-09-30',
			'created_at' => '2017-09-30',
			'updated_at' => '2017-09-30'
		),
	);

}
