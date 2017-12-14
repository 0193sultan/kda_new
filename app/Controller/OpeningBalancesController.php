<?php

App::uses('AppController', 'Controller');
App::import('Controller', 'DailyTransactions');
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of OpeningBalances
 *
 * @author USER-PC
 */
class OpeningBalancesController extends AppController {

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Paginator', 'Session');

    public function daily_transaction($param, $key, $value, $head, $transaction_amount, $bank_info, $transaction_category_id, $transaction_type_id, $entry_type_id) {
        $this->DailyTransaction->create();
        if ($entry_type_id == 2) {
            $this->request->data['DailyTransaction']['entry_type_id'] = 2;
        } else {
            $this->request->data['DailyTransaction']['entry_type_id'] = 1;
        }
        $this->request->data['DailyTransaction']['acc_head_type_id'] = $param['OpeningBalances']['acc_head_type_id'];
//        if ($head != 'single' && $multiple_head != 2):
//            $this->request->data['DailyTransaction']['acc_head_list_id'] = $param['OpeningBalances']['sub_head_list_id'][$key];
//        endif;
        if ($bank_info > 1) {
            $this->request->data['DailyTransaction']['bank_info_id'] = $param['OpeningBalances']['bank_info_id'][$key];
            $this->request->data['DailyTransaction']['branch_id'] = $param['OpeningBalances']['branch_id'][$key];
            $this->request->data['DailyTransaction']['bank_account_id'] = $param['OpeningBalances']['bank_account_id'][$key];
            $this->request->data['DailyTransaction']['transaction_date'] = $this->get_last_date($param['OpeningBalances']['fiscal_year_id'], $param['OpeningBalances']['month_id']);
        } elseif ($bank_info == 1) {
            $this->request->data['DailyTransaction']['bank_info_id'] = $param['OpeningBalances']['bank_info_id'];
            $this->request->data['DailyTransaction']['branch_id'] = $param['OpeningBalances']['branch_id'];
            $this->request->data['DailyTransaction']['bank_account_id'] = $param['OpeningBalances']['bank_account_id'];
            $this->request->data['DailyTransaction']['transaction_date'] = $this->get_last_date($param['OpeningBalances']['fiscal_year_id'], $param['OpeningBalances']['month_id']);
        }
        if ($transaction_category_id = 2) {
            $this->request->data['DailyTransaction']['transaction_category_id'] = 2;
        } elseif ($transaction_category_id = 3) {
            $this->request->data['DailyTransaction']['transaction_category_id'] = 3;
        }
        if ($transaction_type_id = 2) {
            $this->request->data['DailyTransaction']['transaction_type_id'] = 2;
        } else {
            $this->request->data['DailyTransaction']['transaction_type_id'] = 1;
        }
        $this->request->data['DailyTransaction']['fiscal_year_id'] = $param['OpeningBalances']['fiscal_year_id'];
        $this->request->data['DailyTransaction']['month_id'] = $param['OpeningBalances']['month_id'];
        if ($head == 'Multiple') {
            $this->request->data['DailyTransaction']['acc_head_list_id'] = $param['OpeningBalances']['sub_head_list_id'][$key];
            $this->request->data['DailyTransaction']['parent_id'] = $param['OpeningBalances']['acc_head_list_id'][$key];
        } elseif ($head == 'Other') {
            $this->request->data['DailyTransaction']['acc_head_list_id'] = $param['OpeningBalances']['sub_head_list_id'][$key];
            $this->request->data['DailyTransaction']['parent_id'] = $param['OpeningBalances']['acc_head_list_id'];
        } elseif ($head == 'Distinct') {
            $this->request->data['DailyTransaction']['acc_head_list_id'] = $param['OpeningBalances']['sub_head_list_id'];
            $this->request->data['DailyTransaction']['parent_id'] = $param['OpeningBalances']['acc_head_list_id'];
        } else {
            $this->request->data['DailyTransaction']['acc_head_list_id'] = $param['OpeningBalances']['acc_head_list_id'];
            $this->request->data['DailyTransaction']['parent_id'] = $param['OpeningBalances']['acc_head_list_id'];
        }

        if ($transaction_amount == 'Multiple') {
            $this->request->data['DailyTransaction']['transaction_amount'] = $param['OpeningBalances']['transaction_amount'][$key];
        } else if ($transaction_amount == 'Other') {
            $this->request->data['DailyTransaction']['transaction_amount'] = $param['DailyTransaction']['transaction_amount'];
        } else {
            $this->request->data['DailyTransaction']['transaction_amount'] = $param['OpeningBalances']['transaction_amount'];
        }

        $this->request->data['DailyTransaction']['balance_status'] = 0;
        $this->request->data['DailyTransaction']['created_at'] = $this->current_datetime();
        $this->request->data['DailyTransaction']['user_id'] = $this->UserAuth->getUserId();
        $this->DailyTransaction->save($this->request->data);
    }

