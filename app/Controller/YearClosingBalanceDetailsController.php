<?php

App::uses('AppController', 'Controller');
App::import('Controller', 'BalanceSheets');
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TrialBalances
 *
 * @author USER-PC
 */
class YearClosingBalanceDetailsController extends AppController {

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Paginator', 'Session');

    public function get_depreCiation_rate($acc_head_list_id, $parent_id, $fiscal_year_id) {
        $this->loadModel('AnnualDepriciation');
        $annualDepriciation = $this->AnnualDepriciation->find('all', array(
            'conditions' => array(
                'AnnualDepriciation.acc_head_list_id' => $acc_head_list_id,
                'AnnualDepriciation.parent_id' => $parent_id,
                'AnnualDepriciation.fiscal_year_id' => $fiscal_year_id,
            ),
            'fields' => 'AnnualDepriciation.id,'
            . 'AnnualDepriciation.depriciation_value,',
            'order' => 'AnnualDepriciation.id ASC',
            'limit' => 1,
            'recursive' => -1
        ));
        if (count($annualDepriciation) > 0) {
            return $annualDepriciation[0]['AnnualDepriciation']['depriciation_value'];
        } else {
            return 0;
        }
    }

    public function get_depreCiation_amount($acc_head_list_id, $parent_id, $fiscal_year_id, $head_balance) {
        $this->loadModel('AnnualDepriciation');
        $annualDepriciation = $this->AnnualDepriciation->find('all', array(
            'conditions' => array(
                'AnnualDepriciation.acc_head_list_id' => $acc_head_list_id,
                'AnnualDepriciation.parent_id' => $parent_id,
                'AnnualDepriciation.fiscal_year_id' => $fiscal_year_id,
            ),
            'fields' => 'AnnualDepriciation.id,'
            . 'AnnualDepriciation.depriciation_value,',
            'order' => 'AnnualDepriciation.id ASC',
            'limit' => 1,
            'recursive' => -1
        ));
        if (count($annualDepriciation) > 0) {
            $depriciation_amount = ($annualDepriciation[0]['AnnualDepriciation']['depriciation_value'] * $head_balance) / 100;
            return $depriciation_amount;
        } else {
            return 0;
        }
    }

    public function get_receive_or_payment($entry_type_id, $acc_head_type_id, $acc_head_list_id, $parent_id, $fiscal_year_id) {
        $this->loadModel('DailyTransaction');
        $dailyTransaction = $this->DailyTransaction->find('all', array(
            'conditions' => array(
                'DailyTransaction.entry_type_id' => $entry_type_id,
                'DailyTransaction.acc_head_type_id' => $acc_head_type_id,
                'DailyTransaction.acc_head_list_id' => $acc_head_list_id,
                'DailyTransaction.parent_id' => $parent_id,
                'DailyTransaction.fiscal_year_id' => $fiscal_year_id,
            ),
            'fields' => 'SUM(DailyTransaction.transaction_amount),',
            'order' => 'DailyTransaction.id ASC',
            'limit' => 1,
            'recursive' => -1
        ));
        if (!empty($dailyTransaction[0][0]['SUM(`DailyTransaction`.`transaction_amount`)'])) {
            return $dailyTransaction[0][0]['SUM(`DailyTransaction`.`transaction_amount`)'];
        } else {
            return 0;
        }
    }

    public function get_head_balance($depreciation_amount, $fiscal_year_id, $parent_id, $acc_head_list_id) {
        $this->loadModel('DailyTransaction');
        $this->loadModel('HeadWiseAccountBalance');
        //return $acc_head_list_id;
        $balanceSheetsObj = new BalanceSheetsController();
        $get_data = $balanceSheetsObj->get_head_wise_acc_balance_with_daily_transaction($fiscal_year_id, $parent_id, $acc_head_list_id, $year_is_less_than_or_equal = -1);
        if (count($get_data) > 0) {
            return $get_data[0]['b']['head_balance'] - $depreciation_amount;
        } else {
            return $depreciation_amount;
        }
    }

