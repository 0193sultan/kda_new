<?php
/**
 * StockGoodFixture
 *
 */
class StockGoodFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'daily_transation_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'head_list_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'goods_name' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'goods_amount' => array('type' => 'decimal', 'null' => false, 'default' => null, 'length' => '12,2', 'unsigned' => false),
		'goods_value' => array('type' => 'decimal', 'null' => false, 'default' => null, 'length' => '12,2', 'unsigned' => false),
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
			'goods_name' => 'Lorem ipsum dolor sit amet',
			'goods_amount' => '',
			'goods_value' => '',
			'created_at' => '2017-10-19',
			'updated_at' => '2017-10-19'
		),
	);

}
