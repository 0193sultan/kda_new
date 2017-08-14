<?php
App::uses('AppModel', 'Model');
/**
 * ProductConvertHistory Model
 *
 * @property Store $Store
 * @property FromProduct $FromProduct
 * @property ToProduct $ToProduct
 * @property FromStatus $FromStatus
 * @property ToStatus $ToStatus
 */
class ProductConvertHistory extends AppModel {

/**
 * Use table
 *
 * @var mixed False or table name
 */
	public $useTable = 'product_convert_history';


	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
		'Store' => array(
			'className' => 'Store',
			'foreignKey' => 'store_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		/*'FromProduct' => array(
			'className' => 'FromProduct',
			'foreignKey' => 'from_product_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'ToProduct' => array(
			'className' => 'ToProduct',
			'foreignKey' => 'to_product_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'FromStatus' => array(
			'className' => 'FromStatus',
			'foreignKey' => 'from_status_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'ToStatus' => array(
			'className' => 'ToStatus',
			'foreignKey' => 'to_status_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)*/
	);
}
