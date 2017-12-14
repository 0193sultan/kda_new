<?php
/**
 * DueSalarySheetFixture
 *
 */
class DueSalarySheetFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'employee_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'current_basic' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'new_basic_salary' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'da' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'pp' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'medical' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'convance' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'wash' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'mobile' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'cycle' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'charge' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'other' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'gross_pay' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'house_rent' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'telephone_allowance' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'tiffin' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'education' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'salary_type_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'total_payable' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'fiscal_year_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'month_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'created_at' => array('type' => 'date', 'null' => true, 'default' => null),
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
			'employee_id' => 1,
			'current_basic' => 1,
			'new_basic_salary' => 1,
			'da' => 1,
			'pp' => 1,
			'medical' => 1,
			'convance' => 1,
			'wash' => 1,
			'mobile' => 1,
			'cycle' => 1,
			'charge' => 1,
			'other' => 1,
			'gross_pay' => 1,
			'house_rent' => 1,
			'telephone_allowance' => 1,
			'tiffin' => 1,
			'education' => 1,
			'salary_type_id' => 1,
			'total_payable' => 1,
			'fiscal_year_id' => 1,
			'month_id' => 1,
			'created_at' => '2017-08-19',
			'updated_at' => '2017-08-19'
		),
	);

}
