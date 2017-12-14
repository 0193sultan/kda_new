<?php

App::uses('AppController', 'Controller');

/**
 * BankAccounts Controller
 *
 * @property BankAccount $BankAccount
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class BankAccountsController extends AppController {

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
        $this->set('page_title', 'Bank account List');
        $this->BankAccount->recursive = 0;
        $this->paginate = array('order' => array('BankAccount.id' => 'DESC'));
        $this->set('bankAccounts', $this->paginate());
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Bank account Details');
        if (!$this->BankAccount->exists($id)) {
            throw new NotFoundException(__('Invalid bank account'));
        }
        $options = array('conditions' => array('BankAccount.' . $this->BankAccount->primaryKey => $id));
        $this->set('bankAccount', $this->BankAccount->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Bank account');
        if ($this->request->is('post')) {
            $this->BankAccount->create();
            $this->request->data['BankAccount']['created_at'] = $this->current_datetime();
            $this->request->data['BankAccount']['user_id'] = $this->UserAuth->getUserId();
            if ($this->BankAccount->save($this->request->data)) {
                $this->Session->setFlash(__('The bank account has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The bank account could not be saved. Please, try again.'), 'flash/error');
            }
        }
        $bankInfos = $this->BankAccount->BankInfo->find('list');
        $this->set(compact('bankInfos'));
    }

    /**
     * admin_edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_edit($id = null) {
        $this->set('page_title', 'Edit Bank account');
        $this->BankAccount->id = $id;
        if (!$this->BankAccount->exists($id)) {
            throw new NotFoundException(__('Invalid bank account'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['BankAccount']['user_id'] = $this->UserAuth->getUserId();
            $this->request->data['BankAccount']['updated_at'] = $this->current_datetime();
            if ($this->BankAccount->save($this->request->data)) {
                $this->Session->setFlash(__('The bank account has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The bank account could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('BankAccount.' . $this->BankAccount->primaryKey => $id));
            $this->request->data = $this->BankAccount->find('first', $options);
        }

        $bank_id_arr = $this->BankAccount->find('first', array('conditions' => array('BankAccount.id' => $id), 'recursive' => -1));
        $bank_info_id = $bank_id_arr['BankAccount']['bank_info_id'];

        $bankInfos = $this->BankAccount->BankInfo->find('list');
        $branches = $this->BankAccount->Branch->find('list', array('conditions' => array('Branch.bank_info_id' => $bank_info_id)));
        $this->set(compact('bankInfos', 'branches'));
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
        $this->BankAccount->id = $id;
        if (!$this->BankAccount->exists()) {
            throw new NotFoundException(__('Invalid bank account'));
        }
        if ($this->BankAccount->delete()) {
            $this->Session->setFlash(__('Bank account deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Bank account was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

    /* ------------------Ajax----------------- */

    public function admin_get_branch_list() {
        $this->loadModel('Branch');
        $bank_id = $this->request->data['bank_id'];

        $a['Branch'] = array('id' => '', 'name' => '---- Please Select ----');
        $rs = array($a);

        $branch_list = $this->Branch->find('all', array(
            'conditions' => array('Branch.bank_info_id' => $bank_id),
            'fields' => array('id', 'branch as name'),
            'recursive' => -1
        ));
        $data_array = array_merge($rs, $branch_list);

        echo json_encode($data_array);

        $this->autoRender = false;
    }

}
