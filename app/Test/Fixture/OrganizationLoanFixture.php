<?php
/**
 * OrganizationLoanFixture
 *
 */
class OrganizationLoanFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'daily_transation_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'parent_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'acc_head_list_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'loaner_organizaion_name' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'loan_amount' => array('type' => 'decimal', 'null' => false, 'default' => '0.00', 'length' => '10,2', 'unsigned' => false),
		'interest_rate' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 2, 'unsigned' => false),
		'loan_opening_date' => array('type' => 'date', 'null' => true, 'default' => null),
		'created_at' => array('type' => 'date', 'null' => false, 'default' => null),
		'updated_at' => array('type' => 'date', 'null' => true, 'default' => null),
		'created_by' => array('type' => 'boolean', 'null' => false, 'default' => '0'),
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
			'daily_transation_id' => 1,
			'parent_id' => 1,
			'acc_head_list_id' => 1,
			'loaner_organizaion_name' => 'Lorem ipsum dolor sit amet',
			'loan_amount' => '',
			'interest_rate' => 1,
			'loan_opening_date' => '2017-11-12',
			'created_at' => '2017-11-12',
			'updated_at' => '2017-11-12',
			'created_by' => 1
		),
	);

}
