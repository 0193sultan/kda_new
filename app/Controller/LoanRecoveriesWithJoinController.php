
<?php

App::uses('AppController', 'Controller');

/**
 * LoanRecoveries Controller
 *
 * @property LoanRecovery $LoanRecovery
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class LoanRecoveriesWithJoinController extends AppController {

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
        $this->LoanRecovery->recursive = 3;
        $this->paginate = array('contain' => array('Loan' => array('conditions' => array('Loan.id' => 4))), 'order' => array('LoanRecovery.id' => 'DESC'));

        $this->set('loanRecoveries', $this->paginate());

        #for search dropdown start

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
        $rowcount = $this->LoanRecovery->find('count', array('conditions' => array('LoanRecovery.loan_id' => $employee_loan_id)));

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
        $this->paginate = $this->LoanRecovery->find('all', array('conditions' => array('LoanRecovery.loan_id' => $id), 'limit' => 1));
        $this->set('dta', $this->paginate);

        $arr = $this->recovery_details_by_employeeLoanId($id);

        $this->set(compact('arr'));
    }

    public function recovery_details_by_employeeLoanId($employee_loan_id = null) {
        $rslt = $this->LoanRecovery->find('all', array('conditions' => array('LoanRecovery.loan_id' => $employee_loan_id)));

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

        $this->loadModel('Department');
        $this->loadModel('Designation');
        $this->loadModel('Loan');
        $this->loadModel('LoanType');
        $this->loadModel('Employee');
        $this->loadModel('EmployeeLoan');
        echo '<br><br><br><br><br><br><br><br><br>';
        $this->Employee->recursive = 1;
        $employees = $this->Employee->find('all', array('conditions' => array('Employee.id' => $this->request->data['employee_id'])));
        pr($employees);
        pr($this->request->data);
        $loans= $this->Loan->find('all', array('conditions' => array('Loan.id' => $this->request->data['loan_id'])));
        pr($loans);
        $i = 0;
        foreach ($employees[0]['EmployeeLoan'] as $value) {
            $collect[$i]['employee_name_bengali'] = $employees[0]['Employee']['employee_name_bengali'];
            $collect[$i]['designation_name'] = $employees[0]['Designation']['name'];
            $collect[$i]['department_name'] = $employees[0]['Department']['name'];
            $collect[$i]['department_name'] = $employees[0]['Department']['name'];
            $collect[$i]['department_name'] = $employees[0]['Department']['name'];
            $collect[$i]['department_name'] = $employees[0]['Department']['name'];
            //$department_name= $this->Department->find('list', array('conditions' => array('Department.id' => $this->request->data['department_id'])));
            pr($department_name);
        }

        $data = $this->EmployeeLoan->find('all', array(
            'joins' => array(
                array(
                    'table' => 'Employees',
                    'alias' => 'Employee_tb',
                    'type' => 'INNER',
                    'conditions' => array(
                        'Employee_tb.id = EmployeeLoan.employee_id'
                    )
                )
            ),
            'conditions' => array(
                'EmployeeLoan.employee_id' => $this->request->data('employee_id'),
                'EmployeeLoan.loan_type_id' => $this->request->data('loan_type_id'),
                'EmployeeLoan.loan_id' => $this->request->data('loan_id')
            ),
            'fields' => array('Employee_tb.*', 'EmployeeLoan.*'),
            'order' => 'EmployeeLoan.id DESC'
        ));
        $rowCount = count($data);
        if ($rowCount > 0) {
            $this->set(compact('data'));
        } else {
            $this->redirect(array('action' => 'recovery_search'));
            $this->Session->setFlash(__('No data Exist.'), 'flash/error');
        }
        // pr($data);die();
        //$dprtmnts = $this->Departments->find('list');
        // $dgntons = $this->Designations->find('list');
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

        ###############################################################################
        ###### ##if all are selected then show the same result that contain in index
        ################################################################################
        if (empty($query)) {
            return $this->redirect(['action' => 'index']);
        }


        ####################################################################################
        ######
        ###### this action search in employee_laon and return id and then match with recovery table
        ######
        ####################################################################################

        $this->loadModel('EmployeeLoan');
        $res = $this->EmployeeLoan->find('all', array('conditions' => $query));
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

}
