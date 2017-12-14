<?php

App::uses('AppController', 'Controller');

/**
 * SecurityDepositeReturns Controller
 *
 * @property SecurityDepositeReturn $SecurityDepositeReturn
 * @property PaginatorComponent $Paginator
 */
class SecurityDepositeReturnsController extends AppController {

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
        if ($this->request->is('post')) {
            // pr($this->request->data);
            // die();
            $all = $this->request->data;
            $project_name_id = $all['SecurityReturn']['contructor_project_name_id'];
            $contructor_name_id = $all['SecurityReturn']['contructor_name_id'];
            $work_order_no = $all['work_order_no_1'];
            // pr($project_name_id);
            // die();
            $this->loadModel('WorkOrder');
            $this->loadModel('ContructorBillPayment');
            $this->loadModel('ContructorAdvancePayment');
            $this->loadModel('SecurityDepositeReturn');

            $work_order_array = $this->WorkOrder->find('all', array('conditions' => array('WorkOrder.contructor_project_name_id' => $project_name_id, 'WorkOrder.contructor_name_id' => $contructor_name_id, 'WorkOrder.work_order_no' => $work_order_no)));
            $w_id = $work_order_array[0]['WorkOrder']['id'];

            $security_return = $this->SecurityDepositeReturn->find('all', array('conditions' => array('SecurityDepositeReturn.work_order_no' => $work_order_no)));

            $advance_payment_array = $this->ContructorAdvancePayment->find('all', array('conditions' => array('ContructorAdvancePayment.work_order_id' => $w_id)));

            $bill_payment_array = $this->ContructorBillPayment->find('all', array('conditions' => array('ContructorBillPayment.work_order_id' => $w_id)));

            // pr($bill_payment_array);
            // die();
            $this->set(compact('security_return', 'advance_payment_array', 'bill_payment_array', 'work_order_array'));
        }

        // $this->set(compact('security_return'));
        $this->set('page_title', 'Security deposite return List');
        $this->SecurityDepositeReturn->recursive = 2;
        $this->paginate = array('order' => array('SecurityDepositeReturn.id' => 'DESC'));
        $this->loadModel('ContructorProjectName');
        $contructor_project_name = $this->ContructorProjectName->find('list');
        $this->loadModel('ContructorName');
        $contructor_name = $this->ContructorName->find('list');

        $this->set(compact('contructor_project_name', 'contructor_name'));
        $this->set('securityDepositeReturns', $this->paginate());
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Security deposite return Details');
        if (!$this->SecurityDepositeReturn->exists($id)) {
            throw new NotFoundException(__('Invalid security deposite return'));
        }
        $options = array('conditions' => array('SecurityDepositeReturn.' . $this->SecurityDepositeReturn->primaryKey => $id));
        $this->set('securityDepositeReturn', $this->SecurityDepositeReturn->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Security deposite return');
        if ($this->request->is('post')) {
            pr($this->request->data);die();
            $this->SecurityDepositeReturn->create();
            $this->request->data['SecurityDepositeReturn']['created_at'] = $this->current_datetime();
            $this->request->data['SecurityDepositeReturn']['user_id'] = $this->UserAuth->getUserId();
            $this->request->data['SecurityDepositeReturn']['payment_date'] = date("Y-m-d", strtotime($this->request->data['SecurityDepositeReturn']['payment_date']));
            $this->request->data['SecurityDepositeReturn']['work_order_no'] = $this->request->data['work_order_no_1'];
            $this->request->data['SecurityDepositeReturn']['work_order_id'] = $this->request->data['work_order_id_1'];
            
            if ($this->SecurityDepositeReturn->save($this->request->data)) {
                $work_order_id = $this->request->data['SecurityDepositeReturn']['work_order_id'];
                $security_payment_array = $this->SecurityDepositeReturn->find('all', array('conditions' => array('SecurityDepositeReturn.work_order_id' => $work_order_id)));
                $total_security_money_paid = 0;
                foreach ($security_payment_array as $s_payment) {
                    $total_security_money_paid += $s_payment['SecurityDepositeReturn']['security_return_amount'];
                }
                $lastid = $this->SecurityDepositeReturn->getLastInsertId();
                $data['id'] = $lastid;
                $data['total_security_money_paid'] = $total_security_money_paid;
                $this->SecurityDepositeReturn->save($data);
                $this->Session->setFlash(__('The security deposite return has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The security deposite return could not be saved. Please, try again.'), 'flash/error');
            }
        }
       // $workOrders = $this->SecurityDepositeReturn->WorkOrder->find('list');
        $this->loadModel('ContructorProjectName');
        $contructor_project_name = $this->ContructorProjectName->find('list');
        $this->loadModel('ContructorName');
        $contructor_name = $this->ContructorName->find('list');
        $fiscalYears = $this->SecurityDepositeReturn->FiscalYear->find('list');
        $this->set(compact('workOrders', 'contructor_project_name', 'contructor_name', 'fiscalYears', 'users'));
    }