    public function head_wise_account_balance($param, $key, $value, $daily_transaction_id, $head, $transaction_amount) {
        $this->HeadWiseAccountBalance->create();
        $this->request->data['HeadWiseAccountBalance']['daily_transaction_id'] = $daily_transaction_id;
        $this->request->data['HeadWiseAccountBalance']['flag'] = 'Addition';
        if ($head == 'Multiple') {
            $this->request->data['HeadWiseAccountBalance']['acc_head_list_id'] = $param['OpeningBalances']['sub_head_list_id'][$key];
            $this->request->data['HeadWiseAccountBalance']['parent_id'] = $param['OpeningBalances']['acc_head_list_id'][$key];
        } elseif ($head == 'Other') {
            $this->request->data['HeadWiseAccountBalance']['acc_head_list_id'] = $param['OpeningBalances']['sub_head_list_id'][$key];
            $this->request->data['HeadWiseAccountBalance']['parent_id'] = $param['OpeningBalances']['acc_head_list_id'];
        } elseif ($head == 'Distinct') {
            $this->request->data['HeadWiseAccountBalance']['acc_head_list_id'] = $param['OpeningBalances']['sub_head_list_id'];
            $this->request->data['HeadWiseAccountBalance']['parent_id'] = $param['OpeningBalances']['acc_head_list_id'];
        } else {
            $this->request->data['HeadWiseAccountBalance']['acc_head_list_id'] = $param['OpeningBalances']['acc_head_list_id'];
            $this->request->data['HeadWiseAccountBalance']['parent_id'] = $param['OpeningBalances']['acc_head_list_id'];
        }

        if ($transaction_amount == 'Multiple') {
            $this->request->data['HeadWiseAccountBalance']['head_balance'] = $param['OpeningBalances']['transaction_amount'][$key];
            $this->request->data['HeadWiseAccountBalance']['transaction_amount'] = $param['OpeningBalances']['transaction_amount'][$key];
        } elseif ($transaction_amount == 'Multiple_for_bank_deposit') {
            $this->request->data['HeadWiseAccountBalance']['head_balance'] = $param['OpeningBalances']['tr_amount_for_head_wise_account_balance'][$key];
            $this->request->data['HeadWiseAccountBalance']['transaction_amount'] = $param['OpeningBalances']['transaction_amount'][$key];
        } elseif ($transaction_amount == 'Other') {
            $this->request->data['HeadWiseAccountBalance']['head_balance'] = $param['DailyTransaction']['transaction_amount'];
            $this->request->data['HeadWiseAccountBalance']['transaction_amount'] = $param['DailyTransaction']['transaction_amount'];
        } else {
            $this->request->data['HeadWiseAccountBalance']['head_balance'] = $param['OpeningBalances']['transaction_amount'];
            $this->request->data['HeadWiseAccountBalance']['transaction_amount'] = $param['OpeningBalances']['transaction_amount'];
        }
        $this->request->data['HeadWiseAccountBalance']['created_at'] = $this->current_datetime();
        $this->request->data['HeadWiseAccountBalance']['user_id'] = $this->UserAuth->getUserId();
        $this->HeadWiseAccountBalance->save($this->request->data);
    }

