<?php
/**
 * EmployeeFixture
 *
 */
class EmployeeFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'name' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'employeeID' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'employee_grade_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'scale_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'designation_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'basic_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'new_basic_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'date_of_birth' => array('type' => 'date', 'null' => false, 'default' => null),
		'joining_date' => array('type' => 'date', 'null' => false, 'default' => null),
		'quota_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'employee_type_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'religion_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'job_status_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 4, 'unsigned' => false),
		'current_posting_place' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'account_number' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 20, 'unsigned' => false),
		'bank_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'fathers_name' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'mothers_name' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'sex_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'marital_status_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'spouse_name' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'living_status_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'present_address' => array('type' => 'text', 'null' => false, 'default' => null, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'permanent_address' => array('type' => 'text', 'null' => false, 'default' => null, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'contact_no' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
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
			'name' => 'Lorem ipsum dolor sit amet',
			'employeeID' => 1,
			'employee_grade_id' => 1,
			'scale_id' => 1,
			'designation_id' => 1,
			'basic_id' => 1,
			'new_basic_id' => 1,
			'date_of_birth' => '2017-06-08',
			'joining_date' => '2017-06-08',
			'quota_id' => 1,
			'employee_type_id' => 1,
			'religion_id' => 1,
			'job_status_id' => 1,
			'current_posting_place' => 1,
			'account_number' => 1,
			'bank_id' => 1,
			'fathers_name' => 'Lorem ipsum dolor sit amet',
			'mothers_name' => 'Lorem ipsum dolor sit amet',
			'sex_id' => 1,
			'marital_status_id' => 1,
			'spouse_name' => 'Lorem ipsum dolor sit amet',
			'living_status_id' => 1,
			'present_address' => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida, phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam, vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit, feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
			'permanent_address' => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida, phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam, vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit, feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
			'contact_no' => 'Lorem ipsum dolor sit amet'
		),
	);

}
