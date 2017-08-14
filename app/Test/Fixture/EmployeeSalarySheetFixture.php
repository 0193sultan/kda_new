<?php
/**
 * EmployeeSalarySheetFixture
 *
 */
class EmployeeSalarySheetFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'employee_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'basic_salary' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'new_basic_salary' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'da' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'pp' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'medical' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'convance' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'wash' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'mobile' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'charge' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'other' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'gross_pay' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'gpf' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'group_insurance' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'house_rent' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'house_loan_recovery' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'vechcale_recovery' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'telephone_allowance' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'tiffin' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'motorcycle_loan' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'house_build_recovery' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'house_repair_reovery' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'bicycle_loan' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'computer_loan' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'car_loan' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'extra_loan' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'education' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'fixed_house_rent_recovery' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'health_insurance' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'water_supply_recovery' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'electricity_recovery' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'bf_recovery' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'gi_recovery' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'tin_shade_recovery' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'salary_type_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'total_payable' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'fiscal_year_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'month_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
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
			'employee_id' => 1,
			'basic_salary' => 1,
			'new_basic_salary' => 1,
			'da' => 1,
			'pp' => 1,
			'medical' => 1,
			'convance' => 1,
			'wash' => 1,
			'mobile' => 1,
			'charge' => 1,
			'other' => 1,
			'gross_pay' => 1,
			'gpf' => 1,
			'group_insurance' => 1,
			'house_rent' => 1,
			'house_loan_recovery' => 1,
			'vechcale_recovery' => 1,
			'telephone_allowance' => 1,
			'tiffin' => 1,
			'motorcycle_loan' => 1,
			'house_build_recovery' => 1,
			'house_repair_reovery' => 1,
			'bicycle_loan' => 1,
			'computer_loan' => 1,
			'car_loan' => 1,
			'extra_loan' => 1,
			'education' => 1,
			'fixed_house_rent_recovery' => 1,
			'health_insurance' => 1,
			'water_supply_recovery' => 1,
			'electricity_recovery' => 1,
			'bf_recovery' => 1,
			'gi_recovery' => 1,
			'tin_shade_recovery' => 1,
			'salary_type_id' => 1,
			'total_payable' => 1,
			'fiscal_year_id' => 1,
			'month_id' => 1
		),
	);

}