    public function admin_index() {
        $this->set('page_title', 'Opening Balance');
        $this->loadModel('FiscalYear');
        $this->loadModel('Month');
        $this->loadModel('AccHeadType');
        $this->loadModel('DailyTransaction');
        $this->loadModel('HeadWiseAccountBalance');
        $this->loadModel('BankAccountBalance');
        $this->loadModel('FixDeposit');
        $this->loadModel('StockGood');
        $fiscalYears = $this->FiscalYear->find('list');
        $months = $this->Month->find('list');
        $accHeadTypes = $this->AccHeadType->find('list', array('fields' => array('AccHeadType.id', 'AccHeadType.head_type_name'), 'conditions' => array('AccHeadType.status' => 'Active')));
        $this->set(compact('fiscalYears', 'months', 'accHeadTypes'));
        if ($this->request->is('post')) {
            if ($this->request->data['OpeningBalances']['acc_head_type_id'] == 3) {
                foreach ($this->request->data['OpeningBalances']['transaction_amount'] as $key => $value) {
                    $this->daily_transaction($this->request->data, $key, $value, $head = 'Multiple', $transaction_amount = 'Multiple', $bank_info = 0, $transaction_category_id = 3, $transaction_type_id = 2, $entry_type_id = 1);
                    $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                    $this->head_wise_account_balance($this->request->data, $key, $value, $daily_transaction_id, $head = 'Multiple', $transaction_amount = 'Multiple');
                    $success = 1;
                }
            } elseif ($this->request->data['OpeningBalances']['acc_head_type_id'] == 4 && $this->request->data['OpeningBalances']['acc_head_list_id'] == 5) {
//                pr($this->request->data);
//                die();
                foreach ($this->request->data['OpeningBalances']['transaction_amount'] as $key => $value) {
                    $this->daily_transaction($this->request->data, $key, $value, $head = 'Other', $transaction_amount = 'Multiple', $bank_info = 0, $transaction_category_id = 3, $transaction_type_id = 2, $entry_type_id = 1);
                    $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                    $this->head_wise_account_balance($this->request->data, $key, $value, $daily_transaction_id, $head = 'Other', $transaction_amount = 'Multiple');
                    $success = 1;
                }
            } elseif ($this->request->data['OpeningBalances']['acc_head_type_id'] == 4 && $this->request->data['OpeningBalances']['acc_head_list_id'] == 9) {
                $i = 0;
                $temp = 0;
                foreach ($this->request->data['OpeningBalances']['transaction_amount'] as $tr_amount_key => $tr_amount_value) {
                    $this->request->data['OpeningBalances']['tr_amount_for_head_wise_account_balance'][$i] = $temp + $tr_amount_value;
                    $temp = $this->request->data['OpeningBalances']['tr_amount_for_head_wise_account_balance'][$i];
                    $i++;
                }
                foreach ($this->request->data['OpeningBalances']['transaction_amount'] as $key => $value) {
                    $this->daily_transaction($this->request->data, $key, $value, $head = 'Single', $transaction_amount = 'Multiple', $bank_info = 2, $transaction_category_id = 3, $transaction_type_id = 2, $entry_type_id = 1);
                    $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                    $this->head_wise_account_balance($this->request->data, $key, $value, $daily_transaction_id, $head = 'Single', $transaction_amount = 'Multiple_for_bank_deposit');

                    $this->BankAccountBalance->create();
                    $this->request->data['BankAccountBalance']['daily_transaction_id'] = $daily_transaction_id;
                    $this->request->data['BankAccountBalance']['bank_info_id'] = $this->request->data['OpeningBalances']['bank_info_id'][$key];
                    $this->request->data['BankAccountBalance']['branch_id'] = $this->request->data['OpeningBalances']['branch_id'][$key];
                    $this->request->data['BankAccountBalance']['bank_account_id'] = $this->request->data['OpeningBalances']['bank_account_id'][$key];
                    $this->request->data['BankAccountBalance']['transaction_amount'] = $this->request->data['OpeningBalances']['transaction_amount'][$key];
                    $this->request->data['BankAccountBalance']['account_balance'] = $this->request->data['OpeningBalances']['transaction_amount'][$key];
                    $this->request->data['BankAccountBalance']['created_at'] = $this->current_datetime();
                    $this->request->data['BankAccountBalance']['user_id'] = $this->UserAuth->getUserId();
                    $this->BankAccountBalance->save($this->request->data);

                    $success = 1;
                }

                $success = 1;
            } elseif ($this->request->data['OpeningBalances']['acc_head_type_id'] == 4 && $this->request->data['OpeningBalances']['acc_head_list_id'] == 10) {
                if ($this->request->data['OpeningBalances']['balance_type'] == 1) {
                    $this->request->data['OpeningBalances']['transaction_amount'] = $this->request->data['OpeningBalances']['investment_amount'];
                    $this->daily_transaction($this->request->data, $key = NULL, $value = NULL, $head = 'Distinct', $transaction_amount = 'Single', $bank_info = 0, $transaction_category_id = 3, $transaction_type_id = 2, $entry_type_id = 1);
                    $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                    $this->head_wise_account_balance($this->request->data, $key = NULL, $value = NULL, $daily_transaction_id, $head = 'Distinct', $transaction_amount = 'Single');

                    $this->request->data['FixDeposit']['daily_transaction_id'] = $daily_transaction_id;
                    $this->request->data['FixDeposit']['acc_head_list_id'] = $this->request->data['OpeningBalances']['sub_head_list_id'];
                    $this->request->data['FixDeposit']['parent_id'] = $this->request->data['OpeningBalances']['acc_head_list_id'];
                    $this->request->data['FixDeposit']['fix_deposit_bank_name'] = $this->request->data['OpeningBalances']['fix_deposit_bank_name'];
                    $this->request->data['FixDeposit']['fix_deposit_branch_name'] = $this->request->data['OpeningBalances']['fix_deposit_branch_name'];
                    $this->request->data['FixDeposit']['fix_deposit_no'] = $this->request->data['OpeningBalances']['fix_deposit_no'];
                    $this->request->data['FixDeposit']['interest_rate'] = $this->request->data['OpeningBalances']['interest_rate'];
                    $this->request->data['FixDeposit']['investment_date'] = date("Y-m-d", strtotime($this->request->data['OpeningBalances']['investment_date']));
                    $this->request->data['FixDeposit']['investment_expire_date'] = date("Y-m-d", strtotime($this->request->data['OpeningBalances']['investment_expire_date']));
                    $this->request->data['FixDeposit']['investment_amount'] = $this->request->data['OpeningBalances']['investment_amount'];
                    $this->request->data['FixDeposit']['created_at'] = $this->current_datetime();
                    $this->request->data['FixDeposit']['user_id'] = $this->UserAuth->getUserId();
                    $this->FixDeposit->save($this->request->data);
                    $success = 1;
                } elseif ($this->request->data['OpeningBalances']['balance_type'] == 2) {
                    $this->request->data['OpeningBalances']['transaction_amount'] = $this->request->data['OpeningBalances']['investment_amount'];
                    $this->daily_transaction($this->request->data, $key = NULL, $value = NULL, $head = 'Distinct', $transaction_amount = 'Single', $bank_info = 1, $transaction_category_id = 2, $transaction_type_id = 1, $entry_type_id = 2);
                    $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                    foreach ($this->request->data as $key => $value) {
                        $newArray['DailyTransaction']['fiscal_year_id'] = $this->request->data['OpeningBalances']['fiscal_year_id'];
                        $newArray['DailyTransaction']['month_id'] = $this->request->data['OpeningBalances']['month_id'];
                        $newArray['DailyTransaction']['acc_head_type_id'] = $this->request->data['OpeningBalances']['fiscal_year_id'];
                        $newArray['DailyTransaction']['acc_head_list_id'] = $this->request->data['OpeningBalances']['sub_head_list_id'];
                        $newArray['DailyTransaction']['parent_id'] = $this->request->data['OpeningBalances']['acc_head_list_id'];
                        $newArray['DailyTransaction']['transaction_amount'] = $this->request->data['OpeningBalances']['investment_amount'];
                        $newArray['DailyTransaction']['bank_info_id'] = $this->request->data['OpeningBalances']['bank_info_id'];
                        $newArray['DailyTransaction']['branch_id'] = $this->request->data['OpeningBalances']['branch_id'];
                        $newArray['DailyTransaction']['bank_account_id'] = $this->request->data['OpeningBalances']['bank_account_id'];
                        $newArray['DailyTransaction']['created_at'] = $this->current_datetime();
                    }
                    $obj = new DailyTransactionsController();
                    $obj->save_in_head_wise_account_balance($newArray, $head = $this->request->data['OpeningBalances']['acc_head_list_id'], $daily_transaction_id, $flag = 'Addition');
                    $obj->save_in_bank_account_balance($newArray, $daily_transaction_id, $flag = 'Subtraction');
                    $this->request->data['FixDeposit']['daily_transaction_id'] = $daily_transaction_id;
                    $this->request->data['FixDeposit']['acc_head_list_id'] = $this->request->data['OpeningBalances']['sub_head_list_id'];
                    $this->request->data['FixDeposit']['parent_id'] = $this->request->data['OpeningBalances']['acc_head_list_id'];
                    $this->request->data['FixDeposit']['fix_deposit_bank_name'] = $this->request->data['OpeningBalances']['fix_deposit_bank_name'];
                    $this->request->data['FixDeposit']['fix_deposit_branch_name'] = $this->request->data['OpeningBalances']['fix_deposit_branch_name'];
                    $this->request->data['FixDeposit']['fix_deposit_no'] = $this->request->data['OpeningBalances']['fix_deposit_no'];
                    $this->request->data['FixDeposit']['interest_rate'] = $this->request->data['OpeningBalances']['interest_rate'];
                    $this->request->data['FixDeposit']['investment_date'] = date("Y-m-d", strtotime($this->request->data['OpeningBalances']['investment_date']));
                    $this->request->data['FixDeposit']['investment_expire_date'] = date("Y-m-d", strtotime($this->request->data['OpeningBalances']['investment_expire_date']));
                    $this->request->data['FixDeposit']['investment_amount'] = $this->request->data['OpeningBalances']['investment_amount'];
                    $this->request->data['FixDeposit']['created_at'] = $this->current_datetime();
                    $this->request->data['FixDeposit']['user_id'] = $this->UserAuth->getUserId();
                    $this->FixDeposit->save($this->request->data);
                    $success = 1;
                } else {
                    $this->Session->setFlash(__('Please select balance type'), 'flash/error');
                    $this->redirect(array('action' => 'index'));
                }
            } elseif ($this->request->data['OpeningBalances']['acc_head_type_id'] == 4 && $this->request->data['OpeningBalances']['acc_head_list_id'] == 11) {
                $i = 0;
                foreach ($this->request->data['OpeningBalances']['goods_name'] as $key => $value) {
                    $this->request->data['OpeningBalances']['transaction_amount'] = $i + $this->request->data['OpeningBalances']['goods_amount'][$key];
                    $i = $this->request->data['OpeningBalances']['transaction_amount'];
                }
                $this->daily_transaction($this->request->data, $key, $value, $head = 'Single', $transaction_amount = 'Single', $bank_info = 0, $transaction_category_id = 3, $transaction_type_id = 2, $entry_type_id = 1);
                $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                $this->head_wise_account_balance($this->request->data, $key, $value, $daily_transaction_id, $head = 'Single', $transaction_amount = 'Single');
                foreach ($this->request->data['OpeningBalances']['goods_amount'] as $key => $value) {
                    $this->StockGood->create();
                    $this->request->data['StockGood']['daily_transaction_id'] = $daily_transaction_id;
                    $this->request->data['StockGood']['acc_head_list_id'] = $this->request->data['OpeningBalances']['acc_head_list_id'];
                    $this->request->data['StockGood']['goods_name'] = $this->request->data['OpeningBalances']['goods_name'][$key];
                    $this->request->data['StockGood']['goods_amount'] = $this->request->data['OpeningBalances']['goods_amount'][$key];
                    $this->request->data['StockGood']['goods_value'] = $this->request->data['OpeningBalances']['goods_value'][$key];
                    $this->request->data['StockGood']['created_at'] = $this->current_datetime();
                    $this->request->data['StockGood']['user_id'] = $this->UserAuth->getUserId();
                    $this->StockGood->save($this->request->data);
                }
                $success = 1;
            } elseif ($this->request->data['OpeningBalances']['acc_head_type_id'] == 6) {
                foreach ($this->request->data['OpeningBalances']['transaction_amount'] as $key => $value) {
                    $this->daily_transaction($this->request->data, $key, $value, $head = 'Multiple', $transaction_amount = 'Multiple', $bank_info = 0, $transaction_category_id = 3, $transaction_type_id = 2, $entry_type_id = 1);
                    $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                    $this->head_wise_account_balance($this->request->data, $key, $value, $daily_transaction_id, $head = 'Multiple', $transaction_amount = 'Multiple');
                    $success = 1;
                }
            } elseif ($this->request->data['OpeningBalances']['acc_head_type_id'] == 5) {
                $this->loadModel('OrganizationLoan');
                if ($this->request->data['OpeningBalances']['balance_type'] == 1) {
                    $this->daily_transaction($this->request->data, $key = NULL, $value = NULL, $head = 'Distinct', $transaction_amount = '', $bank_info = 0, $transaction_category_id = 3, $transaction_type_id = 2, $entry_type_id = 1);
                    $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                    $this->head_wise_account_balance($this->request->data, $key = NULL, $value = NULL, $daily_transaction_id, $head = 'Distinct', $transaction_amount = '');
                    $this->OrganizationLoan->create();
                    $this->request->data['OrganizationLoan']['daily_transaction_id'] = $daily_transaction_id;
                    $this->request->data['OrganizationLoan']['parent_id'] = $this->request->data['OpeningBalances']['acc_head_list_id'];
                    $this->request->data['OrganizationLoan']['acc_head_list_id'] = $this->request->data['OpeningBalances']['sub_head_list_id'];
                    $this->request->data['OrganizationLoan']['loaner_organizaion_name'] = $this->request->data['OpeningBalances']['loaner_organizaion_name'];
                    $this->request->data['OrganizationLoan']['loan_amount'] = $this->request->data['OpeningBalances']['transaction_amount'];
                    $this->request->data['OrganizationLoan']['interest_rate'] = $this->request->data['OpeningBalances']['interest_rate'];
                    $this->request->data['OrganizationLoan']['loan_opening_date'] = $this->request->data['OpeningBalances']['loan_opening_date'];
                    $this->request->data['OrganizationLoan']['created_at'] = $this->current_datetime();
                    $this->request->data['OrganizationLoan']['created_by'] = $this->UserAuth->getUserId();
                    // pr($this->request->data);die();
                    $this->OrganizationLoan->save($this->request->data);
                    $success = 1;
                } elseif ($this->request->data['OpeningBalances']['balance_type'] == 2) {
                    $this->daily_transaction($this->request->data, $key = NULL, $value = NULL, $head = 'Distinct', $transaction_amount = 'Single', $bank_info = 1, $transaction_category_id = 2, $transaction_type_id = 1, $entry_type_id = 1);
                    $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                    foreach ($this->request->data as $key => $value) {
                        $newArray['DailyTransaction']['fiscal_year_id'] = $this->request->data['OpeningBalances']['fiscal_year_id'];
                        $newArray['DailyTransaction']['month_id'] = $this->request->data['OpeningBalances']['month_id'];
                        $newArray['DailyTransaction']['acc_head_type_id'] = $this->request->data['OpeningBalances']['fiscal_year_id'];
                        $newArray['DailyTransaction']['acc_head_list_id'] = $this->request->data['OpeningBalances']['sub_head_list_id'];
                        $newArray['DailyTransaction']['parent_id'] = $this->request->data['OpeningBalances']['acc_head_list_id'];
                        $newArray['DailyTransaction']['transaction_amount'] = $this->request->data['OpeningBalances']['transaction_amount'];
                        $newArray['DailyTransaction']['bank_info_id'] = $this->request->data['OpeningBalances']['bank_info_id'];
                        $newArray['DailyTransaction']['branch_id'] = $this->request->data['OpeningBalances']['branch_id'];
                        $newArray['DailyTransaction']['bank_account_id'] = $this->request->data['OpeningBalances']['bank_account_id'];
                        $newArray['DailyTransaction']['created_at'] = $this->current_datetime();
                    }
                    $obj = new DailyTransactionsController();
                    $obj->save_in_head_wise_account_balance($newArray, $head = $this->request->data['OpeningBalances']['acc_head_list_id'], $daily_transaction_id, $flag = 'Addition');
                    $obj->save_in_bank_account_balance($newArray, $daily_transaction_id, $flag = 'Addition');

                    $this->OrganizationLoan->create();
                    $this->request->data['OrganizationLoan']['daily_transaction_id'] = $daily_transaction_id;
                    $this->request->data['OrganizationLoan']['parent_id'] = $this->request->data['OpeningBalances']['acc_head_list_id'];
                    $this->request->data['OrganizationLoan']['acc_head_list_id'] = $this->request->data['OpeningBalances']['sub_head_list_id'];
                    $this->request->data['OrganizationLoan']['loaner_organizaion_name'] = $this->request->data['OpeningBalances']['loaner_organizaion_name'];
                    $this->request->data['OrganizationLoan']['loan_amount'] = $this->request->data['OpeningBalances']['transaction_amount'];
                    $this->request->data['OrganizationLoan']['interest_rate'] = $this->request->data['OpeningBalances']['interest_rate'];
                    $this->request->data['OrganizationLoan']['loan_opening_date'] = $this->request->data['OpeningBalances']['loan_opening_date'];
                    $this->request->data['OrganizationLoan']['created_at'] = $this->current_datetime();
                    $this->request->data['OrganizationLoan']['created_by'] = $this->UserAuth->getUserId();
                    $this->OrganizationLoan->save($this->request->data);
                    $success = 1;
                } else {
                    $this->Session->setFlash(__('Please select balance type'), 'flash/error');
                    $this->redirect(array('action' => 'index'));
                }
            } else {
                $success = 0;
            }
            if ($success == 1) {
                $this->Session->setFlash(__('The Opening Balance has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The Opening Balance could not be saved. Please, try again.'), 'flash/error');
            }
        }
    }

