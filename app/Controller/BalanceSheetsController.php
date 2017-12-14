<?php

App::uses('AppController', 'Controller');
App::import('Controller', 'YearClosingBalanceDetails');
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
class BalanceSheetsController extends AppController {

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Paginator', 'Session');
    public function get_test($param) {
        return $param;
    }
    public function admin_index() {
        $this->set('page_title', 'Balance Sheets');
        $this->loadModel('AccHeadType');
        $this->loadModel('DailyTransaction');
        $this->loadModel('FiscalYear');
        $fiscalYears = $this->FiscalYear->find('list');
        $this->set(compact('fiscalYears'));
//$accHeadLists = $this->AccHeadType->find('all');

        $dailyTransactions = $this->DailyTransaction->find('all', array('conditions' => array(
                'NOT' => array(
                    'DailyTransaction.acc_head_type_id' => array(1, 2)
                ),
            ),
            // 'fields' => 'DailyTransaction.head_name',
            'order' => 'DailyTransaction.id ASC',
            'group' => 'DailyTransaction.parent_id',
            //'limit' => 1,
            'recursive' => 1
        ));
//pr($dailyTransactions);
        $this->set(compact('accHeadLists', 'months'));
    }

    public function get_fiscal_year($fiscal_year_id) {
        $this->loadModel('FiscalYear');
        $transaction_amount = $this->FiscalYear->find('all', array(
            'conditions' => array('FiscalYear.id' => $fiscal_year_id,
            ),
            'fields' => 'FiscalYear.name',
            // 'order' => 'HeadWiseAccountBalance.id DESC',
            'limit' => 1,
            'recursive' => -1
        ));
        if (count($transaction_amount) > 0) {
            return $transaction_amount[0]['FiscalYear']['name'];
        } else {
            return '';
        }
    }

    public function get_head_type_respective_data($acc_head_type_id, $fiscal_year_id) {
        $this->loadModel('YearClosingBalanceDetail');
        $accHeadList = $this->YearClosingBalanceDetail->find('all', array(
            'conditions' => array(
                'YearClosingBalanceDetail.fiscal_year_id' => $fiscal_year_id,
                'YearClosingBalanceDetail.acc_head_type_id' => $acc_head_type_id
            ),
            'fields' => 'SUM(YearClosingBalanceDetail.head_balance)',
            // 'order' => 'HeadWiseAccountBalance.id DESC',
            'limit' => 1,
            'recursive' => -1
        ));
        if (!empty($accHeadList[0][0]['SUM(`YearClosingBalanceDetail`.`head_balance`)'])) {
            return $accHeadList[0][0]['SUM(`YearClosingBalanceDetail`.`head_balance`)'];
        } else {
            return 0;
        }
    }

