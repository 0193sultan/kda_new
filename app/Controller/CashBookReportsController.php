<?php
App::uses('AppController', 'Controller');


class CashBookReportsController extends AppController {

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
        $this->set('page_title', 'Cash-Book Report');
        $this->loadModel('FiscalYear');
        $this->loadModel('Month');
        $report_type= 0;

        $fiscal_year_list = $this->FiscalYear->find('list');
        $month_list = $this->Month->find('list');

        $this->set(compact('fiscal_year_list', 'month_list', 'report_type'));
    }

    private function get_date($fiscal_year_id,$month_id) {
        $fiscal_year_info = $this->FiscalYear->find('first',array('conditions'=>array('FiscalYear.id'=>$fiscal_year_id),'recursive'=>-1));
        $fiscal_year = $fiscal_year_info['FiscalYear']['name'];

        $year = explode('-', $fiscal_year);
        $year_first_part = $year[0];
        $year_second_part = $year[1];

        if ($month_id >= 1 && $month_id <= 3) {
            $month = $month_id+6;
            $start_date = $year_first_part.'-0'.$month.'-01';
        } else if ($month_id >= 4 && $month_id <= 6) {
            $month = $month_id+6;
            $start_date = $year_first_part.'-'.$month.'-01';
        } else if ($month_id >= 7 && $month_id <= 12) {
            $month = $month_id-6;
            $start_date = $year_second_part.'-0'.$month.'-01';
        }

        return $start_date;
    }

    public function admin_get_cash_book_reports() {
        $this->loadModel('FiscalYear');
        $this->loadModel('Month');
        $this->loadModel('DailyTransaction');
        $this->loadModel('BankAccountBalance');

            $report_type = $this->request->data['report_type'];

            $bank_account_info = $this->DailyTransaction->BankAccount->find('all',array(
                    'conditions'=>array('BankAccount.status'=>'Active'),
                    'fields'=>array('BankInfo.name','BankAccount.account_no'),
                    'recursive'=>1
                ));

            if ($report_type == 1) {
                $start_date = date('Y-m-d', strtotime($this->request->data['start_date']));
                $end_date = date('Y-m-d', strtotime($this->request->data['end_date']));                

                /*--------------------------------Opening Balance---------------------------*/
                $opening_balance_date_info = $this->DailyTransaction->find('all',array(
                        'conditions'=>array(
                                'DailyTransaction.transaction_date <'=>$start_date
                            ),
                        'group'=>array('DailyTransaction.bank_info_id', 'DailyTransaction.bank_account_id'),
                        'fields'=>array('max(DailyTransaction.id) as last_transaction_id'),
                        'recursive'=>1
                    ));

                foreach ($opening_balance_date_info as $key => $value) {
                    $opening_balance_info[$key] = $this->BankAccountBalance->find('all',array(
                            'conditions'=>array('BankAccountBalance.daily_transaction_id'=>$value[0]['last_transaction_id']),
                            'recursive'=>-1
                        ));
                }

                if (!empty($opening_balance_info)) {
                    foreach ($opening_balance_info as $key => $value) {
                        if (!empty($value[0]['BankAccountBalance']['bank_account_id'])) {
                            $opening_balance[$value[0]['BankAccountBalance']['bank_account_id']]=$value[0]['BankAccountBalance']['account_balance'];
                        }
                    }
                }


                /*----------------------Debit Section-----------------------*/

                $debit_info = $this->DailyTransaction->find('all',array(
                        'conditions'=>array(
                                'DailyTransaction.transaction_date >='=>$start_date,
                                'DailyTransaction.transaction_date <='=>$end_date,
                                'DailyTransaction.entry_type_id'=>1
                            ),
                        'group'=>array('DailyTransaction.bank_info_id', 'DailyTransaction.bank_account_id', 'DailyTransaction.acc_head_list_id'),
                        'fields'=>array('sum(DailyTransaction.transaction_amount) as bank_and_head_wise_total_amount', 'DailyTransaction.bank_info_id', 'DailyTransaction.bank_account_id', 'DailyTransaction.acc_head_list_id'),
                        'recursive'=>-1
                    ));

                foreach ($debit_info as $key => $value) {
                    $debit_balance_head_wise[$value['DailyTransaction']['acc_head_list_id']][$value['DailyTransaction']['bank_account_id']]=$value[0]['bank_and_head_wise_total_amount'];
                }


                /*---------------------------Credit Section---------------------*/

                $credit_info = $this->DailyTransaction->find('all',array(
                        'conditions'=>array(
                                'DailyTransaction.transaction_date >='=>$start_date,
                                'DailyTransaction.transaction_date <='=>$end_date,
                                'DailyTransaction.entry_type_id'=>2
                            ),
                        'group'=>array('DailyTransaction.bank_info_id', 'DailyTransaction.bank_account_id', 'DailyTransaction.acc_head_list_id'),
                        'fields'=>array('sum(DailyTransaction.transaction_amount) as bank_and_head_wise_total_amount', 'DailyTransaction.bank_info_id', 'DailyTransaction.bank_account_id', 'DailyTransaction.acc_head_list_id'),
                        'recursive'=>-1
                    ));

                foreach ($credit_info as $key => $value) {
                    $credit_balance_head_wise[$value['DailyTransaction']['acc_head_list_id']][$value['DailyTransaction']['bank_account_id']]=$value[0]['bank_and_head_wise_total_amount'];
                }


            } else if ($report_type == 2) {
                $fiscal_year_id = $this->request->data['fiscal_year_id'];
                $start_month_id = $this->request->data['start_month_id'];
                $end_month_id = $this->request->data['end_month_id'];

                /*--------------------------------Opening Balance---------------------------*/

                $start_date = $this->get_date($fiscal_year_id,$start_month_id);

                $opening_balance_date_info = $this->DailyTransaction->find('all',array(
                        'conditions'=>array(
                                'DailyTransaction.transaction_date <'=>$start_date
                            ),
                        'group'=>array('DailyTransaction.bank_info_id', 'DailyTransaction.bank_account_id'),
                        'fields'=>array('max(DailyTransaction.id) as last_transaction_id'),
                        'recursive'=>1
                    ));

                foreach ($opening_balance_date_info as $key => $value) {
                    $opening_balance_info[$key] = $this->BankAccountBalance->find('all',array(
                            'conditions'=>array('BankAccountBalance.daily_transaction_id'=>$value[0]['last_transaction_id']),
                            'recursive'=>-1
                        ));
                }

                if (!empty($opening_balance_info)) {
                    foreach ($opening_balance_info as $key => $value) {
                        if (!empty($value[0]['BankAccountBalance']['bank_account_id'])) {
                            $opening_balance[$value[0]['BankAccountBalance']['bank_account_id']]=$value[0]['BankAccountBalance']['account_balance'];
                        }
                    }
                }


                /*----------------------Debit Section-----------------------*/

                $debit_info = $this->DailyTransaction->find('all',array(
                        'conditions'=>array(
                                'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                'DailyTransaction.month_id >='=>$start_month_id,
                                'DailyTransaction.month_id <='=>$end_month_id,
                                'DailyTransaction.entry_type_id'=>1
                            ),
                        'group'=>array('DailyTransaction.bank_info_id', 'DailyTransaction.bank_account_id', 'DailyTransaction.acc_head_list_id'),
                        'fields'=>array('sum(DailyTransaction.transaction_amount) as bank_and_head_wise_total_amount', 'DailyTransaction.bank_info_id', 'DailyTransaction.bank_account_id', 'DailyTransaction.acc_head_list_id'),
                        'recursive'=>-1
                    ));

                foreach ($debit_info as $key => $value) {
                    $debit_balance_head_wise[$value['DailyTransaction']['acc_head_list_id']][$value['DailyTransaction']['bank_account_id']]=$value[0]['bank_and_head_wise_total_amount'];
                }


                /*---------------------------Credit Section---------------------*/

                $credit_info = $this->DailyTransaction->find('all',array(
                        'conditions'=>array(
                                'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                                'DailyTransaction.month_id >='=>$start_month_id,
                                'DailyTransaction.month_id <='=>$end_month_id,
                                'DailyTransaction.entry_type_id'=>2
                            ),
                        'group'=>array('DailyTransaction.bank_info_id', 'DailyTransaction.bank_account_id', 'DailyTransaction.acc_head_list_id'),
                        'fields'=>array('sum(DailyTransaction.transaction_amount) as bank_and_head_wise_total_amount', 'DailyTransaction.bank_info_id', 'DailyTransaction.bank_account_id', 'DailyTransaction.acc_head_list_id'),
                        'recursive'=>-1
                    ));

                foreach ($credit_info as $key => $value) {
                    $credit_balance_head_wise[$value['DailyTransaction']['acc_head_list_id']][$value['DailyTransaction']['bank_account_id']]=$value[0]['bank_and_head_wise_total_amount'];
                }

            }


        $all_head_list = $this->DailyTransaction->AccHeadList->find('list',array('fields'=>array('AccHeadList.id', 'AccHeadList.head_name')));

        $fiscal_year_list = $this->FiscalYear->find('list');
        $month_list = $this->Month->find('list');

        $this->set(compact('bank_account_info', 'all_head_list', 'debit_balance_head_wise', 'fiscal_year_id', 'credit_balance_head_wise', 'start_month_id', 'end_month_id', 'start_date', 'end_date', 'opening_balance', 'fiscal_year_list', 'month_list', 'report_type'));

    }

}