    public function admin_balance_entry_for_fix_asset() {
        $this->loadModel('AccHeadList');
        $data = $this->AccHeadList->query("SELECT a.`id` a_id,a.`head_name`, b.`head_name` AS `sub_head_name`, b.id AS b_id FROM acc_head_lists a LEFT JOIN acc_head_lists b ON b.`parent_id` = a.`id` WHERE a.acc_head_type_id=3 AND a.parent_id=0 ORDER BY a.`id`");
        $this->set(compact('data'));
    }

    public function sub_head_name($sub_head_list_id) {
        $this->loadModel('AccHeadList');
        $dailyTransactions = $this->AccHeadList->find('all', array('conditions' => array(
                'AccHeadList.id' => $sub_head_list_id,
                'AccHeadList.has_parent' => 1,
                'AccHeadList.parent_id !=' => 0,
            ),
            'fields' => 'AccHeadList.head_name',
            'order' => 'AccHeadList.id ASC',
            'limit' => 1,
            'recursive' => -1));
        if (count($dailyTransactions) > 0) {
            return $dailyTransactions[0]['AccHeadList']['head_name'];
        } else {
            return '';
        }
    }

    public function admin_cash_in_hand() {
        $this->loadModel('AccHeadList');
        $accHeadLists = $this->AccHeadList->find('all', array('conditions' => array(
                'AccHeadList.acc_head_type_id' => $this->request->data('acc_head_type_id'),
                'AccHeadList.parent_id' => 5,
            ),
            'fields' => 'AccHeadList.head_name,AccHeadList.id',
            'order' => 'AccHeadList.id ASC',
            //'limit' => 1,
            'recursive' => -1));
        $this->set(compact('accHeadLists'));
    }