    /**
     * admin_edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_edit($id = null) {
        $this->set('page_title', 'Edit Security deposite return');
        $this->SecurityDepositeReturn->id = $id;
        if (!$this->SecurityDepositeReturn->exists($id)) {
            throw new NotFoundException(__('Invalid security deposite return'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['SecurityDepositeReturn']['updated_by'] = $this->UserAuth->getUserId();
            if ($this->SecurityDepositeReturn->save($this->request->data)) {
                $this->Session->setFlash(__('The security deposite return has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The security deposite return could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('SecurityDepositeReturn.' . $this->SecurityDepositeReturn->primaryKey => $id));
            $this->request->data = $this->SecurityDepositeReturn->find('first', $options);
        }
        $workOrders = $this->SecurityDepositeReturn->WorkOrder->find('list');
        $fiscalYears = $this->SecurityDepositeReturn->FiscalYear->find('list');
        $users = $this->SecurityDepositeReturn->User->find('list');
        $this->set(compact('workOrders', 'fiscalYears', 'users'));
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
        $this->SecurityDepositeReturn->id = $id;
        if (!$this->SecurityDepositeReturn->exists()) {
            throw new NotFoundException(__('Invalid security deposite return'));
        }
        if ($this->SecurityDepositeReturn->delete()) {
            $this->Session->setFlash(__('Security deposite return deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Security deposite return was not deleted'), 'flash/error');
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
            $this->loadModel('WorkOrder');
            $WorkOrder = $this->WorkOrder->find('all', array('conditions' => array('WorkOrder.contructor_project_name_id' => $contructor_project_name_id, 'WorkOrder.contructor_name_id' => $contructor_name_id)));

            echo json_encode($WorkOrder);
        }


        $this->autoRender = false;
    }

    public function check_amount() {
        if ($this->request->is('post')) {

            function input($data) {
                $data = trim($data);
                $data = stripslashes($data);
                $data = htmlspecialchars($data);

                return $data;
            }

            $amount = input($this->request->data['security_input']);
            $work_order_id = input($this->request->data['work_order_id']);
            // pr($amount);
            // $contructor_project_name_id = input($this->request->data['contructor_project_name_id']);
            // $contructor_name_id = input($this->request->data['contructor_name_id']);


            $this->loadModel('SecurityDepositeReturn');
            $this->loadModel('ContructorBillPayment');

            // $security_payment = $this->SecurityDepositeReturn->find('first',array('order'=>'id desc','recursive'=>-1));
            // $bill_payment_array = $this->ContructorBillPayment->find('first',array('conditions' => array('ContructorBillPayment.work_order_id' => $work_order_id),'order'=>'id desc','recursive'=>-1));

            $security_payment = $this->SecurityDepositeReturn->find('all', array('conditions' => array('SecurityDepositeReturn.work_order_id' => $work_order_id)));



            $sec_size = count($security_payment);
            $sec_index = $sec_size - 1;

            $send_sec = $security_payment[$sec_index];

            $bill_payment_array = $this->ContructorBillPayment->find('all', array('conditions' => array('ContructorBillPayment.work_order_id' => $work_order_id)));

            $bill_size = count($bill_payment_array);
            $bill_index = $bill_size - 1;

            $send_bill = $bill_payment_array[$bill_index];

            $main_data = array($send_sec, $send_bill);
            // pr($advance_payment);
            echo json_encode($main_data);
        }


        $this->autoRender = false;
    }

}
