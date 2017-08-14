<?php
/**
 * MonthlySalaryNoteFixture
 *
 */
class MonthlySalaryNoteFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'emp_name' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'emp_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'designation' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'account_no' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'net_pay' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'month_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'fiscal_year_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'bank_info_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'date' => array('type' => 'datetime', 'null' => false, 'default' => 'CURRENT_TIMESTAMP'),
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
			'emp_name' => 'Lorem ipsum dolor sit amet',
			'emp_id' => 1,
			'designation' => 'Lorem ipsum dolor sit amet',
			'account_no' => 1,
			'net_pay' => 1,
			'month_id' => 1,
			'fiscal_year_id' => 1,
			'bank_info_id' => 1,
			'date' => '2017-08-01 12:39:33'
		),
	);

}
