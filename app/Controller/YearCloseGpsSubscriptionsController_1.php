<?php

App::uses('AppController', 'Controller');

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor. YearCloseGpsSubscriptionsController
 */

class YearCloseGpsSubscriptionsController extends AppController {

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Paginator', 'Session');

    public function get_opening_balance($total_subscription_balance, $fiscal_year_id, $employee_id, $tag) {
        $this->loadModel('LoanType');
        $loanType = $this->LoanType->find('list', array('fields' => array('LoanType.id', 'LoanType.interest_rate'), 'conditions' => array('LoanType.id' => 8)));
        $first_slot = ($total_subscription_balance * $loanType[8]) / 100;
        $getTotalRecoveryFromGpf = $this->GpfSubscription->find('all', array(
            'conditions' => array(
                'GpfSubscription.fiscal_year_id' => $fiscal_year_id,
                'GpfSubscription.employee_id' => $employee_id
            ),
            'fields' => 'GpfSubscription.employee_id,'
            . 'MAX(GpfSubscription.subscription_recovery),'
            . 'MAX(GpfSubscription.loan_recovery),'
            . 'MAX(GpfSubscription.loan_interest_recovery)',
            //'order' => 'HeadWiseAccountBalance.id DESC',
            //'limit' => 1,
            'recursive' => -1
        ));
        $sum = $getTotalRecoveryFromGpf[0][0]['MAX(`GpfSubscription`.`subscription_recovery`)'] + $getTotalRecoveryFromGpf[0][0]['MAX(`GpfSubscription`.`loan_recovery`)'] + $getTotalRecoveryFromGpf[0][0]['MAX(`GpfSubscription`.`loan_interest_recovery`)'];
        $second_slot = ($sum * 6.5 * $loanType[8]) / 1200;

        $openingGpfLoanHas = $this->GpfSubscription->find('all', array(
            'conditions' => array(
                'GpfSubscription.fiscal_year_id' => $fiscal_year_id,
                'GpfSubscription.sub_status' => 7,
                'GpfSubscription.employee_id' => $employee_id,
            ),
            'fields' => 'GpfSubscription.loan_amount,'
            . 'GpfSubscription.month_id,',
            // 'order' => 'HeadWiseAccountBalance.id DESC',
            //'limit' => 1,
            'recursive' => -1
        ));
        $last_updated_total_subscription_balance = $this->GpfSubscription->find('all', array(
            'conditions' => array(
                'GpfSubscription.fiscal_year_id' => $fiscal_year_id,
                'GpfSubscription.employee_id' => $employee_id,
            ),
            'fields' => 'GpfSubscription.id,'
            . 'GpfSubscription.total_subscription_balance,',
            'order' => 'GpfSubscription.id DESC',
            'limit' => 1,
            'recursive' => -1
        ));
        if (count($openingGpfLoanHas) > 0) {
            $rules_b = 0;
            foreach ($openingGpfLoanHas as $key => $value) {
                $rules_b += $this->get_rules_b_data($value['GpfSubscription']['loan_amount'], $value['GpfSubscription']['month_id'], $loanType[8]);
            }
            $result = $first_slot + $second_slot + $rules_b + $last_updated_total_subscription_balance[0]['GpfSubscription']['total_subscription_balance'];
        } else {
            $result = $first_slot + $second_slot + $last_updated_total_subscription_balance[0]['GpfSubscription']['total_subscription_balance'];
        }
        if ($tag == 'year_closing_interest') {
            return $result-$last_updated_total_subscription_balance[0]['GpfSubscription']['total_subscription_balance'];
        } else {
            return $result;
        }
    }

    public function get_rules_b_data($loan_amount, $month_id, $interest_rate) {
        $months = (12 - $month_id) + 1;
        $value = ($loan_amount * $interest_rate) / 100;
        $b = ($value / 12) * $months;
        return $b;
    }

    public function admin_index() {
        $this->set('page_title', 'Year Close for Gps Subscription');
        $this->loadModel('FiscalYear');
        $this->loadModel('GpfSubscription');
        $fiscalYears = $this->FiscalYear->find('list');
        $this->set(compact('fiscalYears'));
        if ($this->request->is('post')) {
            $getOpenningBalanceFromGpf = $this->GpfSubscription->find('all', array(
                'conditions' => array(
                    'GpfSubscription.fiscal_year_id' => $this->request->data['YearCloseGpsSubscriptions']['fiscal_year_id'],
                    'GpfSubscription.sub_status' => 0
                ),
                //'fields' => 'GpfSubscription.id,'
                //. 'GpfSubscription.employee_id,',
                // 'order' => 'HeadWiseAccountBalance.id DESC',
                //'limit' => 1,
                'recursive' => -1
            ));

            if (count($getOpenningBalanceFromGpf) > 0) {
                foreach ($getOpenningBalanceFromGpf as $key => $value) {
                    $gpf = $value['GpfSubscription'];
                    $newArray[$gpf['employee_id']]['employee_id'] = $gpf['employee_id'];
                    $newArray[$gpf['employee_id']]['fiscal_year_id'] = $this->request->data['YearCloseGpsSubscriptions']['fiscal_year_id'] + 1;
                    $newArray[$gpf['employee_id']]['month_id'] = 1;
                    $newArray[$gpf['employee_id']]['total_subscription_balance'] = $this->get_opening_balance($gpf['total_subscription_balance'], $this->request->data['YearCloseGpsSubscriptions']['fiscal_year_id'], $gpf['employee_id'], $tag = 'total_subscription_balance');
                    $newArray[$gpf['employee_id']]['year_closing_interest'] = $this->get_opening_balance($gpf['total_subscription_balance'], $this->request->data['YearCloseGpsSubscriptions']['fiscal_year_id'], $gpf['employee_id'], $tag = 'year_closing_interest');
                    $newArray[$gpf['employee_id']]['sub_status'] = 0;
                    $newArray[$gpf['employee_id']]['created_at'] = $this->current_datetime();
                }
               // pr($newArray);die();
                $this->GpfSubscription->saveAll($newArray);
                $this->Session->setFlash(__('Fiscal Year has been closed.'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('Previous year must be closed first.'), 'flash/error');
                $this->redirect(array('action' => 'index'));
            }
        }
    }

}