    public function admin_balance_entry_for_cash_in_account() {
        $this->loadModel('BankAccounts');
        $bankAccounts = $this->BankAccounts->find('all', array('conditions' => array(
                'BankAccounts.status' => 'Active',
            ),
            'fields' => 'BankAccounts.bank_info_id,BankAccounts.branch_id,BankAccounts.account_no,BankAccounts.account_type,BankAccounts.id',
            'order' => 'BankAccounts.id DESC',
            // 'limit' => 1,
            'recursive' => -1));
        $this->set(compact('bankAccounts'));
    }

    public function admin_balance_entry_for_fix_liabilities() {
        $this->loadModel('AccHeadList');
        $this->loadModel('FiscalYear');
        $this->loadModel('Month');
        $this->loadModel('BankInfo');
        // $data = $this->AccHeadList->query("SELECT a.`id`, a.`head_name`, a.`has_parent`, a.`parent_id`, b.`head_name` AS `sub_head_name` FROM acc_head_lists a LEFT JOIN acc_head_lists b ON b.`parent_id` = a.`id` WHERE a.acc_head_type_id=5 AND a.`parent_id`=0 ORDER BY a.`id`");
        $data = $this->AccHeadList->query("SELECT a.`id` a_id,a.`head_name`, b.`head_name` AS `sub_head_name`, b.id AS b_id FROM acc_head_lists a LEFT JOIN acc_head_lists b ON b.`parent_id` = a.`id` WHERE a.acc_head_type_id=5 AND a.parent_id=0 ORDER BY a.`id`");
        $accHeadLists = $this->AccHeadList->find('list', array('fields' => array('AccHeadList.id', 'AccHeadList.head_name'), 'conditions' => array('AccHeadList.status' => 'Active', 'AccHeadList.parent_id' => 48)));
        $fiscalYears = $this->FiscalYear->find('list');
        $bankInfos = $this->BankInfo->find('list');
        $months = $this->Month->find('list');
        $this->set(compact('data', 'fiscalYears', 'months', 'accHeadLists', 'bankInfos'));
    }