    public function get_head_respective_data($parent_id, $fiscal_year_id) {
        $this->loadModel('YearClosingBalanceDetail');
        $currentYearHas = $this->YearClosingBalanceDetail->hasAny(['fiscal_year_id' => $fiscal_year_id]);
        $previousYearHas = $this->YearClosingBalanceDetail->hasAny(['fiscal_year_id' => $fiscal_year_id - 1]);
        $yearBeforePreviousYearHas = $this->YearClosingBalanceDetail->hasAny(['fiscal_year_id' => $fiscal_year_id - 2]);
        $currentYearHas = !empty($currentYearHas) ? $currentYearHas : 0;
        $previousYearHas = !empty($previousYearHas) ? $previousYearHas : 0;
        // pr($currentYearHas . '-----' . $previousYearHas);
        // pr($fiscal_year_id);
//echo '------------';
        if ($currentYearHas > 0) {
            $accHeadList = $this->YearClosingBalanceDetail->find('all', array(
                'conditions' => array(
                    'YearClosingBalanceDetail.parent_id' => $parent_id,
                    'YearClosingBalanceDetail.fiscal_year_id' => $fiscal_year_id
                ),
                'fields' => 'SUM(YearClosingBalanceDetail.head_balance)',
                // 'order' => 'HeadWiseAccountBalance.id DESC',
                'limit' => 1,
                'recursive' => -1
            ));
            if (!empty($accHeadList[0][0]['SUM(`YearClosingBalanceDetail`.`head_balance`)'])) {
                return $accHeadList[0][0]['SUM(`YearClosingBalanceDetail`.`head_balance`)'];
            } else {
                return '-';
            }
        } else {
            if ($currentYearHas == 0 && $previousYearHas == 0) {
                $previous_data = $this->get_head_wise_acc_balance_with_daily_transaction($fiscal_year_id - 1, $parent_id_null = NULL, $child_id = NULL, $year_is_greater_than_or_equal = 0);
                $re_shape_data_for_previous_year = $this->re_shape_data($previous_data);
                /* Data for Current Year. */
                $current_data = $this->get_head_wise_acc_balance_with_daily_transaction($fiscal_year_id, $parent_id_null = NULL, $child_id = NULL, $year_is_greater_than_or_equal = 0);
                $re_shape_data_for_current_year = $this->re_shape_data($current_data);
                /* Replace Array */
                $replace_array = $this->replace_array($re_shape_data_for_previous_year, $re_shape_data_for_current_year);
                $get_year_closing_balance_detail_data = $this->get_year_closing_balance_detail_data($fiscal_year_id - 2);
                foreach ($get_year_closing_balance_detail_data as $key => $value) {
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['acc_head_type_id'] = $value['YearClosingBalanceDetail']['acc_head_type_id'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['parent_id'] = $value['YearClosingBalanceDetail']['parent_id'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['acc_head_list_id'] = $value['YearClosingBalanceDetail']['acc_head_list_id'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['head_balance'] = $value['YearClosingBalanceDetail']['head_balance'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['depreciation_rate'] = $value['YearClosingBalanceDetail']['depreciation_rate'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['depreciation_amount'] = $value['YearClosingBalanceDetail']['depreciation_amount'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['total_receive'] = $value['YearClosingBalanceDetail']['total_receive'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['total_payment'] = $value['YearClosingBalanceDetail']['total_payment'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['fiscal_year_id'] = $value['YearClosingBalanceDetail']['fiscal_year_id'];
                }
                $final_replace_array = $this->replace_array($re_shape_data_for_year_closing_balance_detail, $replace_array);
                /* DepreCiation Calculation start */
                $yearClosingBalanceDetails = new YearClosingBalanceDetailsController();
                foreach ($final_replace_array as $key => $value) {
                    $newArray[$key]['acc_head_type_id'] = $value['acc_head_type_id'];
                    $newArray[$key]['parent_id'] = $value['parent_id'];
                    $newArray[$key]['acc_head_list_id'] = $value['acc_head_list_id'];
                    $newArray[$key]['depreciation_rate'] = $yearClosingBalanceDetails->get_depreCiation_rate($value['acc_head_list_id'], $value['parent_id'], $value['fiscal_year_id']);
                    $newArray[$key]['depreciation_amount'] = $yearClosingBalanceDetails->get_depreCiation_amount($value['acc_head_list_id'], $value['parent_id'], $value['fiscal_year_id'], $value['head_balance']);
                    $newArray[$key]['head_balance'] = $value['head_balance'] - $newArray[$key]['depreciation_amount'];
                    $newArray[$key]['total_receive'] = $value['total_receive'];
                    $newArray[$key]['total_payment'] = $value['total_payment'];
                    $newArray[$key]['fiscal_year_id'] = $value['fiscal_year_id'];
                    $newArray[$key]['created_at'] = $this->current_datetime();
                }
                /* DepreCiation Calculation end. */
                foreach ($newArray as $key => $value) {
                    $result[$value['parent_id']]['head_balance'] = 0;
                }
                foreach ($newArray as $key => $value) {
                    $result[$value['parent_id']]['head_balance'] += $value['head_balance'];
                }
                return $result[$parent_id]['head_balance'];
            } elseif ($currentYearHas == 0 && $previousYearHas > 0) {
                $get_year_closing_balance_detail_data = $this->get_year_closing_balance_detail_data($fiscal_year_id - 1);
                foreach ($get_year_closing_balance_detail_data as $key => $value) {
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['acc_head_type_id'] = $value['YearClosingBalanceDetail']['acc_head_type_id'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['parent_id'] = $value['YearClosingBalanceDetail']['parent_id'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['acc_head_list_id'] = $value['YearClosingBalanceDetail']['acc_head_list_id'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['head_balance'] = $value['YearClosingBalanceDetail']['head_balance'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['depreciation_rate'] = $value['YearClosingBalanceDetail']['depreciation_rate'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['depreciation_amount'] = $value['YearClosingBalanceDetail']['depreciation_amount'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['total_receive'] = $value['YearClosingBalanceDetail']['total_receive'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['total_payment'] = $value['YearClosingBalanceDetail']['total_payment'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['fiscal_year_id'] = $value['YearClosingBalanceDetail']['fiscal_year_id'];
                }
                /* Data for Current Year. */
                $current_data = $this->get_head_wise_acc_balance_with_daily_transaction($fiscal_year_id, $parent_id_null = NULL, $child_id = NULL, $year_is_greater_than_or_equal = 0);
                $re_shape_data_for_current_year = $this->re_shape_data($current_data);
                /* Replace data. */
                $final_replace_array = $this->replace_array($re_shape_data_for_year_closing_balance_detail, $re_shape_data_for_current_year);
                /* DepreCiation Calculation start */
                $yearClosingBalanceDetails = new YearClosingBalanceDetailsController();
                foreach ($final_replace_array as $key => $value) {
                    $newArray[$key]['acc_head_type_id'] = $value['acc_head_type_id'];
                    $newArray[$key]['parent_id'] = $value['parent_id'];
                    $newArray[$key]['acc_head_list_id'] = $value['acc_head_list_id'];
                    $newArray[$key]['depreciation_rate'] = $yearClosingBalanceDetails->get_depreCiation_rate($value['acc_head_list_id'], $value['parent_id'], $fiscal_year_id);
                    $newArray[$key]['depreciation_amount'] = $yearClosingBalanceDetails->get_depreCiation_amount($value['acc_head_list_id'], $value['parent_id'], $fiscal_year_id, $value['head_balance']);
                    $newArray[$key]['head_balance'] = $value['head_balance'] - $newArray[$key]['depreciation_amount'];
                    $newArray[$key]['total_receive'] = $value['total_receive'];
                    $newArray[$key]['total_payment'] = $value['total_payment'];
                    $newArray[$key]['fiscal_year_id'] = $fiscal_year_id;
                    $newArray[$key]['created_at'] = $this->current_datetime();
                }
                /* DepreCiation Calculation end. */
                foreach ($newArray as $key => $value) {
                    $result[$value['parent_id']]['head_balance'] = 0;
                }
                foreach ($newArray as $key => $value) {
                    $result[$value['parent_id']]['head_balance'] += $value['head_balance'];
                }
                // pr($result);
                return $result[$parent_id]['head_balance'];
            } else {
                return '-';
            }

            /* $data = $this->get_head_wise_acc_balance_with_daily_transaction($fiscal_year_id, $parent_id);
              $catch_data=0;
              foreach ($data as $key => $value) {
              $catch_data += $value['b']['head_balance'];
              }
              $result=($catch_data==0)?'-':$catch_data;
              return $result; */
        }
    }

    public function get_head_name($parent_id) {
        $this->loadModel('AccHeadList');
        $accHeadList = $this->AccHeadList->find('all', array(
            'conditions' => array('AccHeadList.id' => $parent_id,
            ),
            'fields' => 'AccHeadList.head_name',
            // 'order' => 'HeadWiseAccountBalance.id DESC',
            'limit' => 1,
            'recursive' => -1
        ));
        if (count($accHeadList) > 0) {
            return $accHeadList[0]['AccHeadList']['head_name'];
        } else {
            return '';
        }
    }

    public function get_acc_head_type($acc_head_type_id) {
        $this->loadModel('AccHeadType');
        $transaction_amount = $this->AccHeadType->find('all', array(
            'conditions' => array('AccHeadType.id' => $acc_head_type_id,
            ),
            'fields' => 'AccHeadType.head_type_name',
            // 'order' => 'HeadWiseAccountBalance.id DESC',
            'limit' => 1,
            'recursive' => -1
        ));
        if (count($transaction_amount) > 0) {
            return $transaction_amount[0]['AccHeadType']['head_type_name'];
        } else {
            return '';
        }
    }

    public function get_head_wise_acc_balance_with_daily_transaction($year, $parent_id, $child_id, $year_statment) {
        $this->loadModel('DailyTransaction');
        $query = '';
        if (!is_null($year)) {
            if ($year_statment == 1) {
                $query .= "AND a.fiscal_year_id >$year ";
                $id = 'a.id';
            } else if ($year_statment == -1) {
                $query .= "AND a.fiscal_year_id <=$year ";
                $id = 'MAX(a.id)';
            } else {
                $query .= "AND a.fiscal_year_id=$year ";
                $id = 'MAX(a.id)';
            }
        } else {
            $id = 'MAX(a.id)';
        }
        if (!is_null($parent_id)):
            $query .= "AND a.parent_id=$parent_id ";
        endif;
        if (!is_null($child_id)):
            $query .= "AND a.acc_head_list_id=$child_id ";

        endif;
        $query = ltrim($query, "AND ");
        $data = $this->DailyTransaction->query("SELECT a.id,a.acc_head_type_id,a.acc_head_list_id,a.parent_id,a.fiscal_year_id,b.head_balance FROM daily_transactions as a LEFT JOIN head_wise_account_balance as b ON a.id = b.daily_transaction_id WHERE a.id IN (SELECT $id AS id FROM daily_transactions as a WHERE $query GROUP BY a.acc_head_list_id)");
        return $data;
    }

    public function re_shape_data($data) {
        $yearClosingBalanceDetails = new YearClosingBalanceDetailsController();
        foreach ($data as $key => $value) {
            $newArray[$value['a']['acc_head_list_id']]['acc_head_type_id'] = $value['a']['acc_head_type_id'];
            $newArray[$value['a']['acc_head_list_id']]['parent_id'] = $value['a']['parent_id'];
            $newArray[$value['a']['acc_head_list_id']]['acc_head_list_id'] = $value['a']['acc_head_list_id'];
            $newArray[$value['a']['acc_head_list_id']]['head_balance'] = $value['b']['head_balance'];
            $newArray[$value['a']['acc_head_list_id']]['depreciation_rate'] = 0;
            $newArray[$value['a']['acc_head_list_id']]['depreciation_amount'] = 0;
            $newArray[$value['a']['acc_head_list_id']]['total_receive'] = $yearClosingBalanceDetails->get_receive_or_payment(1, $value['a']['acc_head_type_id'], $value['a']['acc_head_list_id'], $value['a']['parent_id'], $value['a']['fiscal_year_id']);
            $newArray[$value['a']['acc_head_list_id']]['total_payment'] = $yearClosingBalanceDetails->get_receive_or_payment(2, $value['a']['acc_head_type_id'], $value['a']['acc_head_list_id'], $value['a']['parent_id'], $value['a']['fiscal_year_id']);
            $newArray[$value['a']['acc_head_list_id']]['fiscal_year_id'] = $value['a']['fiscal_year_id'];
            $newArray[$value['a']['acc_head_list_id']]['created_at'] = $this->current_datetime();
        }
        return $newArray;
    }

    public function replace_array($re_shape_data_for_previous_year, $re_shape_data_for_current_year) {
        foreach ($re_shape_data_for_current_year as $key => $value) {
            $re_shape_data_for_previous_year[$key] = $re_shape_data_for_current_year[$key];
        }
        return $re_shape_data_for_previous_year;
    }

    public function get_year_closing_balance_detail_data($fiscal_year_id) {
        $yearClosingBalanceDetail = $this->YearClosingBalanceDetail->find('all', array(
            'conditions' => array(
                'YearClosingBalanceDetail.fiscal_year_id' => $fiscal_year_id,
                'NOT' => array(
                    'YearClosingBalanceDetail.acc_head_type_id' => array(1, 2)
                ),
            ),
            'fields' => 'YearClosingBalanceDetail.id,'
            . 'YearClosingBalanceDetail.acc_head_type_id,'
            . 'YearClosingBalanceDetail.parent_id,'
            . 'YearClosingBalanceDetail.acc_head_list_id,'
            . 'YearClosingBalanceDetail.head_balance,'
            . 'YearClosingBalanceDetail.depreciation_rate,'
            . 'YearClosingBalanceDetail.depreciation_amount,'
            . 'YearClosingBalanceDetail.total_receive,'
            . 'YearClosingBalanceDetail.total_payment,'
            . 'YearClosingBalanceDetail.fiscal_year_id',
            'order' => 'YearClosingBalanceDetail.acc_head_type_id ASC',
            // 'limit' => 1,
            //'group' => 'YearClosingBalanceDetail.parent_id',
            'recursive' => -1
        ));
        if ($yearClosingBalanceDetail > 0) {
            return $yearClosingBalanceDetail;
        } else {
            return 0;
        }
//pr($yearClosingBalanceDetail);
    }

    public function get_structure($structured_data) {
        foreach ($structured_data as $key => $value) {
            $new_array[$value['acc_head_type_id']][] = $value['parent_id'];
        }
        foreach ($new_array as $key => $value) {
            $result[$key] = array_unique($new_array[$key]);
        }
        return $result;
    }

    public function year_has($year) {
        $this->loadModel('YearClosingBalanceDetail');
        $yearClosingBalanceDetail = $this->YearClosingBalanceDetail->find('all', array(
            'conditions' => array(
                'YearClosingBalanceDetail.fiscal_year_id' => $year,
                'NOT' => array(
                    'YearClosingBalanceDetail.acc_head_type_id' => array(1, 2)
                ),
            ),
            'fields' => 'YearClosingBalanceDetail.id',
            'order' => 'YearClosingBalanceDetail.id ASC',
            'limit' => 1,
            //'group' => 'YearClosingBalanceDetail.parent_id',
            'recursive' => -1
        ));
        if (count($yearClosingBalanceDetail) > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    public function admin_balance_sheet_report() {
        $this->loadModel('YearClosingBalanceDetail');
        $this->loadModel('DailyTransaction');
        $this->loadModel('HeadWiseAccountBalance');
        $previous_year = $this->request->data('fiscal_year_id') - 1;
        $year_before_previous_year = $previous_year - 1;
        $years = array($previous_year, $this->request->data('fiscal_year_id'));

        $yearBeforePreviousYearHas = $this->YearClosingBalanceDetail->hasAny(['fiscal_year_id' => $year_before_previous_year]);

        $currentYearHas = $this->year_has($this->request->data('fiscal_year_id'));
        $previousYearHas = $this->year_has($this->request->data('fiscal_year_id') - 1);
       // pr('currentYear' . $currentYearHas);
       // pr('previousYear' . $previousYearHas);

        $yearHasDailyTransaction = $this->DailyTransaction->hasAny(['fiscal_year_id' => $this->request->data('fiscal_year_id')]);
        //pr('$yearHasDailyTransaction' . $yearHasDailyTransaction);
        if (!empty($yearHasDailyTransaction)):
            if ($currentYearHas == 0 && $previousYearHas == 0) {
                $previous_data = $this->get_head_wise_acc_balance_with_daily_transaction($previous_year, $parent_id = NULL, $child_id = NULL, $year_is_greater_than_or_equal = 0);
                $re_shape_data_for_previous_year = $this->re_shape_data($previous_data);

                /* Data for Current Year. */
                $current_data = $this->get_head_wise_acc_balance_with_daily_transaction($this->request->data('fiscal_year_id'), $parent_id = NULL, $child_id = NULL, $year_is_greater_than_or_equal = 0);
                $re_shape_data_for_current_year = $this->re_shape_data($current_data);

                /* Replace Array */
                $replace_array = $this->replace_array($re_shape_data_for_previous_year, $re_shape_data_for_current_year);
                $get_year_closing_balance_detail_data = $this->get_year_closing_balance_detail_data($year_before_previous_year);
                foreach ($get_year_closing_balance_detail_data as $key => $value) {
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['acc_head_type_id'] = $value['YearClosingBalanceDetail']['acc_head_type_id'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['parent_id'] = $value['YearClosingBalanceDetail']['parent_id'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['acc_head_list_id'] = $value['YearClosingBalanceDetail']['acc_head_list_id'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['head_balance'] = $value['YearClosingBalanceDetail']['head_balance'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['depreciation_rate'] = $value['YearClosingBalanceDetail']['depreciation_rate'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['depreciation_amount'] = $value['YearClosingBalanceDetail']['depreciation_amount'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['total_receive'] = $value['YearClosingBalanceDetail']['total_receive'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['total_payment'] = $value['YearClosingBalanceDetail']['total_payment'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['fiscal_year_id'] = $value['YearClosingBalanceDetail']['fiscal_year_id'];
                }
                $final_replace_array = $this->replace_array($re_shape_data_for_year_closing_balance_detail, $replace_array);
                $result = $this->get_structure($final_replace_array);
                foreach ($result as $key => $value) {
                    if ($key != 1 && $key != 2) :
                        $new_array[$key] = $value;
                    endif;
                }
            } elseif ($currentYearHas == 0 && $previousYearHas > 0) {
                $get_year_closing_balance_detail_data = $this->get_year_closing_balance_detail_data($previous_year);
                foreach ($get_year_closing_balance_detail_data as $key => $value) {
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['acc_head_type_id'] = $value['YearClosingBalanceDetail']['acc_head_type_id'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['parent_id'] = $value['YearClosingBalanceDetail']['parent_id'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['acc_head_list_id'] = $value['YearClosingBalanceDetail']['acc_head_list_id'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['head_balance'] = $value['YearClosingBalanceDetail']['head_balance'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['depreciation_rate'] = $value['YearClosingBalanceDetail']['depreciation_rate'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['depreciation_amount'] = $value['YearClosingBalanceDetail']['depreciation_amount'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['total_receive'] = $value['YearClosingBalanceDetail']['total_receive'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['total_payment'] = $value['YearClosingBalanceDetail']['total_payment'];
                    $re_shape_data_for_year_closing_balance_detail[$value['YearClosingBalanceDetail']['acc_head_list_id']]['fiscal_year_id'] = $value['YearClosingBalanceDetail']['fiscal_year_id'];
                }
                /* Data for Current Year. */
                $current_data = $this->get_head_wise_acc_balance_with_daily_transaction($this->request->data('fiscal_year_id'), $parent_id = NULL, $child_id = NULL, $year_is_greater_than_or_equal = 0);
                if (count($current_data) > 0) {
                    $re_shape_data_for_current_year = $this->re_shape_data($current_data);
                    /* Replace data. */
                    $final_replace_array = $this->replace_array($re_shape_data_for_year_closing_balance_detail, $re_shape_data_for_current_year);
                    $result = $this->get_structure($final_replace_array);
                    ksort($result);
                    foreach ($result as $key => $value) {
                        if ($key != 1 && $key != 2) :
                            $new_array[$key] = $value;
                        endif;
                    }
                }else {
                    echo 'There is no data in daily transaction and head wise accounts balance';
                }
            } elseif ($currentYearHas > 0 && $previousYearHas > 0) {
                $get_year_closing_balance_detail_data = $this->get_year_closing_balance_detail_data($this->request->data('fiscal_year_id'));
                foreach ($get_year_closing_balance_detail_data as $key => $value) {
                    $result[$value['YearClosingBalanceDetail']['acc_head_type_id']][] = $value['YearClosingBalanceDetail']['parent_id'];
                }
                foreach ($result as $key => $value) {
                    $new_array[$key] = array_unique($result[$key]);
                }
            } else {
                $this->Session->setFlash(__('You Are not Closed Year Before Previous Year!'), 'flash/error');
            }

        endif;
        $this->set(compact('new_array', 'years'));
        //die();
    }

    public function admin_balance_sheet_report1() {
        $this->loadModel('AccHeadList');
        $this->loadModel('DailyTransaction');
        $query = array(
            'NOT' => array(
                'DailyTransaction.acc_head_type_id' => array(1, 2)
            )
        );

        $previous_year = $this->request->data('fiscal_year_id') - 1;
//pr($previous_year);
//die();
        if ($this->request->data('fiscal_year_id') != '' && $previous_year > 0) {
            $query['DailyTransaction.fiscal_year_id'] = $this->request->data('fiscal_year_id');
            $query['DailyTransaction.fiscal_year_id'] = $previous_year;
        }
        $years = array($previous_year, $this->request->data('fiscal_year_id'));
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
            'fields' => array('AccHeadList_tb.head_name,AccHeadList_tb.acc_head_type_id,AccHeadList_tb.id,DailyTransaction.acc_head_list_id,DailyTransaction.acc_head_type_id,DailyTransaction.parent_id'),
            'order' => 'DailyTransaction.id DESC',
            'group' => 'DailyTransaction.parent_id',
                //'recursive' => 1
        ));


        foreach ($data as $key => $value) {
            $new_array[$value['AccHeadList_tb']['acc_head_type_id']][$value['AccHeadList_tb']['id']] = $value['AccHeadList_tb']['head_name'];
        }
// pr($data);
        ksort($new_array);
        $this->set(compact('new_array', 'years'));
        //pr($new_array);
    }

    public function get_starting_balances($fiscal_year_id, $parent_id) {
        if ($fiscal_year_id == 1) {
            
        } else {

        }
    }

    public function get_ending_balances($fiscal_year_id, $parent_id) {

    }

}
