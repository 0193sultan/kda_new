<?php
App::uses('AppController', 'Controller');


class IncomeExpenseReportsController extends AppController {

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
        $this->set('page_title', 'Income-Expense Report');
        $this->loadModel('FiscalYear');

        $fiscal_year_list = $this->FiscalYear->find('list');

        $this->set(compact('fiscal_year_list'));
    }

    public function admin_get_income_expense_reports() {
        $this->loadModel('FiscalYear');
        $this->loadModel('DailyTransaction');
            $fiscal_year_id = $this->request->data['fiscal_year_id'];

            $income_info_current = $this->DailyTransaction->find('all',array(
                    'conditions'=>array(
                            'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                            'DailyTransaction.acc_head_type_id'=>1
                        ),
                    'group'=>'DailyTransaction.parent_id',
                    'fields'=>array('sum(DailyTransaction.transaction_amount) as total_current_income', 'DailyTransaction.parent_id')
                ));

            $income_info_previous = $this->DailyTransaction->find('all',array(
                    'conditions'=>array(
                            'DailyTransaction.fiscal_year_id'=>$fiscal_year_id-1,
                            'DailyTransaction.acc_head_type_id'=>1
                        ),
                    'group'=>'DailyTransaction.parent_id',
                    'fields'=>array('sum(DailyTransaction.transaction_amount) as total_previous_income', 'DailyTransaction.parent_id')
                ));

            foreach ($income_info_current as $key => $value) {
                $income_info[$value['DailyTransaction']['parent_id']]['total_current_income']=$value[0]['total_current_income'];
            }
            foreach ($income_info_previous as $key => $value) {
                $income_info[$value['DailyTransaction']['parent_id']]['total_previous_income']=$value[0]['total_previous_income'];
            }

            $expense_info_current = $this->DailyTransaction->find('all',array(
                    'conditions'=>array(
                            'DailyTransaction.fiscal_year_id'=>$fiscal_year_id,
                            'DailyTransaction.acc_head_type_id'=>2
                        ),
                    'group'=>'DailyTransaction.parent_id',
                    'fields'=>array('sum(DailyTransaction.transaction_amount) as total_current_expense', 'DailyTransaction.parent_id')
                ));

            $expense_info_previous = $this->DailyTransaction->find('all',array(
                    'conditions'=>array(
                            'DailyTransaction.fiscal_year_id'=>$fiscal_year_id-1,
                            'DailyTransaction.acc_head_type_id'=>2
                        ),
                    'group'=>'DailyTransaction.parent_id',
                    'fields'=>array('sum(DailyTransaction.transaction_amount) as total_previous_expense', 'DailyTransaction.parent_id')
                ));

            foreach ($expense_info_current as $key => $value) {
                $expense_info[$value['DailyTransaction']['parent_id']]['total_current_expense']=$value[0]['total_current_expense'];
            }
            foreach ($expense_info_previous as $key => $value) {
                $expense_info[$value['DailyTransaction']['parent_id']]['total_previous_expense']=$value[0]['total_previous_expense'];
            }

            $all_head_list = $this->DailyTransaction->AccHeadList->find('list',array('fields'=>array('AccHeadList.id', 'AccHeadList.head_name')));

            $fiscal_year_list = $this->FiscalYear->find('list');

            $this->set(compact('income_info', 'all_head_list', 'expense_info', 'fiscal_year_id', 'fiscal_year_list'));
    }

}
