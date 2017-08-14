<?php
App::uses('AppController', 'Controller');
/**
 * Designations Controller
 *
 * @property Designation $Designation
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class DashboardsController extends AppController {

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
	public function admin_index() {
				
	/*	$this->loadModel('SalesPerson');		
		$this->loadModel('Memo');		
		$this->loadModel('MemoSyncHistory');		
		$so_list = $this->SalesPerson->find('all', array(
			'fields' => array('SalesPerson.id','SalesPerson.name','SalesPerson.last_data_push_time','Territory.name'),
			'conditions' => array(
				'SalesPerson.office_id' => $this->UserAuth->getOfficeId(),
				'SalesPerson.territory_id >' => 0,
				'User.user_group_id' => 4
			)
		));	
		$data_array = array();
		foreach($so_list as $so){ 
			
			$this->Memo->virtualFields = array(
				'total_memo' => 'COUNT(*)',
				'total_memo_value' => 'SUM(Memo.gross_value)'
			); 
			$memo = $this->Memo->find('first', array(
				'conditions' => array('Memo.sales_person_id' => $so['SalesPerson']['id'],'Memo.memo_date >=' => $this->current_date().' 00:00:00','Memo.memo_date <=' => $this->current_date().' 23:59:59'),
				'fields' => array('total_memo', 'total_memo_value'),
				'recursive' => -1
			));
			
			$memo_sync = $this->MemoSyncHistory->find('first', array(
				'conditions' => array('MemoSyncHistory.so_id' => $so['SalesPerson']['id'],'MemoSyncHistory.date' => $this->current_date()),
				'fields' => array('total_memo'),
				'recursive' => -1
			));
			
			$data['name'] = $so['SalesPerson']['name'];
			$data['territory'] = $so['Territory']['name'];
			$data['time'] = $so['SalesPerson']['last_data_push_time'];
			$data['hours'] = $this->get_hours($so['SalesPerson']['last_data_push_time']);
			$data['total_sync_memo'] = (!empty($memo_sync) ? $memo_sync['MemoSyncHistory']['total_memo'] : 0);
			$data['total_memo'] = $memo['Memo']['total_memo'];
			$data['total_memo_value'] = $memo['Memo']['total_memo_value'];
			$data_array[] = $data;
		}
                $result=compact('data_array');
		$this->set(compact('data_array'));*/	
	}
	
	public function get_hours($datetime = '')
	{
		if($datetime == '')
		{
			return 100;
		}else{
			$dateDiff = intval((strtotime($this->current_datetime()) - strtotime($datetime))/60);
			$hours = intval($dateDiff/60);
			return $hours;
		}		
	}

}
