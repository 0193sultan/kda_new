<?php

App::uses('AppController', 'Controller');

/**
 * DailyTransactions Controller
 *
 * @property DailyTransaction $DailyTransaction
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class DailyTransactionsController extends AppController {

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Paginator', 'Session');

    /**
     * admin_index method
     *
     * @return void
     */
    public function admin_index() {
        $this->set('page_title', 'Daily transaction List');
        $this->DailyTransaction->recursive = 0;
        $this->paginate = array('order' => array('DailyTransaction.id' => 'DESC'));
        $this->set('dailyTransactions', $this->paginate());

        $this->loadModel('AccHeadList');
        $main_head_list = $this->AccHeadList->find('list', array(
            'conditions' => array('AccHeadList.parent_id' => 0),
            'fields' => array('AccHeadList.id', 'AccHeadList.head_name'),
            'recursive' => -1
        ));

        $this->loadModel('AccHeadType');
        $head_type_list = $this->AccHeadType->find('list', array(
            'fields' => array('AccHeadType.id', 'AccHeadType.head_type_name'),
            'recursive' => -1
        ));

        $this->set(compact('main_head_list', 'head_type_list'));
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Daily transaction Details');
        if (!$this->DailyTransaction->exists($id)) {
            throw new NotFoundException(__('Invalid daily transaction'));
        }
        $options = array('conditions' => array('DailyTransaction.' . $this->DailyTransaction->primaryKey => $id));
        $this->set('dailyTransaction', $this->DailyTransaction->find('first', $options));

        $this->loadModel('AccHeadList');
        $main_head_list = $this->AccHeadList->find('list', array(
            'conditions' => array('AccHeadList.parent_id' => 0),
            'fields' => array('AccHeadList.id', 'AccHeadList.head_name'),
            'recursive' => -1
        ));

        $this->loadModel('AccHeadType');
        $head_type_list = $this->AccHeadType->find('list', array(
            'fields' => array('AccHeadType.id', 'AccHeadType.head_type_name'),
            'recursive' => -1
        ));

        $this->set(compact('main_head_list', 'head_type_list'));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function save_in_daily_transaction($param, $head) {
        $this->request->data['DailyTransaction']['bank_info_id'] = !empty($param['DailyTransaction']['bank_info_id']) ? $param['DailyTransaction']['bank_info_id'] : 0;
        $this->request->data['DailyTransaction']['branch_id'] = !empty($param['DailyTransaction']['branch_id']) ? $param['DailyTransaction']['branch_id'] : 0;
        $this->request->data['DailyTransaction']['bank_account_id'] = !empty($param['DailyTransaction']['bank_account_id']) ? $param['DailyTransaction']['bank_account_id'] : 0;

        $this->request->data['DailyTransaction']['parent_id'] = $param['DailyTransaction']['acc_head_list_id'];
        $this->request->data['DailyTransaction']['acc_head_list_id'] = $head;
        $this->request->data['DailyTransaction']['transaction_date'] = date("Y-m-d", strtotime($param['DailyTransaction']['transaction_date']));
        $this->request->data['DailyTransaction']['created_at'] = $this->current_datetime();
        $this->request->data['DailyTransaction']['user_id'] = $this->UserAuth->getUserId();
        $this->DailyTransaction->save($this->request->data);
    }

    public function save_in_head_wise_account_balance($param, $head, $daily_transaction_id, $flag) {
        $this->loadModel('HeadWiseAccountBalance');
        $headWiseAccountBalance = $this->HeadWiseAccountBalance->find('all', array('conditions' => array(
                'HeadWiseAccountBalance.acc_head_list_id' => $head,
            ),
            //'fields' => 'HeadWiseAccountBalance.head_name,HeadWiseAccountBalance.id',
            'order' => 'HeadWiseAccountBalance.id DESC',
            'limit' => 1,
            'recursive' => -1));
        $this->request->data['HeadWiseAccountBalance']['daily_transaction_id'] = $daily_transaction_id;
        $this->request->data['HeadWiseAccountBalance']['parent_id'] = $param['DailyTransaction']['parent_id'];
        $this->request->data['HeadWiseAccountBalance']['acc_head_list_id'] = $param['DailyTransaction']['acc_head_list_id'];
        $this->request->data['HeadWiseAccountBalance']['transaction_amount'] = $param['DailyTransaction']['transaction_amount'];
        $this->request->data['HeadWiseAccountBalance']['flag'] = $flag;

        if (count($headWiseAccountBalance) > 0) {
            if ($flag == 'Subtraction') {
                $this->request->data['HeadWiseAccountBalance']['head_balance'] = $headWiseAccountBalance[0]['HeadWiseAccountBalance']['head_balance'] - $param['DailyTransaction']['transaction_amount'];
            } else {
                $this->request->data['HeadWiseAccountBalance']['head_balance'] = $headWiseAccountBalance[0]['HeadWiseAccountBalance']['head_balance'] + $param['DailyTransaction']['transaction_amount'];
            }
            $this->request->data['HeadWiseAccountBalance']['created_at'] = $this->current_datetime();
            $this->HeadWiseAccountBalance->save($this->request->data);
        } else {
            $this->request->data['HeadWiseAccountBalance']['head_balance'] = $param['DailyTransaction']['transaction_amount'];
            $this->request->data['HeadWiseAccountBalance']['created_at'] = $this->current_datetime();
            $this->HeadWiseAccountBalance->save($this->request->data);
        }
    }

    public function save_in_bank_account_balance($param, $daily_transaction_id, $flag = 'Subtraction') {
        $this->loadModel('BankAccountBalance');
        $bankAccountBalance = $this->BankAccountBalance->find('all', array('conditions' => array(
                'BankAccountBalance.bank_info_id' => $param['DailyTransaction']['bank_info_id'],
                'BankAccountBalance.branch_id' => $param['DailyTransaction']['branch_id'],
                'BankAccountBalance.bank_account_id' => $param['DailyTransaction']['bank_account_id']
            ),
            //'fields' => 'HeadWiseAccountBalance.head_name,HeadWiseAccountBalance.id',
            'order' => 'BankAccountBalance.id DESC',
            'limit' => 1,
            'recursive' => -1));
        if (count($bankAccountBalance) > 0) {
            $this->request->data['BankAccountBalance']['daily_transaction_id'] = $daily_transaction_id;
            $this->request->data['BankAccountBalance']['bank_info_id'] = $param['DailyTransaction']['bank_info_id'];
            $this->request->data['BankAccountBalance']['branch_id'] = $param['DailyTransaction']['branch_id'];
            $this->request->data['BankAccountBalance']['bank_account_id'] = $param['DailyTransaction']['bank_account_id'];
            $this->request->data['BankAccountBalance']['transaction_amount'] = $param['DailyTransaction']['transaction_amount'];
            $this->request->data['BankAccountBalance']['flag'] = $flag;
            if ($flag == 'Subtraction') {
                $this->request->data['BankAccountBalance']['account_balance'] = $bankAccountBalance[0]['BankAccountBalance']['account_balance'] - $param['DailyTransaction']['transaction_amount'];
            } else {
                $this->request->data['BankAccountBalance']['account_balance'] = $bankAccountBalance[0]['BankAccountBalance']['account_balance'] + $param['DailyTransaction']['transaction_amount'];
            }
            $this->request->data['BankAccountBalance']['created_at'] = $this->current_datetime();
            $this->BankAccountBalance->save($this->request->data);
        } else {
//            $this->Session->setFlash(__('Opening Balance has no exist in Bank Account Balance. Please, try again.'), 'flash/error');
//            $this->redirect(array('action' => 'index'));
            $this->request->data['BankAccountBalance']['daily_transaction_id'] = $daily_transaction_id;
            $this->request->data['BankAccountBalance']['bank_info_id'] = $param['DailyTransaction']['bank_info_id'];
            $this->request->data['BankAccountBalance']['branch_id'] = $param['DailyTransaction']['branch_id'];
            $this->request->data['BankAccountBalance']['bank_account_id'] = $param['DailyTransaction']['bank_account_id'];
            $this->request->data['BankAccountBalance']['transaction_amount'] = $param['DailyTransaction']['transaction_amount'];
            $this->request->data['BankAccountBalance']['flag'] = $flag;
            $this->request->data['BankAccountBalance']['account_balance'] = $param['DailyTransaction']['transaction_amount'];
            $this->request->data['BankAccountBalance']['created_at'] = $this->current_datetime();
            $this->BankAccountBalance->save($this->request->data);
        }
    }

    public function admin_add() {
        $this->set('page_title', 'Add Daily transaction');
        $this->loadModel('AccHeadType');
        $this->loadModel('IncomeExpenseDetail');
        $this->loadModel('AssetDetail');
        $this->loadModel('TransactionCategory');
        $this->loadModel('TransactionType');
        $this->loadModel('HeadWiseAccountBalance');
        $this->loadModel('BankAccountBalance');
        if ($this->request->is('post')) {
            $dailyTransaction = $this->request->data['DailyTransaction'];
            $head = !empty($this->request->data['DailyTransaction']['sub_head_list_id']) ? $this->request->data['DailyTransaction']['sub_head_list_id'] : $this->request->data['DailyTransaction']['acc_head_list_id'];
            if ($this->request->data['DailyTransaction']['entry_type_id'] == 1 && $this->request->data['DailyTransaction']['acc_head_type_id'] == 3) {
                $this->save_in_daily_transaction($this->request->data, $head);
                $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                $this->save_in_head_wise_account_balance($this->request->data, $head, $daily_transaction_id, $flag = 'Subtraction');
                $this->save_in_bank_account_balance($this->request->data, $daily_transaction_id, $flag = 'Addition');
                $success = 1;
            } else if ($this->request->data['DailyTransaction']['entry_type_id'] == 2 && $this->request->data['DailyTransaction']['acc_head_type_id'] == 3) {
                $this->save_in_daily_transaction($this->request->data, $head);
                $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                $this->save_in_head_wise_account_balance($this->request->data, $head, $daily_transaction_id, $flag = 'Addition');
                $this->save_in_bank_account_balance($this->request->data, $daily_transaction_id, $flag = 'Subtraction');
                $success = 1;
            } else if ($this->request->data['DailyTransaction']['entry_type_id'] == 1 && $this->request->data['DailyTransaction']['acc_head_type_id'] == 4) {
                                pr($this->request->data);
                die();
                $this->request->data['HeadWiseAccountBalance']['parent_id'] = $this->request->data['DailyTransaction']['acc_head_list_id'];
                $this->request->data['HeadWiseAccountBalance']['acc_head_list_id'] = $head;
                $this->request->data['HeadWiseAccountBalance']['transaction_amount'] = $this->request->data['DailyTransaction']['transaction_amount'];

               $this->save_in_daily_transaction($this->request->data, $head);
                $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                $this->save_in_head_wise_account_balance($this->request->data, $head, $daily_transaction_id, $flag = 'Subtraction');
                $this->save_in_bank_account_balance($this->request->data, $daily_transaction_id, $flag = 'Subtraction');
                $success = 1;
            } else if ($this->request->data['DailyTransaction']['entry_type_id'] == 2 && $this->request->data['DailyTransaction']['acc_head_type_id'] == 4) {
                $this->save_in_daily_transaction($this->request->data, $head);
                $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                $this->save_in_head_wise_account_balance($this->request->data, $head, $daily_transaction_id, $flag = 'Addition');
                $this->save_in_bank_account_balance($this->request->data, $daily_transaction_id, $flag = 'Addition');
                $success = 1;
            } else if ($dailyTransaction['entry_type_id'] == 1 && $dailyTransaction['acc_head_type_id'] == 5 || $dailyTransaction['entry_type_id'] == 1 && $dailyTransaction['acc_head_type_id'] == 6) {
                $this->save_in_daily_transaction($this->request->data, $head);
                $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                $this->save_in_head_wise_account_balance($this->request->data, $head, $daily_transaction_id, $flag = 'Addition');
                $this->save_in_bank_account_balance($this->request->data, $daily_transaction_id, $flag = 'Addition');
                $success = 1;
            } else if ($dailyTransaction['entry_type_id'] == 2 && $dailyTransaction['acc_head_type_id'] == 5 || $dailyTransaction['entry_type_id'] == 2 && $dailyTransaction['acc_head_type_id'] == 6) {
                $this->save_in_daily_transaction($this->request->data, $head);
                $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                $this->save_in_head_wise_account_balance($this->request->data, $head, $daily_transaction_id, $flag = 'Subtraction');
                $this->save_in_bank_account_balance($this->request->data, $daily_transaction_id, $flag = 'Subtraction');
                $success = 1;
            } else if ($this->request->data['DailyTransaction']['entry_type_id'] == 2 && $this->request->data['DailyTransaction']['acc_head_type_id'] == 2) {
                pr($this->request->data);
                die();
                $this->save_in_daily_transaction($this->request->data, $head);
                $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                $this->save_in_head_wise_account_balance($this->request->data, $head, $daily_transaction_id, $flag = 'Addition');
                $this->save_in_bank_account_balance($this->request->data, $daily_transaction_id, $flag = 'Subtraction');
                $success = 1;
            } else if ($this->request->data['DailyTransaction']['entry_type_id'] == 1 && $this->request->data['DailyTransaction']['acc_head_type_id'] == 1) {
                $this->save_in_daily_transaction($this->request->data, $head);
                $daily_transaction_id = $this->DailyTransaction->getLastInsertID();
                $this->save_in_head_wise_account_balance($this->request->data, $head, $daily_transaction_id, $flag = 'Addition');
                $this->save_in_bank_account_balance($this->request->data, $daily_transaction_id, $flag = 'Addition');
                $success = 1;
            }
            //pr($this->request->data);die();
            if ($success == 1) {
                $this->Session->setFlash(__('The daily transaction has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The daily transaction could not be saved. Please, try again.'), 'flash/error');
            }
        }
        $accHeadTypes = $this->AccHeadType->find('list', array('fields' => array('AccHeadType.id', 'AccHeadType.head_type_name'), 'conditions' => array('AccHeadType.status' => 'Active')));
        // $accHeadTypes = $this->AccHeadType->find('list', array('fields' => array('AccHeadType.id', 'AccHeadType.head_type_name'), 'conditions' => array('AccHeadType.status' => 'Active')));
        $bankInfos = $this->DailyTransaction->BankInfo->find('list');
        $entryTypes = $this->DailyTransaction->EntryType->find('list');
        $transactionCategories = $this->TransactionCategory->find('list');
        $transactionTypes = $this->TransactionType->find('list');
        //pr($transactionType);
        $fiscalYears = $this->DailyTransaction->FiscalYear->find('list');
        $months = $this->DailyTransaction->Month->find('list');
        $this->set(compact('bankInfos', 'fiscalYears', 'months', 'entryTypes', 'accHeadTypes', 'branches', 'transactionCategories', 'transactionTypes'));
    }

    /**
     * admin_edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_edit($id = null) {

        /* $this->set('page_title', 'Edit Daily transaction');
          $this->loadModel('AccHeadType');
          $this->loadModel('TransactionCategory');
          $this->loadModel('TransactionType');
          $this->DailyTransaction->id = $id;
          if (!$this->DailyTransaction->exists($id)) {
          throw new NotFoundException(__('Invalid daily transaction'));
          }
          if ($this->request->is('post') || $this->request->is('put')) {
          $this->request->data['DailyTransaction']['user_id'] = $this->UserAuth->getUserId();
          $this->request->data['DailyTransaction']['updated_at'] = $this->current_datetime();
          $this->request->data['DailyTransaction']['transaction_date'] = date('Y-m-d', strtotime($this->request->data['DailyTransaction']['transaction_date']));
          $this->request->data['DailyTransaction']['posting_date'] = date('Y-m-d', strtotime($this->request->data['DailyTransaction']['posting_date']));
          if ($this->DailyTransaction->save($this->request->data)) {
          $this->Session->setFlash(__('The daily transaction has been saved'), 'flash/success');
          $this->redirect(array('action' => 'index'));
          } else {
          $this->Session->setFlash(__('The daily transaction could not be saved. Please, try again.'), 'flash/error');
          }
          } else {
          $options = array('conditions' => array('DailyTransaction.' . $this->DailyTransaction->primaryKey => $id));
          $this->request->data = $this->DailyTransaction->find('first', $options);
          $acc_head_list_id= $this->request->data['DailyTransaction']['acc_head_list_id'];
          pr($this->request->data);
          }

          $accHeadTypes = $this->AccHeadType->find('list', array('fields' => array('AccHeadType.id', 'AccHeadType.head_type_name'), 'conditions' => array('AccHeadType.status' => 'Active')));
          // $accHeadTypes = $this->AccHeadType->find('list', array('fields' => array('AccHeadType.id', 'AccHeadType.head_type_name'), 'conditions' => array('AccHeadType.status' => 'Active')));
          $bankInfos = $this->DailyTransaction->BankInfo->find('list');
          $entryTypes = $this->DailyTransaction->EntryType->find('list');
          $transactionCategories = $this->TransactionCategory->find('list');
          $transactionTypes = $this->TransactionType->find('list');
          //pr($transactionType);
          $fiscalYears = $this->DailyTransaction->FiscalYear->find('list');
          $months = $this->DailyTransaction->Month->find('list');
          $this->set(compact('bankInfos', 'fiscalYears', 'months', 'entryTypes', 'accHeadTypes', 'branches', 'transactionCategories', 'transactionTypes','acc_head_list_id')); */



        $this->set('page_title', 'Edit Daily transaction');
        $this->loadModel('AccHeadType');
        $this->loadModel('TransactionCategory');
        $this->loadModel('TransactionType');
        $this->DailyTransaction->id = $id;
        if (!$this->DailyTransaction->exists($id)) {
            throw new NotFoundException(__('Invalid daily transaction'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['DailyTransaction']['user_id'] = $this->UserAuth->getUserId();
            $this->request->data['DailyTransaction']['updated_at'] = $this->current_datetime();
            if ($this->request->data['DailyTransaction']['sub_head_list_id'] != '') {
                $this->request->data['DailyTransaction']['acc_head_list_id'] = $this->request->data['DailyTransaction']['sub_head_list_id'];
            } else {
                $this->request->data['DailyTransaction']['acc_head_list_id'] = $this->request->data['DailyTransaction']['head_list_id'];
            }
            $this->request->data['DailyTransaction']['transaction_date'] = date('Y-m-d', strtotime($this->request->data['DailyTransaction']['transaction_date']));
            if ($this->DailyTransaction->save($this->request->data)) {
                $this->Session->setFlash(__('The daily transaction has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The daily transaction could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('DailyTransaction.' . $this->DailyTransaction->primaryKey => $id));
            $this->request->data = $this->DailyTransaction->find('first', $options);
        }

        $existing_record = $this->DailyTransaction->find('first', array('conditions' => array('DailyTransaction.id' => $id)));

        $transaction_date = date('d-m-Y', strtotime($existing_record['DailyTransaction']['transaction_date']));
        $bank_id = $existing_record['DailyTransaction']['bank_info_id'];
        $branch_id = $existing_record['DailyTransaction']['branch_id'];
        $head_type_id = $existing_record['AccHeadList']['acc_head_type_id'];

        if ($existing_record['AccHeadList']['parent_id'] == 0) {
            $main_head_value = $existing_record['AccHeadList']['id'];
            $sub_head_value = '';
            $sub_head_list = '';
        } else {
            $main_head_value = $existing_record['AccHeadList']['parent_id'];
            $sub_head_value = $existing_record['AccHeadList']['id'];
            $sub_head_list = $this->DailyTransaction->AccHeadList->find('list', array('conditions' => array('AccHeadList.acc_head_type_id' => $head_type_id, 'AccHeadList.parent_id' => $existing_record['AccHeadList']['parent_id'], 'AccHeadList.status' => 'Active'), 'fields' => array('AccHeadList.id', 'AccHeadList.head_name')));
        }

        $main_head_list = $this->DailyTransaction->AccHeadList->find('list', array('conditions' => array('AccHeadList.acc_head_type_id' => $head_type_id, 'AccHeadList.parent_id' => 0, 'AccHeadList.status' => 'Active'), 'fields' => array('AccHeadList.id', 'AccHeadList.head_name')));


        $branches = $this->DailyTransaction->Branch->find('list', array('conditions' => array('Branch.bank_info_id' => $bank_id)));
        $bankAccounts = $this->DailyTransaction->BankAccount->find('list', array('conditions' => array('BankAccount.bank_info_id' => $bank_id, 'BankAccount.branch_id' => $branch_id)));
        $accHeadTypes = $this->AccHeadType->find('list', array('fields' => array('AccHeadType.id', 'AccHeadType.head_type_name'), 'conditions' => array('AccHeadType.status' => 'Active')));
        $bankInfos = $this->DailyTransaction->BankInfo->find('list');
        $entryTypes = $this->DailyTransaction->EntryType->find('list');
        $fiscalYears = $this->DailyTransaction->FiscalYear->find('list');
        $months = $this->DailyTransaction->Month->find('list');
        $transactionCategories = $this->TransactionCategory->find('list');
        $transactionTypes = $this->TransactionType->find('list');
        $this->set(compact('transactionTypes', 'transactionCategories', 'bankInfos', 'fiscalYears', 'months', 'entryTypes', 'accHeadTypes', 'posting_date', 'transaction_date', 'branches', 'bankAccounts', 'head_type_id', 'main_head_list', 'main_head_value', 'sub_head_list', 'sub_head_value'));
    }

    /**
     * admin_delete method
     *
     * @throws NotFoundException
     * @throws MethodNotAllowedException
     * @param string $id
     * @return void
     */
    public function admin_delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->DailyTransaction->id = $id;
        if (!$this->DailyTransaction->exists()) {
            throw new NotFoundException(__('Invalid daily transaction'));
        }
        if ($this->DailyTransaction->delete()) {
            $this->Session->setFlash(__('Daily transaction deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Daily transaction was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

    /* ------------------Ajax----------------- */

    public function admin_get_account_no() {
        $this->loadModel('BankAccount');
        $bank_id = $this->request->data['bank_id'];

        $a['BankAccount'] = array('id' => '', 'name' => '---- Please Select ----');
        $rs = array($a);

        $account_no_list = $this->BankAccount->find('all', array(
            'conditions' => array('BankAccount.bank_info_id' => $bank_id, 'BankAccount.status' => 'Active'),
            'fields' => array('id', 'account_no as name'),
            'recursive' => -1
        ));
        $data_array = array_merge($rs, $account_no_list);

        echo json_encode($data_array);

        $this->autoRender = false;
    }

    public function admin_get_head_list() {
        $this->loadModel('AccHeadList');
        $head_type_id = $this->request->data['head_type_id'];

        $a['AccHeadList'] = array('id' => '', 'name' => '---- Please Select ----');
        $rs = array($a);

        $head_list = $this->AccHeadList->find('all', array(
            'conditions' => array('AccHeadList.acc_head_type_id' => $head_type_id, 'AccHeadList.parent_id' => 0, 'AccHeadList.status' => 'Active'),
            'fields' => array('id', 'head_name as name', 'head_code'),
            'recursive' => -1
        ));
        $data_array = array_merge($rs, $head_list);
        foreach ($data_array as $key => $value) {
            $result[$key]['AccHeadList']['id'] = $value['AccHeadList']['id'];
            $result[$key]['AccHeadList']['name'] = !empty($value['AccHeadList']['head_code']) ? '(' . $value['AccHeadList']['head_code'] . ')' . $value['AccHeadList']['name'] : $value['AccHeadList']['name'];
        }
        echo json_encode($result);

        $this->autoRender = false;
    }

    public function admin_get_sub_head_list() {
        $this->loadModel('AccHeadList');
        $parent_id = $this->request->data['parent_id'];

        $a['AccHeadList'] = array('id' => '', 'name' => '---- Please Select ----');
        $rs = array($a);

        $head_list = $this->AccHeadList->find('all', array(
            'conditions' => array('AccHeadList.parent_id' => $parent_id, 'AccHeadList.status' => 'Active'),
            'fields' => array('id', 'head_name as name'),
            'recursive' => -1
        ));
        $data_array = array_merge($rs, $head_list);
        foreach ($data_array as $key => $value) {
            $result[$key]['AccHeadList']['id'] = $value['AccHeadList']['id'];
            $result[$key]['AccHeadList']['name'] = !empty($value['AccHeadList']['head_code']) ? '(' . $value['AccHeadList']['head_code'] . ')' . $value['AccHeadList']['name'] : $value['AccHeadList']['name'];
        }
        echo json_encode($result);

        $this->autoRender = false;
    }

}
