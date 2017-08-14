<?php
App::uses('BanksController', 'Controller');

/**
 * BanksController Test Case
 *
 */
class BanksControllerTest extends ControllerTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.bank',
		'app.employee',
		'app.employee_grade',
		'app.scale',
		'app.designation',
		'app.basic',
		'app.new_basic',
		'app.quota',
		'app.employee_type',
		'app.religion',
		'app.job_status',
		'app.sex',
		'app.marital_status',
		'app.living_status'
	);

}
