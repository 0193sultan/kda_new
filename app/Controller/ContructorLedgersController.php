<?php
App::uses('AppController', 'Controller');
/**
 * Collections Controller
 *
 * @property Collection $Collection
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ContructorLedgersController extends AppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index()
	{

		if($this->request->is('post'))
		{
			
			
			$this->loadModel('WorkOrder');
			$this->loadModel('ContructorBillPayment');
			$this->loadModel('ContructorAdvancePayment');
			

			$all = $this->request->data;

			


			$project_name_id = $all['ContructorLedgers']['contructor_project_name_id'];
			$contructor_name_id = $all['ContructorLedgers']['contructor_name_id'];
			$work_order_no = $all['work_order_no_1'];

			// pr($work_order_no);
			// die();

			$start_date = date("Y-m-d", strtotime($all['ContructorLedgers']['start_date']));
			$end_date = date('Y-m-d', strtotime($all['ContructorLedgers']['end_date']));
			
			$between_con_bill = array('ContructorBillPayment.bill_pay_date >=' => $start_date, 'ContructorBillPayment.bill_pay_date <=' => $end_date);

			$between_con_advance = array('ContructorAdvancePayment.payment_date >=' => $start_date, 'ContructorAdvancePayment.payment_date <=' => $end_date);
			
			$work_order_array = $this->WorkOrder->find('all',array('conditions' => array('WorkOrder.contructor_project_name_id' => $project_name_id,'WorkOrder.contructor_name_id' => $contructor_name_id,'WorkOrder.work_order_no' => $work_order_no)));
			$w_id = $work_order_array[0]['WorkOrder']['id'];
			
			$advance_payment_array = $this->ContructorAdvancePayment->find('all',array('conditions' => array('ContructorAdvancePayment.work_order_id' => $w_id,'AND' => array($between_con_advance))));

			

			$bill_payment_array = $this->ContructorBillPayment->find('all',array('conditions' => array('ContructorBillPayment.work_order_id' => $w_id, 'AND' => array($between_con_bill))));
			

			$this->set(compact('bill_payment_array','work_order_array','advance_payment_array'));
		}

		$this->loadModel('ContructorProjectName');
		$ContructorProjectName = $this->ContructorProjectName->find('list');

		$this->loadModel('ContructorName');
		$ContructorName = $this->ContructorName->find('list');

		$this->loadModel('WorkOrder');
		// $workorder = $this->ContructorName->find('WorkOrder');

		$this->set(compact('ContructorProjectName','ContructorName'));

	}
}