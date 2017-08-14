<?php
/**
 * EmployeeHouseRentSettingFixture
 *
 */
class EmployeeHouseRentSettingFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'gazette_year' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'min_basic' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'max_basic' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'location_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'house_rent_percent' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'house_rent_min' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'created_date' => array('type' => 'datetime', 'null' => false, 'default' => null),
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
			'gazette_year' => 1,
			'min_basic' => 1,
			'max_basic' => 1,
			'location_id' => 1,
			'house_rent_percent' => 1,
			'house_rent_min' => 1,
			'created_date' => '2017-07-27 14:31:39',
			'update_date' => '2017-07-27 14:31:39',
			'user_id' => 1
		),
	);

}
