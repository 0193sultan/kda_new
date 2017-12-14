<?php
/**
 * HeadWiseAccountBalanceFixture
 *
 */
class HeadWiseAccountBalanceFixture extends CakeTestFixture {

/**
 * Table name
 *
 * @var string
 */
	public $table = 'head_wise_account_balance';

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'daily_transation_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'head_list_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'transaction_amount' => array('type' => 'decimal', 'null' => false, 'default' => null, 'length' => '12,2', 'unsigned' => false),
		'head_balance' => array('type' => 'decimal', 'null' => false, 'default' => null, 'length' => '12,2', 'unsigned' => false),
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
			'head_list_id' => 1,
			'transaction_amount' => '',
			'head_balance' => '',
			'created_at' => '2017-10-19',
			'updated_at' => '2017-10-19'
		),
	);

}
