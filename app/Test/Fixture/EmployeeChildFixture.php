<?php
/**
 * EmployeeChildFixture
 *
 */
class EmployeeChildFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'employee_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'name' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'dob' => array('type' => 'date', 'null' => false, 'default' => null),
		'edu_status_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'file_path' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 200, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
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
			'employee_id' => 1,
			'name' => 'Lorem ipsum dolor sit amet',
			'dob' => '2017-06-10',
			'edu_status_id' => 1,
			'file_path' => 'Lorem ipsum dolor sit amet'
		),
	);

}
