<?php
/**
 * EmployeeAllowanceFixture
 *
 */
class EmployeeAllowanceFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'house_rent' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'medical' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'education' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'convence' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'tiffin' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'wash' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'mobile' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'da' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'charges' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'others' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'pp' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'employee_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
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
			'house_rent' => 1,
			'medical' => 1,
			'education' => 1,
			'convence' => 1,
			'tiffin' => 1,
			'wash' => 1,
			'mobile' => 1,
			'da' => 1,
			'charges' => 1,
			'others' => 1,
			'pp' => 1,
			'employee_id' => 1
		),
	);

}
