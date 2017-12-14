<?php
/**
 * AccHeadListFixture
 *
 */
class AccHeadListFixture extends CakeTestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 6, 'unsigned' => false, 'key' => 'primary'),
		'acc_head_type_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 6, 'unsigned' => false, 'key' => 'index'),
		'head_name' => array('type' => 'string', 'null' => true, 'default' => null, 'length' => 200, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'parent_id' => array('type' => 'integer', 'null' => false, 'default' => '0', 'length' => 8, 'unsigned' => false),
		'acc_effect_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 4, 'unsigned' => false, 'key' => 'index'),
		'order_no' => array('type' => 'integer', 'null' => true, 'default' => null, 'length' => 3, 'unsigned' => false),
		'action_head_id' => array('type' => 'integer', 'null' => true, 'default' => null, 'unsigned' => false),
		'action_sub_head_id' => array('type' => 'integer', 'null' => true, 'default' => null, 'unsigned' => false),
		'action_type' => array('type' => 'integer', 'null' => true, 'default' => null, 'length' => 4, 'unsigned' => false),
		'user_id' => array('type' => 'integer', 'null' => false, 'default' => null, 'length' => 7, 'unsigned' => false),
		'created_at' => array('type' => 'datetime', 'null' => false, 'default' => null),
		'updated_at' => array('type' => 'datetime', 'null' => false, 'default' => null),
		'indexes' => array(
			'PRIMARY' => array('column' => 'id', 'unique' => 1),
			'fk_acc_head_list_acc_effect_info_idx' => array('column' => 'acc_effect_id', 'unique' => 0),
			'fk_acc_head_list_acc_head_type1_idx' => array('column' => 'acc_head_type_id', 'unique' => 0)
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
			'acc_head_type_id' => 1,
			'head_name' => 'Lorem ipsum dolor sit amet',
			'parent_id' => 1,
			'acc_effect_id' => 1,
			'order_no' => 1,
			'action_head_id' => 1,
			'action_sub_head_id' => 1,
			'action_type' => 1,
			'user_id' => 1,
			'created_at' => '2017-10-17 13:02:05',
			'updated_at' => '2017-10-17 13:02:05'
		),
	);

}
