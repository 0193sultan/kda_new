<?php

App::uses('AppController', 'Controller');

/**
 * ContructorBillPayments Controller
 *
 * @property ContructorBillPayment $ContructorBillPayment
 * @property PaginatorComponent $Paginator
 */
class ContructorBillPaymentsController extends AppController {

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Paginator');

    /**
     * admin_index method
     *
     * @return void
     */
    public function admin_index() {
        $this->set('page_title', 'Contructor bill payment List');
        $this->ContructorBillPayment->recursive = 2;
        $this->paginate = array('order' => array('ContructorBillPayment.id' => 'DESC'));
        $this->set('contructorBillPayments', $this->paginate());
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Contructor bill payment Details');
        if (!$this->ContructorBillPayment->exists($id)) {
            throw new NotFoundException(__('Invalid contructor bill payment'));
        }
        $options = array('conditions' => array('ContructorBillPayment.' . $this->ContructorBillPayment->primaryKey => $id));
        $this->set('contructorBillPayment', $this->ContructorBillPayment->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_check_bill_amount() {
        $this->loadModel('ContructorAdvancePayment');
        $work_order_id = $this->request->data('work_order_id');
        $contructor_project_name_id = $this->request->data('contructor_project_name_id');
        $contructor_name_id = $this->request->data('contructor_name_id');
        $data = $this->ContructorAdvancePayment->query("SELECT  MAX(contructor_advance_payments.total_advance_paid), MAX(contructor_bill_payments.total_advance_adjustment_deducted)
FROM contructor_advance_payments
LEFT JOIN contructor_bill_payments ON contructor_advance_payments.work_order_id = contructor_bill_payments.work_order_id
where contructor_advance_payments.work_order_id=$work_order_id And contructor_advance_payments.contructor_project_name_id=$contructor_project_name_id And contructor_advance_payments.contructor_name_id=$contructor_name_id");
        $valueHas = $data[0][0]['MAX(contructor_advance_payments.total_advance_paid)'] - $data[0][0]['MAX(contructor_bill_payments.total_advance_adjustment_deducted)'];
        $array = array();
        if ($valueHas >= 0) {
            $array = array('total_advance_paid' => $valueHas, 'check' => 1);
        } else {
            $array = array('total_advance_paid' => 0, 'check' => 0);
        }
        //pr($data[0][0]);
        echo json_encode(compact('array'));
        $this->autoRender = false;
    }

    public function admin_advance_adjustment() {

    }

    protected function advance_adjustment_deduct($work_order_id, $contructor_project_name_id, $contructor_name_id, $advance_adjustment) {
        $this->loadModel('ContructorAdvancePayment');
        $securityMoneyHas = $this->ContructorAdvancePayment->find('all', array('conditions' => array(
                'ContructorAdvancePayment.work_order_id' => $work_order_id,
                'ContructorAdvancePayment.contructor_project_name_id' => $contructor_project_name_id,
                'ContructorAdvancePayment.contructor_name_id' => $contructor_name_id,
            ),
            'fields' => 'ContructorAdvancePayment.id,'
            . 'ContructorAdvancePayment.total_advance_paid,',
            'order' => 'ContructorAdvancePayment.id DESC',
            'limit' => 1,
            'recursive' => -1));
        $responseData = $this->ContructorBillPayment->find('all', array('conditions' => array(
                'ContructorBillPayment.work_order_id' => $work_order_id,
                'ContructorBillPayment.contructor_project_name_id' => $contructor_project_name_id,
                'ContructorBillPayment.contructor_name_id' => $contructor_name_id
            ),
            'fields' => 'ContructorBillPayment.id,'
            . 'ContructorBillPayment.advance_adjustment_deduct,',
            'order' => 'ContructorBillPayment.id DESC',
            //'limit' => 1,
            'recursive' => -1));

        if (count($responseData) > 0) {
            $a = $securityMoneyHas[0]['ContructorAdvancePayment']['total_advance_paid'];
            $b = $responseData[0]['ContructorBillPayment']['advance_adjustment_deduct'];
            $c = $advance_adjustment;
            $d = $b + $c;
            if ($a > $b) {
                if ($a >= $d) {
                    return $d;
                } else {
                    return $a - $b;
                }
            } else if ($a == $b) {
                return 0;
            } else {
                return 0;
            }
        } else {
            return $advance_adjustment;
        }
    }

    protected function total_security_money_deducted($work_order_id, $contructor_project_name_id, $contructor_name_id, $security_money) {
        $this->loadModel('ContructorProjectName');
        $securityMoneyHas = $this->ContructorProjectName->find('all', array('conditions' => array(
                'ContructorProjectName.id' => $contructor_project_name_id,
            ),
            'fields' => 'ContructorProjectName.id,'
            . 'ContructorProjectName.security_money,',
            'order' => 'ContructorProjectName.id DESC',
            'limit' => 1,
            'recursive' => -1));
        $responseData = $this->ContructorBillPayment->find('all', array('conditions' => array(
                'ContructorBillPayment.work_order_id' => $work_order_id,
                'ContructorBillPayment.contructor_project_name_id' => $contructor_project_name_id,
                'ContructorBillPayment.contructor_name_id' => $contructor_name_id
            ),
            'fields' => 'ContructorBillPayment.id,'
            . 'ContructorBillPayment.total_security_money_deducted,',
            'order' => 'ContructorBillPayment.id DESC',
            //'limit' => 1,
            'recursive' => -1));

        if (count($responseData) > 0) {
            $a = $securityMoneyHas[0]['ContructorProjectName']['security_money'];
            $b = $responseData[0]['ContructorBillPayment']['total_security_money_deducted'];
            $c = $security_money;
            $d = $b + $c;
            if ($a > $b) {
                if ($a >= $d) {
                    return $d;
                } else {
                    return $a - $b;
                }
            } else if ($a == $b) {
                return 0;
            } else {
                return 0;
            }
        } else {
            return $security_money;
        }
    }

    public function admin_add() {
        $this->set('page_title', 'Add Contructor bill payment');
        if ($this->request->is('post')) {
            pr($this->request->data);
            die();
            $this->ContructorBillPayment->create();
            $this->request->data['ContructorBillPayment']['created_at'] = $this->current_datetime();
            $this->request->data['ContructorBillPayment']['user_id'] = $this->UserAuth->getUserId();
            $this->request->data['ContructorBillPayment']['bill_pay_date'] = date("Y-m-d", strtotime($this->request->data['ContructorBillPayment']['bill_pay_date']));
            $this->request->data['ContructorBillPayment']['vat'] = ($this->request->data['ContructorBillPayment']['bill_amount'] * $this->request->data['ContructorBillPayment']['vat_%']) / 100;
            $this->request->data['ContructorBillPayment']['tax'] = ($this->request->data['ContructorBillPayment']['bill_amount'] * $this->request->data['ContructorBillPayment']['tax_%']) / 100;
            $this->request->data['ContructorBillPayment']['security_money'] = ($this->request->data['ContructorBillPayment']['bill_amount'] * $this->request->data['ContructorBillPayment']['security_money_%']) / 100;
            $contructorBillPayment = $this->request->data['ContructorBillPayment'];
            $this->request->data['ContructorBillPayment']['total_security_money_deducted'] = $this->total_security_money_deducted($contructorBillPayment['work_order_id'], $contructorBillPayment['contructor_project_name_id'], $contructorBillPayment['contructor_name_id'], $contructorBillPayment['security_money']);
            $this->request->data['ContructorBillPayment']['advance_adjustment_deduct'] = $this->advance_adjustment_deduct($contructorBillPayment['work_order_id'], $contructorBillPayment['contructor_project_name_id'], $contructorBillPayment['contructor_name_id'], $contructorBillPayment['advance_adjustment']);
            $this->request->data['ContructorBillPayment']['net_pay'] = $contructorBillPayment['bill_amount'] - ($contructorBillPayment['vat'] + $contructorBillPayment['tax'] + $contructorBillPayment['security_money']);
            if ($this->ContructorBillPayment->save($this->request->data)) {
                $this->Session->setFlash(__('The contructor bill payment has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The contructor bill payment could not be saved. Please, try again.'), 'flash/error');
            }
            $workOrderId = $this->request->data['ContructorAdvancePayment']['work_order_id'];
        }

        $this->loadModel('ContructorProjectName');
        $this->loadModel('BankInfo');
        $contructorProjectNames = $this->ContructorProjectName->find('list');
        $this->loadModel('ContructorName');
        $contructorNames = $this->ContructorName->find('list');
        $this->loadModel('FiscalYear');
        $fiscalYears = $this->FiscalYear->find('list');
        $users = $this->ContructorBillPayment->User->find('list');

        $bankInfos = $this->BankInfo->find('list');
        $this->set(compact('contructorProjectNames', 'contructorNames', 'fiscalYears', 'users', 'workOrderId','bankInfos'));
    }

    /**
     * admin_edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_edit($id = null) {
        $this->set('page_title', 'Edit Contructor bill payment');
        $this->ContructorBillPayment->id = $id;
        if (!$this->ContructorBillPayment->exists($id)) {
            throw new NotFoundException(__('Invalid contructor bill payment'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['ContructorBillPayment']['updated_by'] = $this->UserAuth->getUserId();
            if ($this->ContructorBillPayment->save($this->request->data)) {
                $this->Session->setFlash(__('The contructor bill payment has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The contructor bill payment could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('ContructorBillPayment.' . $this->ContructorBillPayment->primaryKey => $id));
            $this->request->data = $this->ContructorBillPayment->find('first', $options);
        }

        $workOrders = $this->ContructorBillPayment->WorkOrder->find('list');
        $this->loadModel('ContructorProjectName');
        $contructor_project_name = $this->ContructorProjectName->find('list');
        $this->loadModel('ContructorName');
        $contructor_name = $this->ContructorName->find('list');
        $fiscalYears = $this->ContructorBillPayment->FiscalYear->find('list');
        $users = $this->ContructorBillPayment->User->find('list');
        $this->set(compact('workOrders', 'fiscalYears', 'users', 'contructor_project_name', 'contructor_name'));
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

        // echo($id);
        $this->loadModel('ContructorBillPayment');
        $bill_payment = $this->ContructorBillPayment->find('all', array('conditions' => array('ContructorBillPayment.id' => $id)));
        $advance_amount = $bill_payment[0]['ContructorBillPayment']['advance_adjustment'];
        $work_order_id = $bill_payment[0]['ContructorBillPayment']['work_order_id'];

        $this->loadModel('ContructorAdvancePayment');
        $advance_payment = $this->ContructorAdvancePayment->find('all', array('conditions' => array('ContructorAdvancePayment.work_order_id' => $work_order_id)));
        $size = count($advance_payment);
        $index = $size - 1;
        $return_id = $advance_payment[$index]['ContructorAdvancePayment']['id'];
        $recovery_advance_amount = $advance_payment[$index]['ContructorAdvancePayment']['recovery_advance_amount'];

        $deduct = $recovery_advance_amount - $advance_amount;

        $data['id'] = $return_id;
        $data['recovery_advance_amount'] = $deduct;
        $this->ContructorAdvancePayment->save($data);

        // pr($deduct);
        // die();

        $this->ContructorBillPayment->id = $id;
        if (!$this->ContructorBillPayment->exists()) {
            throw new NotFoundException(__('Invalid contructor bill payment'));
        }

        if ($this->ContructorBillPayment->delete()) {
            $this->Session->setFlash(__('Contructor bill payment deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Contructor bill payment was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

    public function admin_get_call() {
        if ($this->request->is('post')) {

            function input($data) {
                $data = trim($data);
                $data = stripslashes($data);
                $data = htmlspecialchars($data);

                return $data;
            }

            $contructor_project_name_id = input($this->request->data['contructor_project_name_id']);
            $contructor_name_id = input($this->request->data['contructor_name_id']);
            // console.log();


            $this->loadModel('WorkOrder');
            $WorkOrder = $this->WorkOrder->find('all', array('conditions' => array('WorkOrder.contructor_project_name_id' => $contructor_project_name_id, 'WorkOrder.contructor_name_id' => $contructor_name_id)));

            echo json_encode($WorkOrder);
        }


        $this->autoRender = false;
    }

    public function check_advance() {
        if ($this->request->is('post')) {

            function input($data) {
                $data = trim($data);
                $data = stripslashes($data);
                $data = htmlspecialchars($data);

                return $data;
            }

            $amount = input($this->request->data['adjust_amount']);
            $work_order_id = input($this->request->data['work_order_id']);
            // pr($work_order_id);
            // die();
            $this->loadModel('ContructorAdvancePayment');

            $advance_payment = $this->ContructorAdvancePayment->find('all', array('conditions' => array('WorkOrder.id' => $work_order_id)));
            // $work_order_array = $this->WorkOrder->find('all',array('conditions' => array('WorkOrder.id' => $work_order_id)));
            $size = count($advance_payment);
            $index = $size - 1;
            $remaining = $advance_payment[$index]['ContructorAdvancePayment']['total_advance_paid'] - $advance_payment[$index]['ContructorAdvancePayment']['recovery_advance_amount'];
            echo json_encode($remaining);
        }


        $this->autoRender = false;
    }

}
