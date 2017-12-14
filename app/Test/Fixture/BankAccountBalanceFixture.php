<?php
/**
 * BankAccountBalanceFixture
 *
 */
class BankAccountBalanceFixture extends CakeTestFixture {

/**
 * Table name
 *
 * @var string
 */
	public $table = 'bank_account_balance';

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'daily_transation_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'bank_info_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'branch_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'account_no' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'transaction_amount' => array('type' => 'decimal', 'null' => false, 'default' => null, 'length' => '12,2', 'unsigned' => false),
		'account_balance' => array('type' => 'decimal', 'null' => false, 'default' => null, 'length' => '12,2', 'unsigned' => false),
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
			'daily_transation_id' => 1,
			'bank_info_id' => 1,
			'branch_id' => 1,
			'account_no' => 'Lorem ipsum dolor sit amet',
			'transaction_amount' => '',
			'account_balance' => '',
			'created_at' => '2017-10-19',
			'updated_at' => '2017-10-19'
		),
	);

}
