<?php
/**
 * FixDepositFixture
 *
 */
class FixDepositFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'daily_trasation_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'deposit_bank_name' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'fix_deposit_bank_name' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'fix_deposit_branch_name' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'fix_deposit_no' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'interest_rate' => array('type' => 'decimal', 'null' => false, 'default' => null, 'length' => '8,2', 'unsigned' => false),
		'investment_date' => array('type' => 'date', 'null' => false, 'default' => null),
		'investment_expire_date' => array('type' => 'date', 'null' => false, 'default' => null),
		'investment_amount' => array('type' => 'decimal', 'null' => false, 'default' => null, 'length' => '12,2', 'unsigned' => false),
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
			'daily_trasation_id' => 1,
			'deposit_bank_name' => 'Lorem ipsum dolor sit amet',
			'fix_deposit_bank_name' => 'Lorem ipsum dolor sit amet',
			'fix_deposit_branch_name' => 'Lorem ipsum dolor sit amet',
			'fix_deposit_no' => 'Lorem ipsum dolor sit amet',
			'interest_rate' => '',
			'investment_date' => '2017-10-19',
			'investment_expire_date' => '2017-10-19',
			'investment_amount' => '',
			'created_at' => '2017-10-19',
			'updated_at' => '2017-10-19'
		),
	);

}
