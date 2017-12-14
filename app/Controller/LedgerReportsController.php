<?php
App::uses('AppController', 'Controller');


class LedgerReportsController extends AppController {

/**
 * Components
 *
 * @var array
 */

	public $uses = false;
	public $components = array('Paginator', 'Session');


/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
        $this->set('page_title', 'Ledger Report');
        $this->loadModel('FiscalYear');
        $this->loadModel('Month');
        $this->loadModel('AccHeadType');

        $fiscal_year_list = $this->FiscalYear->find('list');
        $month_list = $this->Month->find('list');
        $head_type_list = $this->AccHeadType->find('list', array('fields'=>array('AccHeadType.id','AccHeadType.head_type_name')));

        $this->set(compact('fiscal_year_list', 'month_list', 'head_type_list'));
    }


    /*------------------Ajax-----------------*/

    public function admin_get_main_head() {
        $this->loadModel('AccHeadList');
        $head_type_id = $this->request->data['head_type_id'];

        $a['AccHeadList'] = array('id' => '', 'name' => '---- Please Select ----');
        $rs = array($a);

        $main_head_list = $this->AccHeadList->find('all', array(
                'conditions' => array('AccHeadList.acc_head_type_id' => $head_type_id,'AccHeadList.parent_id' => 0),
                'fields' => array('id','head_name as name'),
                'recursive'=>-1    
        ));
        $data_array = array_merge($rs,$main_head_list);

        echo json_encode($data_array);

        $this->autoRender = false;
    }

    public function admin_get_sub_head() {
        $this->loadModel('AccHeadList');
        $head_type_id = $this->request->data['head_type_id'];
        $main_head_id = $this->request->data['main_head_id'];

        $a['AccHeadList'] = array('id' => '', 'name' => 'All');
        $rs = array($a);

        $main_head_list = $this->AccHeadList->find('all', array(
                'conditions' => array('AccHeadList.acc_head_type_id' => $head_type_id,'AccHeadList.parent_id' => $main_head_id),
                'fields' => array('id','head_name as name'),
                'recursive'=>-1    
        ));
        $data_array = array_merge($rs,$main_head_list);

        echo json_encode($data_array);

        $this->autoRender = false;
    }

    public function admin_get_ledger_reports() {
        $this->loadModel('FiscalYear');
        $this->loadModel('Month');
        $this->loadModel('DailyTransaction');

            $fiscal_year_id = $this->request->data['fiscal_year_id'];
            $month_id = $this->request->data['month_id'];
            $head_type_id = $this->request->data['head_type_id'];
            $main_head_id = $this->request->data['main_head_id'];
            $sub_head_id = $this->request->data['sub_head_id'];
            $report_type_id = $this->request->data['report_type_id'];

            if ($sub_head_id != '') {
                if ($head_type_id == 1 && $report_type_id == 2) {
                    $ledger_report = $this->DailyTransaction->find('all', array(
                            'conditions'=>array(
                                'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                'DailyTransaction.month_id'=>$month_id,
                                'DailyTransaction.acc_head_list_id'=>$sub_head_id,
                                'DailyTransaction.acc_head_type_id'=>1,
                                    'DailyTransaction.transaction_type_id'=>1
                                ),
                            'order'=>'DailyTransaction.transaction_date ASC'
                        ));
                } else if ($head_type_id == 2  && $report_type_id == 1) {
                    $ledger_report = $this->DailyTransaction->find('all', array(
                            'conditions'=>array(
                                'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                'DailyTransaction.month_id'=>$month_id,
                                'DailyTransaction.acc_head_list_id'=>$sub_head_id,
                                'DailyTransaction.acc_head_type_id'=>2,
                                    'DailyTransaction.transaction_type_id'=>1
                                ),
                            'order'=>'DailyTransaction.transaction_date ASC'
                        ));
                } else if ($head_type_id == 3) {
                    if ($report_type_id == 1) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.acc_head_list_id'=>$sub_head_id,
                                    'DailyTransaction.acc_head_type_id'=>3,
                                    'DailyTransaction.entry_type_id'=>2,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    } else if ($report_type_id == 2) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.acc_head_list_id'=>$sub_head_id,
                                    'DailyTransaction.acc_head_type_id'=>3,
                                    'DailyTransaction.entry_type_id'=>1,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    }
                } else if ($head_type_id = 4) {
                    if ($report_type_id == 1) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.acc_head_list_id'=>$sub_head_id,
                                    'DailyTransaction.acc_head_type_id'=>4,
                                    'DailyTransaction.entry_type_id'=>2,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    } else if ($report_type_id == 2) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.acc_head_list_id'=>$sub_head_id,
                                    'DailyTransaction.acc_head_type_id'=>4,
                                    'DailyTransaction.entry_type_id'=>1,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    }
                } else if ($head_type_id = 5) {
                    if ($report_type_id == 1) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.acc_head_list_id'=>$sub_head_id,
                                    'DailyTransaction.acc_head_type_id'=>5,
                                    'DailyTransaction.entry_type_id'=>1,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    } else if ($report_type_id == 2) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.acc_head_list_id'=>$sub_head_id,
                                    'DailyTransaction.acc_head_type_id'=>5,
                                    'DailyTransaction.entry_type_id'=>2,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    }
                } else if ($head_type_id = 6) {
                    if ($report_type_id == 1) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.acc_head_list_id'=>$sub_head_id,
                                    'DailyTransaction.acc_head_type_id'=>6,
                                    'DailyTransaction.entry_type_id'=>1,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    } else if ($report_type_id == 2) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.acc_head_list_id'=>$sub_head_id,
                                    'DailyTransaction.acc_head_type_id'=>6,
                                    'DailyTransaction.entry_type_id'=>2,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    }
                }
            } else {
                if ($head_type_id == 1 && $report_type_id == 2) {
                    $ledger_report = $this->DailyTransaction->find('all', array(
                            'conditions'=>array(
                                'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                'DailyTransaction.month_id'=>$month_id,
                                'DailyTransaction.parent_id'=>$main_head_id,
                                'DailyTransaction.acc_head_type_id'=>1,
                                    'DailyTransaction.transaction_type_id'=>1
                                ),
                            'order'=>'DailyTransaction.transaction_date ASC'
                        ));
                } else if ($head_type_id == 2  && $report_type_id == 1) {
                    $ledger_report = $this->DailyTransaction->find('all', array(
                            'conditions'=>array(
                                'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                'DailyTransaction.month_id'=>$month_id,
                                'DailyTransaction.parent_id'=>$main_head_id,
                                'DailyTransaction.acc_head_type_id'=>2,
                                    'DailyTransaction.transaction_type_id'=>1
                                ),
                            'order'=>'DailyTransaction.transaction_date ASC'
                        ));
                } else if ($head_type_id == 3) {
                    if ($report_type_id == 1) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.parent_id'=>$main_head_id,
                                    'DailyTransaction.acc_head_type_id'=>3,
                                    'DailyTransaction.entry_type_id'=>2,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    } else if ($report_type_id == 2) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.parent_id'=>$main_head_id,
                                    'DailyTransaction.acc_head_type_id'=>3,
                                    'DailyTransaction.entry_type_id'=>1,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    }
                } else if ($head_type_id = 4) {
                    if ($report_type_id == 1) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.parent_id'=>$main_head_id,
                                    'DailyTransaction.acc_head_type_id'=>4,
                                    'DailyTransaction.entry_type_id'=>2,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    } else if ($report_type_id == 2) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.parent_id'=>$main_head_id,
                                    'DailyTransaction.acc_head_type_id'=>4,
                                    'DailyTransaction.entry_type_id'=>1,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    }
                } else if ($head_type_id = 5) {
                    if ($report_type_id == 1) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.parent_id'=>$main_head_id,
                                    'DailyTransaction.acc_head_type_id'=>5,
                                    'DailyTransaction.entry_type_id'=>1,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    } else if ($report_type_id == 2) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.parent_id'=>$main_head_id,
                                    'DailyTransaction.acc_head_type_id'=>5,
                                    'DailyTransaction.entry_type_id'=>2,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    }
                } else if ($head_type_id = 6) {
                    if ($report_type_id == 1) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.parent_id'=>$main_head_id,
                                    'DailyTransaction.acc_head_type_id'=>6,
                                    'DailyTransaction.entry_type_id'=>1,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    } else if ($report_type_id == 2) {
                        $ledger_report = $this->DailyTransaction->find('all', array(
                                'conditions'=>array(
                                    'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                    'DailyTransaction.month_id'=>$month_id,
                                    'DailyTransaction.parent_id'=>$main_head_id,
                                    'DailyTransaction.acc_head_type_id'=>6,
                                    'DailyTransaction.entry_type_id'=>2,
                                    'DailyTransaction.transaction_type_id'=>1
                                    ),
                                'order'=>'DailyTransaction.transaction_date ASC'
                            ));
                    }
                }
            }

        $all_head_list = $this->DailyTransaction->AccHeadList->find('list',array('fields'=>array('AccHeadList.id', 'AccHeadList.head_name')));

        $fiscal_year_list = $this->FiscalYear->find('list');
        $month_list = $this->Month->find('list');

        $this->set(compact('all_head_list', 'month_id', 'fiscal_year_id', 'main_head_id','ledger_report','report_type_id', 'fiscal_year_list', 'month_list'));

    }

}
