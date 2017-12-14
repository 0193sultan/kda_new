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
class TrialBalancesController extends AppController {

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Paginator', 'Session');

    public function admin_index() {
        $this->set('page_title', 'Trial Balance');
        $this->loadModel('FiscalYear');
        $this->loadModel('Month');
        $fiscalYears = $this->FiscalYear->find('list');
        $months = $this->Month->find('list');
        $this->set(compact('fiscalYears', 'months'));
    }

    public function admin_trial_balance_report() {
        $this->loadModel('AccHeadList');
        $this->loadModel('DailyTransaction');
        $query = array(
//            'NOT' => array(
//                'DailyTransaction.acc_head_type_id' => array(4, 3)
//            )
        );

        $this->request->data('fiscal_year_id');
        if ($this->request->data('fiscal_year_id') != '') {
            $query['DailyTransaction.fiscal_year_id'] = $this->request->data('fiscal_year_id');
        }
        if ($this->request->data('month_id') != '') {
            $query['DailyTransaction.month_id'] = $this->request->data('month_id');
        }
//        if (empty($query)) {
//            return $this->redirect(['action' => 'index']);
//        }
        //$data = $this->DailyTransaction->find('all', array('conditions' => $query), array('group' => 'DailyTransaction.acc_head_list_id'));
        $data = $this->DailyTransaction->find('all', array(
            'joins' => array(
                array(
                    'table' => 'acc_head_lists',
                    'alias' => 'AccHeadList_tb',
                    'type' => 'INNER',
                    'conditions' => array(
                        'AccHeadList_tb.id = DailyTransaction.parent_id'
                    )
                )
            ),
            'conditions' => $query,
            'fields' => array('AccHeadList_tb.head_name,AccHeadList_tb.id,DailyTransaction.acc_head_list_id,DailyTransaction.acc_head_type_id,DailyTransaction.parent_id'),
            'order' => 'DailyTransaction.id DESC',
            'group' => 'DailyTransaction.parent_id'
        ));

        /*  $data = $this->DailyTransaction->find('all', array(
          'conditions' => $query,
          'fields' => array('DailyTransaction.id,DailyTransaction.acc_head_list_id'),
          'order' => 'DailyTransaction.id DESC',
          'group' => 'DailyTransaction.acc_head_list_id'
          )); */

        $this->set(compact('data'));
       // pr($data);
    }

    public function get_debit_amount($parent_id, $acc_head_type_id) {
        $this->loadModel('DailyTransaction');
        $this->loadModel('HeadWiseAccountBalance');
        if ($acc_head_type_id == 2) {
            $transaction_amount = $this->DailyTransaction->find('all', array(
                'conditions' => array('DailyTransaction.parent_id' => $parent_id,
                    'DailyTransaction.acc_head_type_id' => 2
                ),
                'fields' => array('SUM(transaction_amount)'),
                'recursive' => -1
            ));
            if (!empty($transaction_amount[0][0]['SUM(transaction_amount)'])) {
                return $transaction_amount[0][0]['SUM(transaction_amount)'];
            } else {
                return 0;
            }
        } elseif ($acc_head_type_id == 3 || $acc_head_type_id == 4) {
            $transaction_amount = $this->HeadWiseAccountBalance->find('all', array(
                'conditions' => array('HeadWiseAccountBalance.acc_head_list_id' => $parent_id,
                ),
                'fields' => 'HeadWiseAccountBalance.head_balance,HeadWiseAccountBalance.id',
                'order' => 'HeadWiseAccountBalance.id DESC',
                'limit' => 1,
                'recursive' => -1
            ));
            if (count($transaction_amount) > 0) {
                return $transaction_amount[0]['HeadWiseAccountBalance']['head_balance'];
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    }

    public function get_credit_amount($parent_id,$acc_head_type_id) {
        $this->loadModel('DailyTransaction');
        $this->loadModel('HeadWiseAccountBalance');
        if ($acc_head_type_id == 1) {
            $transaction_amount = $this->DailyTransaction->find('all', array(
                'conditions' => array('DailyTransaction.parent_id' => $parent_id,
                    'DailyTransaction.acc_head_type_id' => 1
                ),
                'fields' => array('SUM(transaction_amount)'),
                'recursive' => -1
            ));
            if (!empty($transaction_amount[0][0]['SUM(transaction_amount)'])) {
                return $transaction_amount[0][0]['SUM(transaction_amount)'];
            } else {
                return 0;
            }
        } elseif ($acc_head_type_id == 5 || $acc_head_type_id == 6) {
            $transaction_amount = $this->HeadWiseAccountBalance->find('all', array(
                'conditions' => array('HeadWiseAccountBalance.acc_head_list_id' => $parent_id,
                ),
                'fields' => 'HeadWiseAccountBalance.head_balance,HeadWiseAccountBalance.id',
                'order' => 'HeadWiseAccountBalance.id DESC',
                'limit' => 1,
                'recursive' => -1
            ));
            if (count($transaction_amount) > 0) {
                return $transaction_amount[0]['HeadWiseAccountBalance']['head_balance'];
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    }

    public function get_liabilities_amount($parent_id) {
        $this->loadModel('DailyTransaction');
        $transaction_amount = $this->DailyTransaction->find('all', array(
            'conditions' => array('DailyTransaction.parent_id' => $parent_id,
                'DailyTransaction.acc_head_type_id' => 5
            ),
            'fields' => array('SUM(transaction_amount)'),
            'recursive' => -1
        ));
        if (!empty($transaction_amount[0][0]['SUM(transaction_amount)'])) {
            return $transaction_amount[0][0]['SUM(transaction_amount)'];
        } else {
            return 0;
        }
    }

    public function get_fix_asset_amount($parent_id) {
        $this->loadModel('DailyTransaction');
        $transaction_amount = $this->DailyTransaction->find('all', array(
            'conditions' => array('DailyTransaction.parent_id' => $parent_id,
                'DailyTransaction.acc_head_type_id' => 3
            ),
            'fields' => array('SUM(transaction_amount)'),
            'recursive' => -1
        ));
        if (!empty($transaction_amount[0][0]['SUM(transaction_amount)'])) {
            return $transaction_amount[0][0]['SUM(transaction_amount)'];
        } else {
            return 0;
        }
    }

}