    public function admin_balance_entry_for_fund() {
        $this->loadModel('AccHeadList');
        $data = $this->AccHeadList->query("SELECT a.`id` a_id,a.`head_name`, b.`head_name` AS `sub_head_name`, b.id AS b_id FROM acc_head_lists a LEFT JOIN acc_head_lists b ON b.`parent_id` = a.`id` WHERE a.acc_head_type_id=6 AND a.parent_id=0 ORDER BY a.`id`");
        //pr($data);
        $this->set(compact('data'));
    }

    public function admin_balance_entry_for_fix_deposit() {
        $this->loadModel('AccHeadList');
        $this->loadModel('FiscalYear');
        $this->loadModel('Month');
        $this->loadModel('BankInfo');
        $accHeadLists = $this->AccHeadList->find('list', array('fields' => array('AccHeadList.id', 'AccHeadList.head_name'), 'conditions' => array('AccHeadList.status' => 'Active', 'AccHeadList.parent_id' => 10)));
//        $accHeadLists[0]='--------Please Select--------';
//        ksort($accHeadLists);
//                pr($accHeadLists);
        $fiscalYears = $this->FiscalYear->find('list');
        $bankInfos = $this->BankInfo->find('list');
        $months = $this->Month->find('list');
        $this->set(compact('data', 'fiscalYears', 'months', 'accHeadLists', 'bankInfos'));
    }

