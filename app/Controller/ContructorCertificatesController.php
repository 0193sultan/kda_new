<?php
App::uses('AppController', 'Controller');
/**
 * Collections Controller
 *
 * @property Collection $Collection
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ContructorCertificatesController extends AppController {

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
			
			
			$work_order_array = $this->WorkOrder->find('all',array('conditions' => array('WorkOrder.contructor_project_name_id' => $project_name_id,'WorkOrder.contructor_name_id' => $contructor_name_id)));
			// pr($work_order_array);
			// die();
			// $w_id = $work_order_array[0]['WorkOrder']['id'];
			// foreach ($variable as $key => $value) {
			// 	# code...
			// }
			// pr($work_order_array);
			// die();
			
			$advance_payment_array = $this->ContructorAdvancePayment->find('all',array('conditions' => array('ContructorAdvancePayment.contructor_project_name_id' => $project_name_id,'ContructorAdvancePayment.contructor_name_id' => $contructor_name_id)));

			

			$bill_payment_array = $this->ContructorBillPayment->find('all',array('conditions' => array('ContructorBillPayment.contructor_project_name_id' => $project_name_id,'ContructorBillPayment.contructor_name_id' => $contructor_name_id)));
			

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