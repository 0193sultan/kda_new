<?php
App::uses('AppController', 'Controller');


class ReceiptPaymentReportsController extends AppController {

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
        $this->set('page_title', 'Receipt-Payment Report');
        $this->loadModel('FiscalYear');
        $this->loadModel('Month');
        $this->loadModel('DailyTransaction');

        $fiscal_year_list = $this->FiscalYear->find('list');
        $month_list = $this->Month->find('list');

        $this->set(compact('fiscal_year_list', 'month_list'));
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

    public function admin_get_receipt_payment_reports() {
        $this->loadModel('FiscalYear');
        $this->loadModel('Month');
        $this->loadModel('DailyTransaction');
            $fiscal_year_id = $this->request->data['fiscal_year_id'];
            $start_month_id = $this->request->data['start_month_id'];
            $end_month_id = $this->request->data['end_month_id'];

            $receipt_info = $this->DailyTransaction->find('all',array(
                    'conditions'=>array(
                            'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                            'DailyTransaction.month_id >='=>$start_month_id,
                            'DailyTransaction.month_id <='=>$end_month_id,
                            'DailyTransaction.transaction_category_id'=>2,
                            'DailyTransaction.entry_type_id'=>1
                        ),
                    'group'=>'DailyTransaction.parent_id',
                    'fields'=>array('sum(DailyTransaction.transaction_amount) as total', 'DailyTransaction.parent_id')
                ));

            $payment_info = $this->DailyTransaction->find('all',array(
                    'conditions'=>array(
                            'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                            'DailyTransaction.month_id >='=>$start_month_id,
                            'DailyTransaction.month_id <='=>$end_month_id,
                            'DailyTransaction.transaction_category_id'=>2,
                            'DailyTransaction.entry_type_id'=>2
                        ),
                    'group'=>'DailyTransaction.parent_id',
                    'fields'=>array('sum(DailyTransaction.transaction_amount) as total', 'DailyTransaction.parent_id')
                ));


            /*-------------------------------------- Opening Balance ---------------------------------------*/

            $start_date = $this->get_date($fiscal_year_id,$start_month_id);

            $opening_balance_info = $this->DailyTransaction->find('all',array(
                    'conditions'=>array(
                            'DailyTransaction.transaction_date <'=>$start_date
                        ),
                    'group'=>'DailyTransaction.bank_account_id',
                    'fields'=>array('max(DailyTransaction.id) as daily_transaction_id')
                ));

            $total_opening_balance = 0;
            foreach ($opening_balance_info as $key => $value) {
                $individual_opening_balance_info = $this->DailyTransaction->BankAccountBalance->find('first',array('conditions'=>array('BankAccountBalance.daily_transaction_id'=>$value[0]['daily_transaction_id'])));

                $individual_opening_balance = $individual_opening_balance_info['BankAccountBalance']['account_balance'];
                $total_opening_balance += $individual_opening_balance;
            }

            $opening_balance = sprintf('%0.2f', $total_opening_balance);

            /*-------------------------------------- Opening Balance End ---------------------------------------*/

            $all_head_list = $this->DailyTransaction->AccHeadList->find('list',array('fields'=>array('AccHeadList.id', 'AccHeadList.head_name')));

            $fiscal_year_list = $this->FiscalYear->find('list');
            $month_list = $this->Month->find('list');

            $this->set(compact('receipt_info', 'all_head_list', 'payment_info', 'start_month_id', 'end_month_id', 'fiscal_year_id', 'opening_balance', 'fiscal_year_list', 'month_list'));
    }

}
