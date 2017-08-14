<?php
App::uses('JobStatus', 'Model');

/**
 * JobStatus Test Case
 *
 */
class JobStatusTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.job_status'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->JobStatus = ClassRegistry::init('JobStatus');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->JobStatus);

		parent::tearDown();
	}

}
