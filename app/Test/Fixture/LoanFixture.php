<?php
/**
 * LoanFixture
 *
 */
class LoanFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false, 'key' => 'primary'),
		'name' => array('type' => 'string', 'null' => false, 'default' => null, 'length' => 100, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'loan_type_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'highest_limit' => array('type' => 'float', 'null' => false, 'default' => null, 'unsigned' => false),
		'loan_limit_currency' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 4, 'unsigned' => false),
		'applicable_for' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 4, 'unsigned' => false),
		'allow_multiple_time' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 4, 'unsigned' => false),
		'highest_installment_qty' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'lowest_installment_qty' => array('type' => 'integer', 'null' => false, 'default' => null, 'unsigned' => false),
		'recovery_policy' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 4, 'unsigned' => false),
		'status' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 4, 'unsigned' => false),
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
			'loan_type_id' => 1,
			'highest_limit' => 1,
			'loan_limit_currency' => 1,
			'applicable_for' => 1,
			'allow_multiple_time' => 1,
			'highest_installment_qty' => 1,
			'lowest_installment_qty' => 1,
			'recovery_policy' => 1,
			'status' => 1
		),
	);

}