    public function admin_entry_for_stock_goods() {

    }

    public function admin_get_acc_head_list() {
        $this->loadModel('AccHeadList');
        $accHeadLists = $this->AccHeadList->find('all', array('conditions' => array(
                'AccHeadList.acc_head_type_id' => $this->request->data('acc_head_type_id'),
                'AccHeadList.parent_id' => 0,
            ),
            'fields' => 'AccHeadList.head_name,AccHeadList.id',
            'order' => 'AccHeadList.id ASC',
            //'limit' => 1,
            'recursive' => -1));
        echo json_encode(compact('accHeadLists'));
        $this->autoRender = false;
    }

    public function get_bank_name($bank_info_id) {
        $this->loadModel('BankInfo');
        $bankInfos = $this->BankInfo->find('all', array('conditions' => array(
                'BankInfo.id' => $bank_info_id,
            ),
            'fields' => 'BankInfo.name,BankInfo.id',
            'order' => 'BankInfo.id DESC',
            // 'limit' => 1,
            'recursive' => -1));
        return $bankInfos[0]['BankInfo']['name'];
    }

    public function get_branch_name($branch_id) {
        $this->loadModel('Branch');
        $branchs = $this->Branch->find('all', array('conditions' => array(
                'Branch.id' => $branch_id,
            ),
            'fields' => 'Branch.branch,Branch.id',
            'order' => 'Branch.id DESC',
            // 'limit' => 1,
            'recursive' => -1));
        return $branchs[0]['Branch']['branch'];
    }

    public function get_last_date($fiscal_year_id, $month_id) {
        $fiscal_year_info = $this->FiscalYear->find('first', array('conditions' => array('FiscalYear.id' => $fiscal_year_id), 'recursive' => -1));
        $fiscal_year = $fiscal_year_info['FiscalYear']['name'];

        $year = explode('-', $fiscal_year);
        $year_first_part = $year[0];
        $year_second_part = $year[1];

        if ($month_id >= 1 && $month_id <= 3) {
            $month = $month_id + 6;
            $last_date = $year_first_part . '-0' . $month . '-30';
        } else if ($month_id >= 4 && $month_id <= 6) {
            $month = $month_id + 6;
            $last_date = $year_first_part . '-' . $month . '-30';
        } else if ($month_id >= 7 && $month_id <= 12) {
            $month = $month_id - 6;
            $last_date = $year_second_part . '-0' . $month . '-30';
        }

        return $last_date;
    }

}
