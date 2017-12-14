<?php
/**
 * MonthlyOthersEntyFixture
 *
 */
class MonthlyOthersEntyFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'designation_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'department_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'employee_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'fiscal_year_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'month_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'electric_bill' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'telephone_bill' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'rent_a_car_bill' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'others' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'created_at' => array('type' => 'date', 'null' => false, 'default' => null),
		'updated_at' => array('type' => 'date', 'null' => false, 'default' => null),
		'created_by' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
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
			'designation_id' => 1,
			'department_id' => 1,
			'employee_id' => 1,
			'fiscal_year_id' => 1,
			'month_id' => 1,
			'electric_bill' => 1,
			'telephone_bill' => 1,
			'rent_a_car_bill' => 1,
			'others' => 1,
			'created_at' => '2017-08-21',
			'updated_at' => '2017-08-21',
			'created_by' => 1
		),
	);

}
