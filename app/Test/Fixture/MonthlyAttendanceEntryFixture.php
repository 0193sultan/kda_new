<?php
/**
 * MonthlyAttendanceEntryFixture
 *
 */
class MonthlyAttendanceEntryFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'employee_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'official_attendence' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'casual_leave' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'sick_leave' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'earned_leave' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'maternity_leave' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'total_attendance' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'panalty' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'datetime' => array('type' => 'date', 'null' => false, 'default' => null),
		'indexes' => array(
			
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
			'official_attendence' => 1,
			'casual_leave' => 1,
			'sick_leave' => 1,
			'earned_leave' => 1,
			'maternity_leave' => 1,
			'total_attendance' => 1,
			'panalty' => 1,
			'datetime' => '2017-06-13'
		),
	);

}
