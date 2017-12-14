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
            return $result - $last_updated_total_subscription_balance[0]['GpfSubscription']['total_subscription_balance'];
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

    public function end_gpf_subscription_with_cumulative($employee_id, $fiscal_year_id, $start_month, $end_month) {
        $getOpenningBalanceFromGpf = $this->GpfSubscription->find('all', array(
            'conditions' => array(
                'GpfSubscription.employee_id' => $employee_id,
                'GpfSubscription.fiscal_year_id' => $fiscal_year_id,
                'GpfSubscription.month_id >=' => $start_month,
                'GpfSubscription.month_id <=' => $end_month,
                'GpfSubscription.sub_status >' => 0,
            ),
            'fields' => 'SUM(GpfSubscription.subscription_recovery),',
            //. 'GpfSubscription.employee_id,',
            //'order' => 'GpfSubscription.id DESC',
            //'limit' => 1,
            'recursive' => -1
        ));
        if (count($getOpenningBalanceFromGpf) > 0) {
            return $getOpenningBalanceFromGpf[0][0]['SUM(`GpfSubscription`.`subscription_recovery`)'];
        } else {
            return 0;
        }
    }

    public function get_month_weight($start_month, $end_month) {
        $this->loadModel('Month');
        $getMonthWeight = $this->Month->find('all', array(
            'conditions' => array(
                'Month.id >=' => $start_month,
                'Month.id <=' => $end_month
            ),
            'fields' => 'SUM(Month.month_weight),',
            //. 'GpfSubscription.employee_id,',
            //'order' => 'GpfSubscription.id DESC',
            //'limit' => 1,
            'recursive' => -1
        ));
        if (count($getMonthWeight) > 0) {
            return $getMonthWeight[0][0]['SUM(`Month`.`month_weight`)'];
        } else {
            return 0;
        }
    }

    public function get_applied_interest($month_weight, $start_gps_subscription, $interest_rate) {
        return ($month_weight * $start_gps_subscription * $interest_rate) / 1200;
    }

    public function get_applied_interest_for_new_loan($month_weight, $start_gps_subscription, $interest_rate) {
        $first_slot = ($start_gps_subscription * $interest_rate) / 100;
        $second_slot = 12 * $month_weight;
        return $first_slot / $second_slot;
    }

    public function first_tracking_calculation_gpf($fiscal_year_id, $employee_id, $interest_rate) {
        /* Sum for total new loan */
        $data = $this->GpfSubscription->query("SELECT SUM(a.loan_amount),b.loan_id FROM gpf_subscriptions a LEFT JOIN employee_loans b ON a.employee_loan_id=b.id WHERE b.recovery_year_id=$fiscal_year_id AND a.employee_id=$employee_id");
        if (!empty($data[0][0]['SUM(a.loan_amount)'])) {
            $getOpenningBalanceFromGpf = $this->GpfSubscription->find('all', array(
                'conditions' => array(
                    'GpfSubscription.fiscal_year_id' => $fiscal_year_id - 1,
                    'GpfSubscription.employee_id' => $employee_id,
                    'GpfSubscription.sub_status' => 0
                ),
                'fields' => 'GpfSubscription.total_subscription_balance,',
                'order' => 'GpfSubscription.id ASC',
                'limit' => 1,
                'recursive' => -1
            ));
            if (count($getOpenningBalanceFromGpf) > 0) {
                $deductLoan = $getOpenningBalanceFromGpf[0]['GpfSubscription']['total_subscription_balance'] - $data[0][0]['SUM(a.loan_amount)'];
                return ($deductLoan * $interest_rate) / 100;
            } else {
                return ($data[0][0]['SUM(a.loan_amount)'] * $interest_rate) / 100;
            }
        } else {
            return ($data[0][0]['SUM(a.loan_amount)'] * $interest_rate) / 100;
        }
    }

    public function get_gpf_interest($fiscal_year_id, $employee_id) {
        $sum = 0;
        $this->loadModel('LoanType');
        $loanType = $this->LoanType->find('list', array('fields' => array('LoanType.id', 'LoanType.interest_rate'), 'conditions' => array('LoanType.id' => 8)));
        $first_tracking_calculation_gpf = $this->first_tracking_calculation_gpf($fiscal_year_id, $employee_id, $loanType[8]);
        $sum += $first_tracking_calculation_gpf;
        $getTotalRecoveryFromGpf = $this->GpfSubscription->find('all', array(
            'conditions' => array(
                'NOT' => array(
                    'GpfSubscription.sub_status' => array(0),
                    'GpfSubscription.subscription_recovery' => array(0)
                ),
                'GpfSubscription.fiscal_year_id' => $fiscal_year_id,
                'GpfSubscription.employee_id' => $employee_id
            ),
            'fields' => 'GpfSubscription.employee_id,'
            . 'GpfSubscription.subscription_recovery,'
            . 'GpfSubscription.loan_recovery,'
            . 'GpfSubscription.loan_interest_recovery,GpfSubscription.month_id',
            //'order' => 'HeadWiseAccountBalance.id DESC',
            //'limit' => 1,
            'recursive' => -1
        ));
        /* get gpf slot start   */
        $totalGpfInterest = $this->get_sloting_data($getTotalRecoveryFromGpf, $loanType[8]);
        $sum += $totalGpfInterest;
        /* Old loan calculation Start */
        $getDistinctId = $this->GpfSubscription->find('all', array(
            'conditions' => array(
                'NOT' => array(
                    'GpfSubscription.employee_loan_id' => array(0)
                ),
                'GpfSubscription.fiscal_year_id' => $fiscal_year_id,
                'GpfSubscription.employee_id' => $employee_id
            ),
            'fields' => 'DISTINCT GpfSubscription.employee_loan_id',
            'recursive' => -1
        ));
        if (count($getDistinctId) > 0) {
            $this->loadModel('EmployeeLoan');
            $oldLoanIds = array();
            $newLoanIds = array();
            foreach ($getDistinctId as $key => $value) {
                $oldLoanHas = $this->EmployeeLoan->find('all', array(
                    'conditions' => array(
                        'EmployeeLoan.recovery_year_id' => $fiscal_year_id - 1,
                        'EmployeeLoan.id' => $value['GpfSubscription']['employee_loan_id'],
                        'EmployeeLoan.employee_id' => $employee_id
                    ),
                    'fields' => 'EmployeeLoan.id,EmployeeLoan.recovery_year_id',
                    'recursive' => -1
                ));
                if (count($oldLoanHas) > 0) {
                    $oldLoanIds[] = $value['GpfSubscription']['employee_loan_id'];
                } else {
                    $newLoanIds[] = $value['GpfSubscription']['employee_loan_id'];
                }
            }
            if (count($oldLoanIds) > 0):
                $arrayChunk = $this->get_array_chunk($oldLoanIds, $tableColumn = 'GpfSubscription.employee_loan_id');
                $getOldLoanData = $this->GpfSubscription->find('all', array(
                    'conditions' => array(
                        'OR' => $arrayChunk,
                        'GpfSubscription.fiscal_year_id' => $fiscal_year_id,
                        'GpfSubscription.employee_id' => $employee_id
                    ),
                    'fields' => 'GpfSubscription.id,GpfSubscription.employee_loan_id,'
                    . 'GpfSubscription.fiscal_year_id,GpfSubscription.month_id,'
                    . 'GpfSubscription.loan_recovery,GpfSubscription.loan_interest_recovery',
                    'order' => 'GpfSubscription.loan_recovery,GpfSubscription.month_id ASC',
                    'recursive' => -1
                ));
                foreach ($getOldLoanData as $key => $value) {
                    $getOldLoanData[$key]['GpfSubscription']['loan_recovery'] = ($value['GpfSubscription']['loan_recovery'] == 0) ? $value['GpfSubscription']['loan_interest_recovery'] : $value['GpfSubscription']['loan_recovery'];
                }
                $totalOldLoanInterest = $this->get_sloting_data($getOldLoanData, $loanType[8]);
                $sum += $totalOldLoanInterest;

            endif;
            if (count($newLoanIds) > 0):
                $arrayChunk = $this->get_array_chunk($newLoanIds, $tableColumn = 'GpfSubscription.employee_loan_id');
                $getNewLoanData = $this->GpfSubscription->find('all', array(
                    'conditions' => array(
                        'OR' => $arrayChunk,
                        'GpfSubscription.fiscal_year_id' => $fiscal_year_id,
                        'GpfSubscription.employee_id' => $employee_id,
                        'GpfSubscription.loan_amount' => 0
                    ),
                    'fields' => 'GpfSubscription.id,GpfSubscription.employee_loan_id,'
                    . 'GpfSubscription.fiscal_year_id,GpfSubscription.month_id,'
                    . 'GpfSubscription.loan_recovery,GpfSubscription.loan_interest_recovery',
                    'order' => 'GpfSubscription.loan_recovery,GpfSubscription.month_id ASC',
                    'recursive' => -1
                ));
                foreach ($getNewLoanData as $key => $value) {
                    $getNewLoanData[$key]['GpfSubscription']['loan_recovery'] = ($value['GpfSubscription']['loan_recovery'] == 0) ? $value['GpfSubscription']['loan_interest_recovery'] : $value['GpfSubscription']['loan_recovery'];
                }
                $totalNewLoanInterest = $this->get_sloting_data($getNewLoanData, $loanType[8]);
                $sum += $totalNewLoanInterest;
                /* Calculation for new Loan Amount */
                $getNewLoanAmount = $this->GpfSubscription->find('all', array(
                    'conditions' => array(
                        'OR' => $arrayChunk,
                        'GpfSubscription.fiscal_year_id' => $fiscal_year_id,
                        'GpfSubscription.employee_id' => $employee_id,
                        'GpfSubscription.loan_amount >' => 0,
                    ),
                    'fields' => 'GpfSubscription.id,GpfSubscription.employee_loan_id,'
                    . 'GpfSubscription.fiscal_year_id,GpfSubscription.month_id,'
                    . 'GpfSubscription.loan_amount',
                    'order' => 'GpfSubscription.month_id ASC',
                    'recursive' => -1
                ));
                $totalInterestForNewLoanAmount = $this->get_sloting_data($getNewLoanAmount, $loanType[8]);
                $sum += $totalInterestForNewLoanAmount;
            endif;
        }
        return $sum;
    }

    public function admin_index() {
        $this->set('page_title', 'Year Close for Gps Subscription');
        $this->loadModel('FiscalYear');
        $this->loadModel('GpfSubscription');
        $fiscalYears = $this->FiscalYear->find('list');
        $this->set(compact('fiscalYears'));
        if ($this->request->is('post')) {
           /* $sum = 0;
            $this->loadModel('LoanType');
            $loanType = $this->LoanType->find('list', array('fields' => array('LoanType.id', 'LoanType.interest_rate'), 'conditions' => array('LoanType.id' => 8)));
            $first_tracking_calculation_gpf = $this->first_tracking_calculation_gpf($fiscal_year_id = 2, $employee_id = 19, $loanType[8]);
            $sum += $first_tracking_calculation_gpf;
            $getTotalRecoveryFromGpf = $this->GpfSubscription->find('all', array(
                'conditions' => array(
                    'NOT' => array(
                        'GpfSubscription.sub_status' => array(0),
                        'GpfSubscription.subscription_recovery' => array(0)
                    ),
                    'GpfSubscription.fiscal_year_id' => $fiscal_year_id,
                    'GpfSubscription.employee_id' => $employee_id
                ),
                'fields' => 'GpfSubscription.employee_id,'
                . 'GpfSubscription.subscription_recovery,'
                . 'GpfSubscription.loan_recovery,'
                . 'GpfSubscription.loan_interest_recovery,GpfSubscription.month_id',
                //'order' => 'HeadWiseAccountBalance.id DESC',
                //'limit' => 1,
                'recursive' => -1
            ));

            $totalGpfInterest = $this->get_sloting_data($getTotalRecoveryFromGpf, $loanType[8]);
            $sum += $totalGpfInterest;


            $getDistinctId = $this->GpfSubscription->find('all', array(
                'conditions' => array(
                    'NOT' => array(
                        'GpfSubscription.employee_loan_id' => array(0)
                    ),
                    'GpfSubscription.fiscal_year_id' => $fiscal_year_id,
                    'GpfSubscription.employee_id' => $employee_id
                ),
                'fields' => 'DISTINCT GpfSubscription.employee_loan_id',
                'recursive' => -1
            ));
            if (count($getDistinctId) > 0) {
                $this->loadModel('EmployeeLoan');
                $oldLoanIds = array();
                $newLoanIds = array();
                foreach ($getDistinctId as $key => $value) {
                    $oldLoanHas = $this->EmployeeLoan->find('all', array(
                        'conditions' => array(
                            'EmployeeLoan.recovery_year_id' => $fiscal_year_id - 1,
                            'EmployeeLoan.id' => $value['GpfSubscription']['employee_loan_id'],
                            'EmployeeLoan.employee_id' => $employee_id
                        ),
                        'fields' => 'EmployeeLoan.id,EmployeeLoan.recovery_year_id',
                        'recursive' => -1
                    ));
                    if (count($oldLoanHas) > 0) {
                        $oldLoanIds[] = $value['GpfSubscription']['employee_loan_id'];
                    } else {
                        $newLoanIds[] = $value['GpfSubscription']['employee_loan_id'];
                    }
                }
                if (count($oldLoanIds) > 0):
                    $arrayChunk = $this->get_array_chunk($oldLoanIds, $tableColumn = 'GpfSubscription.employee_loan_id');
                    $getOldLoanData = $this->GpfSubscription->find('all', array(
                        'conditions' => array(
                            'OR' => $arrayChunk,
                            'GpfSubscription.fiscal_year_id' => $fiscal_year_id,
                            'GpfSubscription.employee_id' => $employee_id
                        ),
                        'fields' => 'GpfSubscription.id,GpfSubscription.employee_loan_id,'
                        . 'GpfSubscription.fiscal_year_id,GpfSubscription.month_id,'
                        . 'GpfSubscription.loan_recovery,GpfSubscription.loan_interest_recovery',
                        'order' => 'GpfSubscription.loan_recovery,GpfSubscription.month_id ASC',
                        'recursive' => -1
                    ));
                    foreach ($getOldLoanData as $key => $value) {
                        $getOldLoanData[$key]['GpfSubscription']['loan_recovery'] = ($value['GpfSubscription']['loan_recovery'] == 0) ? $value['GpfSubscription']['loan_interest_recovery'] : $value['GpfSubscription']['loan_recovery'];
                    }

                    $totalOldLoanInterest = $this->get_sloting_data($getOldLoanData, $loanType[8]);
                $sum += $totalOldLoanInterest;
                endif;
                if (count($newLoanIds) > 0):
                    $arrayChunk = $this->get_array_chunk($newLoanIds, $tableColumn = 'GpfSubscription.employee_loan_id');
                    $getNewLoanData = $this->GpfSubscription->find('all', array(
                        'conditions' => array(
                            'OR' => $arrayChunk,
                            'GpfSubscription.fiscal_year_id' => $fiscal_year_id,
                            'GpfSubscription.employee_id' => $employee_id,
                            'GpfSubscription.loan_amount' => 0
                        ),
                        'fields' => 'GpfSubscription.id,GpfSubscription.employee_loan_id,'
                        . 'GpfSubscription.fiscal_year_id,GpfSubscription.month_id,'
                        . 'GpfSubscription.loan_recovery,GpfSubscription.loan_interest_recovery',
                        'order' => 'GpfSubscription.loan_recovery,GpfSubscription.month_id ASC',
                        'recursive' => -1
                    ));
                    foreach ($getNewLoanData as $key => $value) {
                        $getNewLoanData[$key]['GpfSubscription']['loan_recovery'] = ($value['GpfSubscription']['loan_recovery'] == 0) ? $value['GpfSubscription']['loan_interest_recovery'] : $value['GpfSubscription']['loan_recovery'];
                    }
                    $totalNewLoanInterest = $this->get_sloting_data($getNewLoanData, $loanType[8]);

                    $sum += $totalNewLoanInterest;
                    $getNewLoanAmount = $this->GpfSubscription->find('all', array(
                        'conditions' => array(
                            'OR' => $arrayChunk,
                            'GpfSubscription.fiscal_year_id' => $fiscal_year_id,
                            'GpfSubscription.employee_id' => $employee_id,
                            'GpfSubscription.loan_amount >' => 0,
                        ),
                        'fields' => 'GpfSubscription.id,GpfSubscription.employee_loan_id,'
                        . 'GpfSubscription.fiscal_year_id,GpfSubscription.month_id,'
                        . 'GpfSubscription.loan_amount',
                        'order' => 'GpfSubscription.month_id ASC',
                        'recursive' => -1
                    ));
                    $totalInterestForNewLoanAmount = $this->get_sloting_data($getNewLoanAmount, $loanType[8]);
                    $sum += $totalInterestForNewLoanAmount;
                endif;
            }*/
            $getOpenningBalanceFromGpf = $this->GpfSubscription->find('all', array(
                'conditions' => array(
                    'GpfSubscription.fiscal_year_id' => $this->request->data['YearCloseGpsSubscriptions']['fiscal_year_id']-1,
                    //'GpfSubscription.employee_id' => 19,
                    'GpfSubscription.sub_status' => 0
                ),
                'recursive' => -1
            ));
//            pr($getOpenningBalanceFromGpf);die();
            if (count($getOpenningBalanceFromGpf) > 0) {
                foreach ($getOpenningBalanceFromGpf as $key => $value) {
                    $gpf = $value['GpfSubscription'];
                    $newArray[$gpf['employee_id']]['employee_id'] = $gpf['employee_id'];
                    $newArray[$gpf['employee_id']]['fiscal_year_id'] = $this->request->data['YearCloseGpsSubscriptions']['fiscal_year_id'];
                    $newArray[$gpf['employee_id']]['month_id'] = 1;
                    $newArray[$gpf['employee_id']]['year_closing_interest'] = $this->get_gpf_interest($this->request->data['YearCloseGpsSubscriptions']['fiscal_year_id'], $gpf['employee_id']);
                    $newArray[$gpf['employee_id']]['total_subscription_balance'] = $newArray[$gpf['employee_id']]['year_closing_interest'] + $gpf['total_subscription_balance'];
                    $newArray[$gpf['employee_id']]['sub_status'] = 0;
                    $newArray[$gpf['employee_id']]['created_at'] = $this->current_datetime();
                }
                pr($newArray);
                die();
                //$this->GpfSubscription->saveAll($newArray);
                $this->Session->setFlash(__('Fiscal Year has been closed.'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('Previous year must be closed first.'), 'flash/error');
                $this->redirect(array('action' => 'index'));
            }
        }
    }

    public function get_array_chunk($array, $tableColumn) {
        if (count($array) > 0) {
            $arraySplit = array_chunk($array, 1);
            foreach ($arraySplit as $k => $value) {
                $newArray[$k][$tableColumn] = $value[0];
            }
            return $newArray;
        } else {
            return $newArray[0][$tableColumn] = 0;
        }
    }

    /* get start Month,End Month,Month weight,applied_interest,GPF Subscription Recovery or Loan Amount Recovery or Interest Amount Recovery  */

    public function get_sloting_data($storedData, $interest_rate) {
        //return $storedData;
        if (array_key_exists('subscription_recovery', $storedData[0]['GpfSubscription'])) {
            $opening_gpf = $storedData[0]['GpfSubscription']['subscription_recovery'];
            $columnName = 'subscription_recovery';
        } elseif (array_key_exists('loan_recovery', $storedData[0]['GpfSubscription'])) {
            $opening_gpf = $storedData[0]['GpfSubscription']['loan_recovery'];
            $columnName = 'loan_recovery';
        } elseif (array_key_exists('loan_amount', $storedData[0]['GpfSubscription'])) {
            $opening_gpf = $storedData[0]['GpfSubscription']['loan_amount'];
            $columnName = 'loan_amount';
        }
        $i = 0;
        $startMonth[$i]['start_month'] = $storedData[0]['GpfSubscription']['month_id'];
        $startMonth[$i]['start_gps_subscription'] = $storedData[0]['GpfSubscription'][$columnName];
        foreach ($storedData as $key => $value) {
            if ($opening_gpf != $value['GpfSubscription'][$columnName]) {
                $i++;
                $startMonth[$i]['start_month'] = $value['GpfSubscription']['month_id'];
                $startMonth[$i]['start_gps_subscription'] = $value['GpfSubscription'][$columnName];
                $opening_gpf = $value['GpfSubscription'][$columnName];
            } else {
                $startMonth[$i]['end_month'] = $value['GpfSubscription']['month_id'];
            }
            if (!array_key_exists('end_month', $startMonth[$i])):
                $startMonth[$i]['end_month'] = $startMonth[$i]['start_month'];
            endif;
        }
        // return $columnName;
        $j = 0;
        foreach ($startMonth as $key => $value) {
            $startMonthToEndMonth[$j]['start_month'] = $value['start_month'];
            $startMonthToEndMonth[$j]['end_month'] = $value['end_month'];
            $startMonthToEndMonth[$j]['start_gps_subscription'] = $value['start_gps_subscription'];
            if ($columnName == 'loan_amount') {
                $startMonthToEndMonth[$j]['month_weight'] = $value['start_month'];
                $startMonthToEndMonth[$j]['applied_interest'] = $this->get_applied_interest_for_new_loan($startMonthToEndMonth[$j]['month_weight'], $startMonthToEndMonth[$j]['start_gps_subscription'], $interest_rate);
            } else {
                $startMonthToEndMonth[$j]['month_weight'] = $this->get_month_weight($value['start_month'], $value['end_month']);
                $startMonthToEndMonth[$j]['applied_interest'] = $this->get_applied_interest($startMonthToEndMonth[$j]['month_weight'], $startMonthToEndMonth[$j]['start_gps_subscription'], $interest_rate);
            }
            $j++;
        }
       // return $startMonthToEndMonth;
        $initiloze = 0;
        foreach ($startMonthToEndMonth as $key => $value) {
            $initiloze += $value['applied_interest'];
        }
        return $initiloze;
    }

}