    public function admin_index() {
        $this->set('page_title', 'Year Closings');
        $this->loadModel('FiscalYear');
        $this->loadModel('DailyTransaction');
        $this->loadModel('HeadWiseAccountBalance');
        $fiscalYears = $this->FiscalYear->find('list');
        if ($this->request->is('post')) {
            $close_year_id = $this->request->data['OpeningBalances']['close_year_id'];
            $balanceSheetsObj = new BalanceSheetsController();
            $data = $balanceSheetsObj->get_head_wise_acc_balance_with_daily_transaction($close_year_id, $parent_id = NULL, $child_id = NULL, $year_is_greater_than_or_equal = 0);
            // $data = $this->DailyTransaction->query("SELECT a.id,a.acc_head_type_id,a.acc_head_list_id,a.parent_id,a.fiscal_year_id,b.head_balance FROM daily_transactions as a LEFT JOIN head_wise_account_balance as b ON a.id = b.daily_transaction_id WHERE a.id IN (SELECT MAX(a.id) AS id FROM daily_transactions as a WHERE a.fiscal_year_id=$close_year_id GROUP BY a.acc_head_list_id)");
            $yearHas = $this->YearClosingBalanceDetail->hasAny(['fiscal_year_id' => $this->request->data['OpeningBalances']['close_year_id']]);
            $year_interval = $this->request->data['OpeningBalances']['next_open_year_id'] - $this->request->data['OpeningBalances']['close_year_id'];
            if ($year_interval == 1) {
                $this->FiscalYear->id = $this->request->data['OpeningBalances']['close_year_id'];
                $this->FiscalYear->saveField("status", 0);

                $this->FiscalYear->id = $this->request->data['OpeningBalances']['next_open_year_id'];
                $this->FiscalYear->saveField("status", 1);
            } else {
                $this->Session->setFlash(__('Opening and Closing Year interval is not right format. Please, try again.'), 'flash/error');
                $this->redirect(array('action' => 'index'));
            }
            if ($this->request->data['OpeningBalances']['close_year_id'] == 1) {
                if (empty($yearHas)) {
                    foreach ($data as $key => $value) {
                        $newArray[$key]['acc_head_type_id'] = $value['a']['acc_head_type_id'];
                        $newArray[$key]['parent_id'] = $value['a']['parent_id'];
                        $newArray[$key]['acc_head_list_id'] = $value['a']['acc_head_list_id'];
                        $newArray[$key]['head_balance'] = $value['b']['head_balance'];
                        $newArray[$key]['depreciation_rate'] = $this->get_depreCiation_rate($value['a']['acc_head_list_id'], $value['a']['parent_id'], $value['a']['fiscal_year_id']);
                        $newArray[$key]['depreciation_amount'] = $this->get_depreCiation_rate($value['a']['acc_head_list_id'], $value['a']['parent_id'], $value['a']['fiscal_year_id'], $value['b']['head_balance']);
                        $newArray[$key]['total_receive'] = $this->get_receive_or_payment(1, $value['a']['acc_head_type_id'], $value['a']['acc_head_list_id'], $value['a']['parent_id'], $value['a']['fiscal_year_id']);
                        $newArray[$key]['total_payment'] = $this->get_receive_or_payment(2, $value['a']['acc_head_type_id'], $value['a']['acc_head_list_id'], $value['a']['parent_id'], $value['a']['fiscal_year_id']);
                        $newArray[$key]['fiscal_year_id'] = $value['a']['fiscal_year_id'];
                        $newArray[$key]['created_at'] = $this->current_datetime();
                    }
                    $this->YearClosingBalanceDetail->saveAll($newArray);
                    $this->Session->setFlash(__('The Year has been Closed'), 'flash/success');
                    $this->redirect(array('action' => 'index'));
                } else {
                    $this->Session->setFlash(__('Data already exist in the Closing Year. Please, try again.'), 'flash/error');
                    $this->redirect(array('action' => 'index'));
                }
            } else {
                if (empty($yearHas)) {
                    /* data before Closing Year from YearClosingBalanceDetail table */
                    $yearClosingBalanceDetail = $this->YearClosingBalanceDetail->find('all', array(
                        'conditions' => array(
                            'YearClosingBalanceDetail.fiscal_year_id' => $this->request->data['OpeningBalances']['close_year_id'] - 1,
                        ),
                        // 'fields' => 'SUM(DailyTransaction.transaction_amount),',
                        'order' => 'YearClosingBalanceDetail.id ASC',
                        // 'limit' => 1,
                        'recursive' => -1
                    ));

                    foreach ($yearClosingBalanceDetail as $key => $value) {
                        $dataBeforeClosingYear[$value['YearClosingBalanceDetail']['acc_head_list_id']]['acc_head_type_id'] = $value['YearClosingBalanceDetail']['acc_head_type_id'];
                        $dataBeforeClosingYear[$value['YearClosingBalanceDetail']['acc_head_list_id']]['parent_id'] = $value['YearClosingBalanceDetail']['parent_id'];
                        $dataBeforeClosingYear[$value['YearClosingBalanceDetail']['acc_head_list_id']]['acc_head_list_id'] = $value['YearClosingBalanceDetail']['acc_head_list_id'];
                        $dataBeforeClosingYear[$value['YearClosingBalanceDetail']['acc_head_list_id']]['head_balance'] = $value['YearClosingBalanceDetail']['head_balance'];
                        $dataBeforeClosingYear[$value['YearClosingBalanceDetail']['acc_head_list_id']]['depreciation_rate'] = $value['YearClosingBalanceDetail']['depreciation_rate'];
                        $dataBeforeClosingYear[$value['YearClosingBalanceDetail']['acc_head_list_id']]['depreciation_amount'] = $value['YearClosingBalanceDetail']['depreciation_amount'];
                        $dataBeforeClosingYear[$value['YearClosingBalanceDetail']['acc_head_list_id']]['total_receive'] = $value['YearClosingBalanceDetail']['total_receive'];
                        $dataBeforeClosingYear[$value['YearClosingBalanceDetail']['acc_head_list_id']]['total_payment'] = $value['YearClosingBalanceDetail']['total_payment'];
                        $dataBeforeClosingYear[$value['YearClosingBalanceDetail']['acc_head_list_id']]['fiscal_year_id'] = $this->request->data['OpeningBalances']['close_year_id'];
                        $dataBeforeClosingYear[$value['YearClosingBalanceDetail']['acc_head_list_id']]['created_at'] = $this->current_datetime();
                    }
                    /* data before Closing Year from YearClosingBalanceDetail end */

                    /* Closing Year Data for current year */
                    foreach ($data as $key => $value) {
                        $currentYearData[$value['a']['acc_head_list_id']]['acc_head_type_id'] = $value['a']['acc_head_type_id'];
                        $currentYearData[$value['a']['acc_head_list_id']]['parent_id'] = $value['a']['parent_id'];
                        $currentYearData[$value['a']['acc_head_list_id']]['acc_head_list_id'] = $value['a']['acc_head_list_id'];
                        $currentYearData[$value['a']['acc_head_list_id']]['depreciation_rate'] = 0;
                        $currentYearData[$value['a']['acc_head_list_id']]['depreciation_amount'] = 0;
                        $currentYearData[$value['a']['acc_head_list_id']]['head_balance'] = $value['b']['head_balance'];
                        $currentYearData[$value['a']['acc_head_list_id']]['total_receive'] = $this->get_receive_or_payment(1, $value['a']['acc_head_type_id'], $value['a']['acc_head_list_id'], $value['a']['parent_id'], $value['a']['fiscal_year_id']);
                        $currentYearData[$value['a']['acc_head_list_id']]['total_payment'] = $this->get_receive_or_payment(2, $value['a']['acc_head_type_id'], $value['a']['acc_head_list_id'], $value['a']['parent_id'], $value['a']['fiscal_year_id']);
                        $currentYearData[$value['a']['acc_head_list_id']]['fiscal_year_id'] = $value['a']['fiscal_year_id'];
                        $currentYearData[$value['a']['acc_head_list_id']]['created_at'] = $this->current_datetime();
                    }
                    /* Closing Year Data end */

                    /* Replace current Year on YearClosingBalanceDetail start */
                    foreach ($currentYearData as $key => $value) {
                        $dataBeforeClosingYear[$key] = $value;
                    }
                    /* Replace current Year on YearClosingBalanceDetail end */

                    /* DepreCiation and Recevice Payment Calculation start */
                    foreach ($dataBeforeClosingYear as $key => $value) {
                        $newArray[$key]['acc_head_type_id'] = $value['acc_head_type_id'];
                        $newArray[$key]['parent_id'] = $value['parent_id'];
                        $newArray[$key]['acc_head_list_id'] = $value['acc_head_list_id'];
                        $newArray[$key]['depreciation_rate'] = $this->get_depreCiation_rate($value['acc_head_list_id'], $value['parent_id'], $value['fiscal_year_id']);
                        $newArray[$key]['depreciation_amount'] = $this->get_depreCiation_amount($value['acc_head_list_id'], $value['parent_id'], $value['fiscal_year_id'], $value['head_balance']);
                        $newArray[$key]['head_balance'] = $value['head_balance'] - $newArray[$key]['depreciation_amount'];
                        $newArray[$key]['total_receive'] = $value['total_receive'];
                        $newArray[$key]['total_payment'] = $value['total_payment'];
                        $newArray[$key]['fiscal_year_id'] = $value['fiscal_year_id'];
                        $newArray[$key]['created_at'] = $this->current_datetime();

                        /* Data for Daily Transcation table Start */
                        if ($value['acc_head_type_id'] == 3 && $newArray[$key]['depreciation_rate'] != 0):
                            $dailyTransaction[$key]['entry_type_id'] = 3;
                            $dailyTransaction[$key]['acc_head_type_id'] = $value['acc_head_type_id'];
                            $dailyTransaction[$key]['acc_head_list_id'] = $value['acc_head_list_id'];
                            $dailyTransaction[$key]['parent_id'] = $value['parent_id'];
                            $dailyTransaction[$key]['transaction_category_id'] = 3;
                            $dailyTransaction[$key]['transaction_type_id'] = 3;
                            $dailyTransaction[$key]['fiscal_year_id'] = $value['fiscal_year_id'];
                            $dailyTransaction[$key]['month_id'] = 1;
                            $dailyTransaction[$key]['transaction_amount'] = $newArray[$key]['depreciation_amount'];
                            $dailyTransaction[$key]['transaction_date'] = $this->current_datetime();
                            $dailyTransaction[$key]['created_at'] = $this->current_datetime();

                            $dailyTransaction[$key]['flag'] = 'Depreciation';
                            //$dailyTransaction[$key]['daily_transaction_id'] = $this->get_daily_transaction_id();
                            $dailyTransaction[$key]['head_balance'] = $this->get_head_balance($newArray[$key]['depreciation_amount'], $value['fiscal_year_id'], $value['parent_id'], $value['acc_head_list_id']);
                        endif;
                        /* Data for Daily Transcation end */
                    }
                    /* DepreCiation and Recevice Payment Calculation end */

                    if (count($dailyTransaction) > 0):
                        /* Save data on daily Transaction and head wise account balance start */
                        foreach ($dailyTransaction as $key => $value) {
                            $this->DailyTransaction->create();
                            $this->request->data['DailyTransaction']['entry_type_id'] = $value['entry_type_id'];
                            $this->request->data['DailyTransaction']['acc_head_type_id'] = $value['acc_head_type_id'];
                            $this->request->data['DailyTransaction']['acc_head_list_id'] = $value['acc_head_list_id'];
                            $this->request->data['DailyTransaction']['parent_id'] = $value['parent_id'];
                            $this->request->data['DailyTransaction']['transaction_category_id'] = $value['transaction_category_id'];
                            $this->request->data['DailyTransaction']['transaction_type_id'] = $value['transaction_type_id'];
                            $this->request->data['DailyTransaction']['fiscal_year_id'] = $value['fiscal_year_id'];
                            $this->request->data['DailyTransaction']['month_id'] = $value['month_id'];
                            $this->request->data['DailyTransaction']['transaction_amount'] = $value['transaction_amount'];
                            $this->request->data['DailyTransaction']['created_at'] = $this->current_datetime();

                            //$this->DailyTransaction->save($this->request->data);

                            $this->HeadWiseAccountBalance->create();
                            $this->request->data['HeadWiseAccountBalance']['daily_transaction_id'] = $this->DailyTransaction->getLastInsertID();
                            $this->request->data['HeadWiseAccountBalance']['acc_head_list_id'] = $value['acc_head_list_id'];
                            $this->request->data['HeadWiseAccountBalance']['parent_id'] = $value['parent_id'];
                            $this->request->data['HeadWiseAccountBalance']['transaction_amount'] = $value['transaction_amount'];
                            $this->request->data['HeadWiseAccountBalance']['flag'] = 'Depreciation';
                            $this->request->data['HeadWiseAccountBalance']['head_balance'] = $value['head_balance'];
                            $this->request->data['HeadWiseAccountBalance']['created_at'] = $this->current_datetime();
                           // $this->HeadWiseAccountBalance->save($this->request->data);
                        }
                        /* Save data on daily Transaction and head wise account balance end */

                        /* Update rest of the transaction in head wise account balance start */
                        foreach ($dailyTransaction as $key => $value) {
                            $data = $balanceSheetsObj->get_head_wise_acc_balance_with_daily_transaction(2, $value['parent_id'], $value['acc_head_list_id'], $year_is_greater_than_or_equal = 1);
                            foreach ($data as $k => $v) {
                                $updatedData[$v['a']['id']]['id'] = $v['a']['id'];
                                $updatedData[$v['a']['id']]['head_balance'] = $v['b']['head_balance'] - $value['transaction_amount'];
                                //$updatedData[$v['a']['id']]['head_balance'] = $v['b']['head_balance'];
                                $updatedData[$v['a']['id']]['updated_at'] = $this->current_datetime();
                            }
                        }
                       // $this->HeadWiseAccountBalance->saveAll($updatedData);
                    /* Update rest of the transaction in head wise account balance end */
                    endif;
                    ksort($newArray);
                    $this->YearClosingBalanceDetail->saveAll($newArray);
                    $this->Session->setFlash(__('The Year has been Closed'), 'flash/success');
                    $this->redirect(array('action' => 'index'));
                } else {
                    $this->Session->setFlash(__('Data already exist in the Closing Year. Please, try again.'), 'flash/error');
                    $this->redirect(array('action' => 'index'));
                }
            }
        }
        $this->set(compact('fiscalYears'));
    }

}
