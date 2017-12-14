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
        $this->set('page_title','Security deposit return List');
        if ($this->request->is('post'))
        {
            $this->loadModel('ContructorBillPayment');
            $this->loadModel('ContructorProjectName');
            $project_name = $this->request->data['SecurityDepositeReturn']['project_name'];
            $contructor_project_name_id = $this->request->data['SecurityDepositeReturn']['contructor_project_name_id'];
            $contructor = $this->request->data['SecurityDepositeReturn']['contructor'];
            $contructor_name_id = $this->request->data['SecurityDepositeReturn']['contructor_name_id'];
            $work_order_id = $this->request->data['SecurityDepositeReturn']['work_order_id'];
            $this->SecurityDepositeReturn->recursive = 0;
            $securityDepositeReturns = $this->SecurityDepositeReturn->find('all',array('conditions'=>array('SecurityDepositeReturn.work_order_id'=>$work_order_id)));

            $total_security_money_info = $this->ContructorBillPayment->find('first', array(
                    'conditions'=>array('ContructorBillPayment.work_order_id'=>$work_order_id),
                    'order'=>'ContructorBillPayment.id DESC',
                    'recursive'=>-1
                ));
            $total_security_money = $total_security_money_info['ContructorBillPayment']['total_security_money_deducted'];

            $project_value_info = $this->ContructorProjectName->find('first', array(
                    'conditions'=>array('ContructorProjectName.id'=>$contructor_project_name_id),
                    'recursive'=>-1
                ));
            $project_value = $project_value_info['ContructorProjectName']['project_value'];

            $this->set(compact('securityDepositeReturns', 'project_name', 'contructor', 'total_security_money', 'project_value'));
        }

        $this->loadModel('ContructorProjectName');
        $contructorProjectNames = $this->ContructorProjectName->find('list');
        $this->set(compact('contructorProjectNames'));
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
    public function admin_add()
    {
        $this->set('page_title', 'Add Security deposite return');
        if ($this->request->is('post'))
        {
            $this->loadModel('ContructorBillPayment');

            $total_security_money_info = $this->ContructorBillPayment->find('first', array(
                    'conditions'=>array('ContructorBillPayment.work_order_id'=>$this->request->data['SecurityDepositeReturn']['work_order_id']),
                    'order'=>'ContructorBillPayment.id DESC',
                    'recursive'=>-1
                ));

            $total_security_money = $total_security_money_info['ContructorBillPayment']['total_security_money_deducted'];


            $total_security_money_paid_info = $this->SecurityDepositeReturn->find('first', array(
                    'conditions'=>array('SecurityDepositeReturn.work_order_id'=>$this->request->data['SecurityDepositeReturn']['work_order_id']),
                    'order'=>'SecurityDepositeReturn.id DESC',
                    'recursive'=>-1
                ));

            $previous_total_security_money_paid = $total_security_money_paid_info['SecurityDepositeReturn']['total_security_money_paid'];
            $current_total_security_money_paid = $previous_total_security_money_paid+$this->request->data['SecurityDepositeReturn']['security_return_amount'];

            if ($current_total_security_money_paid>$total_security_money)
            {
                $this->Session->setFlash(__('Total security deposit paid amount not more than total security deposit!'), 'flash/error');
            }
            else
            {
                $this->SecurityDepositeReturn->create();
                $this->request->data['SecurityDepositeReturn']['created_at'] = $this->current_datetime();
                $this->request->data['SecurityDepositeReturn']['user_id'] = $this->UserAuth->getUserId();
                $this->request->data['SecurityDepositeReturn']['payment_date'] = date("Y-m-d", strtotime($this->request->data['SecurityDepositeReturn']['payment_date']));
                $this->request->data['SecurityDepositeReturn']['total_security_money_paid'] = $current_total_security_money_paid;
                
                if ($this->SecurityDepositeReturn->save($this->request->data))
                {
                    $this->Session->setFlash(__('The security deposit return has been saved'), 'flash/success');
                    $this->redirect(array('action' => 'index'));
                }
                else
                {
                    $this->Session->setFlash(__('The security deposit return could not be saved. Please, try again.'), 'flash/error');
                }
            }
        }
        $this->loadModel('ContructorProjectName');
        $contructorProjectNames = $this->ContructorProjectName->find('list');
        $fiscalYears = $this->SecurityDepositeReturn->FiscalYear->find('list');
        $this->set(compact('contructorProjectNames', 'fiscalYears'));
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



    /*---------------------------------Ajax------------------------------*/

    public function admin_get_contructor_name_list()
    {
        $this->loadModel('WorkOrder');
        $contructor_project_name_id = $this->request->data['contructor_project_name_id'];

        $a['WorkOrder'] = array('id' => '');
        $a['ContructorName'] = array('name' => '---- Please Select ----');
        $rs = array($a);

        $contructor_name_list = $this->WorkOrder->find('all', array(
                'conditions' => array('WorkOrder.contructor_project_name_id' => $contructor_project_name_id),
                'fields' => array('WorkOrder.contructor_name_id as id','ContructorName.name'),
                'group' => array('WorkOrder.contructor_name_id')
        ));

        $data_array = array_merge($rs,$contructor_name_list);

        echo json_encode($data_array);

        $this->autoRender = false;

    }

    public function admin_get_work_order_no_list()
    {
        $this->loadModel('WorkOrder');
        $contructor_project_name_id = $this->request->data['contructor_project_name_id'];
        $contructor_name_id = $this->request->data['contructor_name_id'];

        $a['WorkOrder'] = array('id' => '','name' => '---- Please Select ----');
        $rs = array($a);

        $work_order_no_list = $this->WorkOrder->find('all', array(
                'conditions' => array(
                    'WorkOrder.contructor_project_name_id' => $contructor_project_name_id,
                    'WorkOrder.contructor_name_id' => $contructor_name_id
                    ),
                'fields' => array('WorkOrder.id','WorkOrder.work_order_no as name')
        ));

        $data_array = array_merge($rs,$work_order_no_list);

        echo json_encode($data_array);

        $this->autoRender = false;

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
