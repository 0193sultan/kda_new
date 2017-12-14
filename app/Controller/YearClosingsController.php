<?php

App::uses('AppController', 'Controller');
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
class YearClosingsController extends AppController {

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Paginator', 'Session');

    public function admin_index() {
        $this->set('page_title', 'Year Closings');
        $this->loadModel('FiscalYear');
        $this->loadModel('DailyTransaction');
        $fiscalYears = $this->FiscalYear->find('list');
        if ($this->request->is('post')) {
            // SELECT a.id,a.acc_head_type_id,a.acc_head_list_id,a.parent_id,b.head_balance FROM daily_transactions as a LEFT JOIN head_wise_account_balance as b ON a.id = b.daily_transaction_id WHERE a.id IN (SELECT MAX(a.id) AS id FROM daily_transactions as a WHERE a.fiscal_year_id=1 GROUP BY a.acc_head_list_id)
            $data = $this->DailyTransaction->query("SELECT a.id,a.acc_head_type_id,a.acc_head_list_id,a.parent_id,b.head_balance FROM daily_transactions as a LEFT JOIN head_wise_account_balance as b ON a.id = b.daily_transaction_id WHERE a.id IN (SELECT MAX(a.id) AS id FROM daily_transactions as a WHERE a.fiscal_year_id=1 GROUP BY a.acc_head_list_id)");
            $yearHas = $this->YearClosing->hasAny(['fiscal_year_id' => $this->request->data['OpeningBalances']['close_year_id']]);
            //pr($yearHas);
//            pr($data);
//            $temp = 0;
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
                    foreach ($data as $k => $v):
                        $yearClose['YearClosing']['head_balance'][$v['a']['parent_id']] = 0;
                    endforeach;

                    foreach ($data as $key => $value):
                        $yearClose['YearClosing']['acc_head_type_id'][$value['a']['parent_id']] = $value['a']['acc_head_type_id'];
                        $yearClose['YearClosing']['head_balance'][$value['a']['parent_id']] += $value['b']['head_balance'];
                    endforeach;
                    ksort($yearClose['YearClosing']['head_balance']);
                    ksort($yearClose['YearClosing']['acc_head_type_id']);
                    foreach ($yearClose['YearClosing']['head_balance'] as $yearClosingkey => $yearClosingValue):
                        $this->YearClosing->create();
                        $this->request->data['YearClosing']['acc_head_type_id'] = $yearClose['YearClosing']['acc_head_type_id'][$yearClosingkey];
                        $this->request->data['YearClosing']['acc_head_list_id'] = $yearClosingkey;
                        $this->request->data['YearClosing']['fiscal_year_id'] = $this->request->data['OpeningBalances']['close_year_id'];
                        $this->request->data['YearClosing']['head_balance'] = $yearClosingValue;
                        $this->request->data['YearClosing']['opening_balance'] = $yearClosingValue;
                        $this->request->data['YearClosing']['created_at'] = $this->current_datetime();
                        $this->YearClosing->save($this->request->data);
                    endforeach;
                    $this->Session->setFlash(__('The Year has been Closed'), 'flash/success');
                    $this->redirect(array('action' => 'index'));
                } else {
                    $this->Session->setFlash(__('Data already exist in the Closing Year. Please, try again.'), 'flash/error');
                    $this->redirect(array('action' => 'index'));
                }
            } else {
                if (empty($yearHas)) {
                    $this->loadModel('DailyTransaction');
                    $this->loadModel('YearClosing');
                    $this->loadModel('AnnualDepriciation');
                    $dailyTransaction = $this->DailyTransaction->find('all', array(
                        'conditions' => array('DailyTransaction.fiscal_year_id' => $this->request->data['OpeningBalances']['close_year_id'],
                        ),
                        'fields' => 'DailyTransaction.id,'
                        . 'DailyTransaction.entry_type_id,'
                        . 'DailyTransaction.acc_head_type_id,'
                        . 'DailyTransaction.acc_head_list_id,'
                        . 'DailyTransaction.parent_id,'
                        . 'DailyTransaction.transaction_amount,DailyTransaction.fiscal_year_id',
                        // 'order' => 'HeadWiseAccountBalance.id DESC',
                        //'limit' => 1,
                        'recursive' => -1
                    ));
                    $yearClosing = $this->YearClosing->find('all', array(
                        'conditions' => array('YearClosing.fiscal_year_id' => $this->request->data['OpeningBalances']['close_year_id'] - 1,
                        ),
                        'fields' => 'YearClosing.acc_head_type_id,'
                        . 'YearClosing.acc_head_type_id,'
                        . 'YearClosing.acc_head_list_id,'
                        . 'YearClosing.fiscal_year_id,'
                        . 'YearClosing.head_balance,'
                        . 'YearClosing.opening_balance,'
                        . 'YearClosing.receive_amount,'
                        . 'YearClosing.payment_amount,'
                        . 'YearClosing.depreciation_amount,YearClosing.created_at',
                        'order' => 'YearClosing.id ASC',
                        //'limit' => 1,
                        'recursive' => -1
                    ));

                    $annualDepriciation = $this->AnnualDepriciation->find('all', array(
                        'conditions' => array(
                            'AnnualDepriciation.fiscal_year_id' => $this->request->data['OpeningBalances']['close_year_id'],
                        ),
                        'fields' => 'AnnualDepriciation.acc_head_list_id,'
                        . 'AnnualDepriciation.parent_id,'
                        . 'AnnualDepriciation.fiscal_year_id,'
                        . 'AnnualDepriciation.depriciation_value,',
                        'order' => 'AnnualDepriciation.id ASC',
                        //'limit' => 1,
                        'recursive' => -1
                    ));

                    foreach ($annualDepriciation as $key => $value) {
                        //$annualDepriciationForClosingYear[$value]['parent_id']=
                    }

                    foreach ($dailyTransaction as $k => $v):
                        $dailyDataForTransactionNewYear['NewYear'][$v['DailyTransaction']['parent_id']][$v['DailyTransaction']['acc_head_type_id']][$v['DailyTransaction']['entry_type_id']] = 0;
                    endforeach;

                    foreach ($dailyTransaction as $key => $value):
                        $dailyDataForTransactionNewYear['NewYear'][$value['DailyTransaction']['parent_id']][$value['DailyTransaction']['acc_head_type_id']][$value['DailyTransaction']['entry_type_id']] += $value['DailyTransaction']['transaction_amount'];
                        //$newYear['NewYear']['head_balance'][$value['a']['parent_id']] += $value['b']['head_balance'];
                    endforeach;
                    ksort($dailyDataForTransactionNewYear['NewYear']);
                    foreach ($yearClosing as $key => $value) {
                        $yearClosingWithId[$value['YearClosing']['acc_head_list_id']] = $value['YearClosing'];
                        $yearClosingWithId[$value['YearClosing']['acc_head_list_id']]['fiscal_year_id'] = $this->request->data['OpeningBalances']['close_year_id'];
                        $yearClosingWithId[$value['YearClosing']['acc_head_list_id']]['created_at'] = $this->current_datetime();
                        $yearClosingRearrangeArray[$value['YearClosing']['acc_head_list_id']][$value['YearClosing']['acc_head_type_id']] = $value['YearClosing']['head_balance'];
                    }
                    echo '-----------------Annual Depriciation-----------------';
                    pr($annualDepriciation);
                    echo '-----------------Daily Transaction-----------------';
                    pr($dailyTransaction);
                    echo '-----------------dailyDataForTransactionNewYear-----------------';
                    pr($dailyDataForTransactionNewYear);
                    pr($yearClosingWithId);
                    die();
                    foreach ($dailyDataForTransactionNewYear['NewYear'] as $key => $value) {
                        pr($yearClosingWithId);
                        die();
                        foreach ($value as $k => $v) {
                            // pr($key . '--' . $k);
                            if (array_key_exists($key, $yearClosingRearrangeArray)) {
                                $receive = isset($dailyDataForTransactionNewYear['NewYear'][$key][$k][1]) ? $dailyDataForTransactionNewYear['NewYear'][$key][$k][1] : 0;
                                $payment = isset($dailyDataForTransactionNewYear['NewYear'][$key][$k][2]) ? $dailyDataForTransactionNewYear['NewYear'][$key][$k][2] : 0;
                                $deduct = $receive - $payment;
                                $yearClosingWithId[$key]['opening_balance'] = $yearClosingWithId[$key]['head_balance'];
                                $yearClosingWithId[$key]['head_balance'] = $yearClosingRearrangeArray[$key][$k] + $deduct;
                                $yearClosingWithId[$key]['receive_amount'] = $receive;
                                $yearClosingWithId[$key]['payment_amount'] = $payment;
                            } else {
                                $receive = isset($dailyDataForTransactionNewYear['NewYear'][$key][$k][1]) ? $dailyDataForTransactionNewYear['NewYear'][$key][$k][1] : 0;
                                $payment = isset($dailyDataForTransactionNewYear['NewYear'][$key][$k][2]) ? $dailyDataForTransactionNewYear['NewYear'][$key][$k][2] : 0;
                                $deduct = $receive - $payment;
                                $yearClosingWithId[$key]['acc_head_type_id'] = $k;
                                $yearClosingWithId[$key]['acc_head_list_id'] = $key;
                                $yearClosingWithId[$key]['fiscal_year_id'] = $this->request->data['OpeningBalances']['close_year_id'];
                                $yearClosingWithId[$key]['opening_balance'] = 0;
                                $yearClosingWithId[$key]['head_balance'] = $deduct;
                                $yearClosingWithId[$key]['receive_amount'] = $receive;
                                $yearClosingWithId[$key]['payment_amount'] = $payment;
                                $yearClosingWithId[$key]['depreciation_amount'] = 0;
                                $yearClosingWithId[$key]['created_at'] = $this->current_datetime();
                            }
                        }
                    }
                    ksort($yearClosingWithId);
                    //pr($yearClosingWithId);die();
                    $this->YearClosing->saveAll($yearClosingWithId);
                    $this->Session->setFlash(__('The Year has been Closed'), 'flash/success');
                    $this->redirect(array('action' => 'index'));
                } else {
                    $this->Session->setFlash(__('Data already exist in the Closing Year. Please, try again.'), 'flash/error');
                    $this->redirect(array('action' => 'index'));
                }
                //
                // pr($yearClosingWithId);
                //pr($final_array);
                // die();
            }
        }
        $this->set(compact('fiscalYears'));
    }

}
