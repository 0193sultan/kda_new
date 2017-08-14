<?php
/**
 * WarterSupplySettingFixture
 *
 */
class WarterSupplySettingFixture extends CakeTestFixture {

/**
 * Table name
 *
 * @var string
 */
	public $table = 'warter_supply_setting';

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'year' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'grade_start' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'grade_end' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'living_status' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 10, 'collate' => 'latin1_swedish_ci', 'charset' => 'latin1'),
		'water_bill' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'create_date' => array('type' => 'datetime', 'null' => false, 'default' => 'CURRENT_TIMESTAMP'),
		'update_date' => array('type' => 'datetime', 'null' => false, 'default' => null),
		'user_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'indexes' => array(
			'PRIMARY' => array('column' => 'id', 'unique' => 1)
		),
		'tableParameters' => array('charset' => 'latin1', 'collate' => 'latin1_swedish_ci', 'engine' => 'InnoDB')
	);

/**
 * Records
 *
 * @var array
 */
	public $records = array(
		array(
			'id' => 1,
			'year' => 1,
			'grade_start' => 1,
			'grade_end' => 1,
			'living_status' => 'Lorem ip',
			'water_bill' => 1,
			'create_date' => '2017-07-27 19:41:37',
			'update_date' => '2017-07-27 19:41:37',
			'user_id' => 1
		),
	);

}
