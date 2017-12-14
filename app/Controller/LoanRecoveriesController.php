<?php

App::uses('AppController', 'Controller');

/**
 * LoanRecoveries Controller
 *
 * @property LoanRecovery $LoanRecovery
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class LoanRecoveriesController extends AppController {

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
        $this->set('page_title', 'Loan recovery List');
        $this->loadModel('Department');
        $this->loadModel('Designation');
        $this->loadModel('Loan');
        $this->loadModel('EmployeeLoan');

        if ($this->request->is('post')) {
            $loan_name_id = $this->request->data['LoanRecoveries']['loan_name_id'];
            $department_name_id = $this->request->data['LoanRecoveries']['department_name_id'];
            $employee_name_id = $this->request->data['LoanRecoveries']['employee_name_id'];

            if ($loan_name_id == '' && $department_name_id == '' && $employee_name_id == '') {
                $employee_loan_info = $this->EmployeeLoan->find('all');
            } else if ($loan_name_id != '' && $department_name_id == '' && $employee_name_id == '') {
                $employee_loan_info = $this->EmployeeLoan->find('all',array(
                        'conditions'=>array('Loan.id'=>$loan_name_id)
                    ));
            } else if ($loan_name_id == '' && $department_name_id != '' && $employee_name_id == '') {
                $employee_loan_info = $this->EmployeeLoan->find('all',array(
                        'conditions'=>array('Employee.department_id'=>$department_name_id)
                    ));
            } else if ($loan_name_id == '' && $department_name_id != '' && $employee_name_id != '') {
                $employee_loan_info = $this->EmployeeLoan->find('all',array(
                        'conditions'=>array('Employee.department_id'=>$department_name_id, 'Employee.id'=>$employee_name_id)
                    ));
            } else if ($loan_name_id != '' && $department_name_id != '' && $employee_name_id == '') {
                $employee_loan_info = $this->EmployeeLoan->find('all',array(
                        'conditions'=>array('Loan.id'=>$loan_name_id, 'Employee.department_id'=>$department_name_id)
                    ));
            } else if ($loan_name_id != '' && $department_name_id != '' && $employee_name_id != '') {
                $employee_loan_info = $this->EmployeeLoan->find('all',array(
                        'conditions'=>array('Loan.id'=>$loan_name_id, 'Employee.department_id'=>$department_name_id, 'Employee.id'=>$employee_name_id)
                    ));
            }

            $designation_list = $this->Designation->find('list');
            $this->set(compact('employee_loan_info', 'designation_list'));
        }

        $loan_list = $this->Loan->find('list');
        $department_list = $this->Department->find('list');

        $this->set(compact('loan_list', 'department_list'));
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Loan recovery Details');
        if (!$this->LoanRecovery->exists($id)) {
            throw new NotFoundException(__('Invalid loan recovery'));
        }
        $options = array('conditions' => array('LoanRecovery.' . $this->LoanRecovery->primaryKey => $id));
        $this->set('loanRecovery', $this->LoanRecovery->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Loan recovery');
        if ($this->request->is('post')) {
            $this->LoanRecovery->create();
            $this->request->data['LoanRecovery']['created_at'] = $this->current_datetime();
            $this->request->data['LoanRecovery']['created_by'] = $this->UserAuth->getUserId();
            if ($this->LoanRecovery->save($this->request->data)) {
                $this->Session->setFlash(__('The loan recovery has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The loan recovery could not be saved. Please, try again.'), 'flash/error');
            }
        }
        $months = $this->LoanRecovery->Month->find('list');
        $employeeLoans = $this->LoanRecovery->EmployeeLoan->find('list');
        $this->set(compact('months', 'employeeLoans'));
    }

    /**
     * admin_edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_edit($id = null) {
        $this->set('page_title', 'Edit Loan recovery');
        $this->LoanRecovery->id = $id;
        if (!$this->LoanRecovery->exists($id)) {
            throw new NotFoundException(__('Invalid loan recovery'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['LoanRecovery']['updated_by'] = $this->UserAuth->getUserId();
            if ($this->LoanRecovery->save($this->request->data)) {
                $this->Session->setFlash(__('The loan recovery has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The loan recovery could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('LoanRecovery.' . $this->LoanRecovery->primaryKey => $id));
            $this->request->data = $this->LoanRecovery->find('first', $options);
        }
        $months = $this->LoanRecovery->Month->find('list');
        $employeeLoans = $this->LoanRecovery->EmployeeLoan->find('list');
        $this->set(compact('months', 'employeeLoans'));
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
        $this->LoanRecovery->id = $id;
        if (!$this->LoanRecovery->exists()) {
            throw new NotFoundException(__('Invalid loan recovery'));
        }
        if ($this->LoanRecovery->delete()) {
            $this->Session->setFlash(__('Loan recovery deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Loan recovery was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

    public function loan_recovery_insert($month_id = null, $employee_loan_id = null) {
        echo "working......<br/>";
        //exit();
        $this->LoanRecovery->create();

        $this->LoanRecovery->save(
                array(
                    'month_id' => $month_id,
                    'loan_id' => $employee_loan_id
                )
        );
    }

    public function ttl_recovery_by_employeeLoanId($employee_loan_id = null) {
        $rowcount = $this->LoanRecovery->find('count', array('conditions' => array('LoanRecovery.employee_loan_id' => $employee_loan_id)));

        return $rowcount;
    }

    public function ttl_instlmnt_qty_loanAmount_installmentAmount($employee_loan_id = null) {
        $this->loadModel('EmployeeLoan');
        $res = $this->EmployeeLoan->find('all', array('fields' => array('loan_amount', 'number_of_installment', 'installment_amount'), 'conditions' => array('EmployeeLoan.id' => $employee_loan_id)));
        return $res;
    }

    public function admin_loan_recovery_details($id = null) {
        $this->set('page_title', 'Loan recovery history');
        $this->LoanRecovery->recursive = 2;
        $this->paginate = $this->LoanRecovery->find('all', array('conditions' => array('LoanRecovery.employee_loan_id' => $id), 'limit' => 1));
        $this->set('dta', $this->paginate);

        $arr = $this->recovery_details_by_employeeLoanId($id);

        $this->set(compact('arr'));
    }

    public function recovery_details_by_employeeLoanId($employee_loan_id = null) {
        $rslt = $this->LoanRecovery->find('all', array('conditions' => array('LoanRecovery.employee_loan_id' => $employee_loan_id)));

        return $rslt;
    }

    public function admin_get_lName_lType_eName() {
        $department = $this->request->data('department_id');
        $designation = $this->request->data('designation_id');

        $this->loadModel('Employee');

        $rslt = $this->Employee->find('all', array('conditions' => array('Employee.department_id' => $department, 'Employee.designation_id' => $designation)));
        echo "<option value=0>All</option>";
        foreach ($rslt as $value) {
            echo "<option value=" . $value['Employee']['id'] . ">" . $value['Employee']['name'] . "</option>";
        }
        $this->autoRender = false;
    }

    public function admin_recovery_search() {
        #for search dropdown start
        //pr($this->request->data);die();
        $this->loadModel('Departments');
        $this->loadModel('Designations');
        $this->loadModel('Loan');
        $this->loadModel('LoanType');
        $this->loadModel('Employee');

        $dprtmnts = $this->Departments->find('list');
        $dgntons = $this->Designations->find('list');
        $ln = $this->Loan->find('list');
        $lntype = $this->LoanType->find('list');
        $emp = $this->Employee->find('list');

        $this->set(compact('dprtmnts', 'dgntons', 'ln', 'lntype', 'emp'));

        #for search dropdown End

        $dName = $this->request->data('department_id');
        $dgnton = $this->request->data('designation_id');
        $loan_id = $this->request->data('loan_id');
        $loan_type_id = $this->request->data('loan_type_id');
        $employee_id = $this->request->data('employee_id');


        $query = array(); #GLOBAL VARIABLE DECLARE

        if ($dName != 0) {
            $query['Employee.department_id'] = $dName;
        }
        if ($dgnton != 0) {
            $query['Employee.designation_id'] = $dgnton;
        }
        if ($loan_id != 0) {
            $query['EmployeeLoan.loan_id'] = $loan_id;
        }
        if ($loan_type_id != 0) {
            $query['EmployeeLoan.loan_type_id'] = $loan_type_id;
        }
        if ($employee_id != 0) {
            $query['EmployeeLoan.employee_id'] = $employee_id;
        }
        ###### ##if all are selected then show the same result that contain in index

        if (empty($query)) {
            return $this->redirect(['action' => 'index']);
        }


        ###### this action search in employee_laon and return id and then match with recovery table


        $this->loadModel('EmployeeLoan');
        $res = $this->EmployeeLoan->find('all', array('conditions' => $query));
        pr($res);die();
        $this->set(compact('res'));

        /* pr($res); exit(); */
        /*
          foreach ($res as  $value)
          {
          $id = $value['EmployeeLoan']['id'];

          $rcvry_qnqty = $this->ttl_recovery_by_employeeLoanId($id);

          //echo $rcvry_qnqty."<br/>";
          pr($rcvry_qnqty);

          }
          exit(); */
    }


    /*------------------Ajax-----------------*/

    public function admin_get_employee_name_list() {
        $this->loadModel('Employee');
        $department_name_id = $this->request->data['department_name_id'];

        $a['Employee'] = array('id' => '', 'name' => 'All');
        $rs = array($a);

        $employee_name_list = $this->Employee->find('all', array(
                'conditions' => array('Employee.department_id' => $department_name_id),
                'fields' => array('id','employee_name_bengali as name'),
                'recursive'=>-1    
        ));
        $data_array = array_merge($rs,$employee_name_list);

        echo json_encode($data_array);

        $this->autoRender = false;
    }

}
