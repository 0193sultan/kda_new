<?php

App::uses('AppController', 'Controller');

/**
 * ContructorAdvancePayments Controller
 *
 * @property ContructorAdvancePayment $ContructorAdvancePayment
 * @property PaginatorComponent $Paginator
 */
class ContructorAdvancePaymentsController extends AppController {

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
        $this->set('page_title', 'Contructor advance payment List');
        $this->ContructorAdvancePayment->recursive = 2;
        $this->paginate = array('order' => array('ContructorAdvancePayment.id' => 'DESC'));
        $this->set('contructorAdvancePayments', $this->paginate());
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Contructor advance payment Details');

        if (!$this->ContructorAdvancePayment->exists($id)) {
            throw new NotFoundException(__('Invalid contructor advance payment'));
        }
        $options = array('conditions' => array('ContructorAdvancePayment.' . $this->ContructorAdvancePayment->primaryKey => $id));
        $this->set('contructorAdvancePayment', $this->ContructorAdvancePayment->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Contructor advance payment');
        if ($this->request->is('post')) {
            $contructorAdvPay = $this->request->data['ContructorAdvancePayment'];
            $contructorAdvancePaymentHas = $this->ContructorAdvancePayment->find('all', array('conditions' => array(
                    'ContructorAdvancePayment.contructor_project_name_id' => $this->request->data['ContructorAdvancePayment']['contructor_project_name_id'],
                    'ContructorAdvancePayment.contructor_name_id' => $this->request->data['ContructorAdvancePayment']['contructor_name_id'],
                    'ContructorAdvancePayment.work_order_id' => $this->request->data['ContructorAdvancePayment']['work_order_id'],
                ),
                'fields' => 'ContructorAdvancePayment.total_advance_paid',
                'order' => 'ContructorAdvancePayment.id DESC',
                'limit' => 1,
                'recursive' => -1));
            if (count($contructorAdvancePaymentHas) > 0) {
                $this->request->data['ContructorAdvancePayment']['total_advance_paid'] = $contructorAdvancePaymentHas[0]['ContructorAdvancePayment']['total_advance_paid'] + $this->request->data['ContructorAdvancePayment']['advance_amount'];
            } else {
                $this->request->data['ContructorAdvancePayment']['total_advance_paid'] = 0;
            }
            $this->ContructorAdvancePayment->create();
            $this->request->data['ContructorAdvancePayment']['created_at'] = $this->current_datetime();
            $this->request->data['ContructorAdvancePayment']['user_id'] = $this->UserAuth->getUserId();
            $this->request->data['ContructorAdvancePayment']['payment_date'] = date("Y-m-d", strtotime($this->request->data['ContructorAdvancePayment']['payment_date']));
            if ($this->ContructorAdvancePayment->save($this->request->data)) {
                $this->Session->setFlash(__('The contructor advance payment has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The contructor advance payment could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $this->loadModel('ContructorProjectName');
            $contructorProjectNames = $this->ContructorProjectName->find('list');
            $this->loadModel('ContructorName');
            $contructorNames = $this->ContructorName->find('list');
            $fiscalYears = $this->ContructorAdvancePayment->FiscalYears->find('list');
            $users = $this->ContructorAdvancePayment->User->find('list');
            $this->set(compact('contructorProjectNames', 'contructorNames', 'fiscalYears', 'users'));
        }
    }

    /**
     * admin_edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_edit($id = null) {
        $this->set('page_title', 'Edit Contructor advance payment');
        $this->ContructorAdvancePayment->id = $id;
        if (!$this->ContructorAdvancePayment->exists($id)) {
            throw new NotFoundException(__('Invalid contructor advance payment'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['ContructorAdvancePayment']['updated_by'] = $this->UserAuth->getUserId();
            $this->request->data['ContructorAdvancePayment']['updated_at'] = $this->current_datetime();
            if ($this->ContructorAdvancePayment->save($this->request->data)) {
                $this->Session->setFlash(__('The contructor advance payment has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The contructor advance payment could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('ContructorAdvancePayment.' . $this->ContructorAdvancePayment->primaryKey => $id));
            $this->request->data = $this->ContructorAdvancePayment->find('first', $options);
            //pr($this->request->data);
            $workOrderId = $this->request->data['ContructorAdvancePayment']['work_order_id'];
        }
        $this->loadModel('ContructorProjectName');
        $contructorProjectNames = $this->ContructorProjectName->find('list');
        $this->loadModel('ContructorName');
        $contructorNames = $this->ContructorName->find('list');
        $fiscalYears = $this->ContructorAdvancePayment->FiscalYears->find('list');
        $users = $this->ContructorAdvancePayment->User->find('list');
        $this->set(compact('contructorProjectNames', 'contructorNames', 'fiscalYears', 'users', 'workOrderId'));
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
        $this->ContructorAdvancePayment->id = $id;
        if (!$this->ContructorAdvancePayment->exists()) {
            throw new NotFoundException(__('Invalid contructor advance payment'));
        }
        if ($this->ContructorAdvancePayment->delete()) {
            $this->Session->setFlash(__('Contructor advance payment deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Contructor advance payment was not deleted'), 'flash/error');
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

    public function admin_get_workorder_id() {
        if ($this->request->is('post')) {
            $work_order_no = $this->ContructorAdvancePayment->find('all', array('conditions' => array(
                    'ContructorAdvancePayment.contructor_project_name_id' => $this->request->data('contructor_project_name_id'),
                    'ContructorAdvancePayment.contructor_name_id' => $this->request->data('contructor_name_id'),
                ),
                'fields' => 'ContructorAdvancePayment.work_order_id',
                'order' => 'ContructorAdvancePayment.id DESC',
                //'limit' => 1,
                'recursive' => -1));

            echo json_encode($work_order_no);
        }
        $this->autoRender = false;
    }

    public function admin_get_workorder_no() {
        if ($this->request->is('post')) {
            $this->loadModel('WorkOrder');
            $work_order_no = $this->WorkOrder->find('all', array('conditions' => array(
                    'WorkOrder.id' => $this->request->data('work_order_id')
                ),
                'fields' => 'WorkOrder.id,WorkOrder.work_order_no',
                'order' => 'WorkOrder.id DESC',
                //'limit' => 1,
                'recursive' => -1));

            echo json_encode($work_order_no);
        }
        $this->autoRender = false;
    }

}
