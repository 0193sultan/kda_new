<?php

App::uses('AppController', 'Controller');

/**
 * EmployeeLoans Controller
 *
 * @property EmployeeLoan $EmployeeLoan
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class EmployeeLoansController extends AppController {

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
        $this->set('page_title', 'Employee loan List');
        $this->EmployeeLoan->recursive = 2;
        $this->paginate = array('order' => array('EmployeeLoan.id' => 'DESC'));
        $this->set('employeeLoans', $this->paginate());

        $this->loadModel('Department');
        $department = $this->Department->find('list');

        $this->loadModel('Loan');
        $loan = $this->Loan->find('list');

        $this->set(compact('department', 'loan'));
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Employee loan Details');
        if (!$this->EmployeeLoan->exists($id)) {
            throw new NotFoundException(__('Invalid employee loan'));
        }
        $options = array('conditions' => array('EmployeeLoan.' . $this->EmployeeLoan->primaryKey => $id));
        $this->set('employeeLoan', $this->EmployeeLoan->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Employee loan');
        if ($this->request->is('post')) {
           // pr($this->request->data); die();
            $this->EmployeeLoan->create();
            $this->request->data['EmployeeLoan']['created_at'] = $this->current_datetime();
            $this->request->data['EmployeeLoan']['created_by'] = $this->UserAuth->getUserId();

            ###################################################################################
            ######Custom date add by arafat
            ####################################################################################
            $this->request->data['EmployeeLoan']['loan_apply_date'] = date("Y-m-d", strtotime($this->request->data['EmployeeLoan']['loan_apply_date']));

            $this->request->data['EmployeeLoan']['loan_approved_date'] = date("Y-m-d", strtotime($this->request->data['EmployeeLoan']['loan_approved_date']));
            $this->request->data['EmployeeLoan']['first_installment_date'] = date("Y-m-d", strtotime($this->request->data['EmployeeLoan']['first_installment_date']));
            ###################################################################################
            ######Custom date adding end by arafat
            ###################################################################################
            ###################################################################################
            ########  current due, interest ammount, total pay calculation ---> start
            ###################################################################################

            $day = substr($this->request->data['EmployeeLoan']['loan_approved_date'], -2);
            if ($this->request->data['EmployeeLoan']['current_due'] == 0 && $this->request->data['EmployeeLoan']['status']==0) {
                $this->request->data['EmployeeLoan']['current_due'] = $this->request->data['EmployeeLoan']['current_due'];
            } else {
                $this->request->data['EmployeeLoan']['current_due'] = $this->request->data['EmployeeLoan']['loan_amount'];
            }
            $interest_rate_arr = $this->__interest_rate($this->request->data['EmployeeLoan']['loan_type_id']);
            $interest_rt = $interest_rate_arr[0]['LoanType']['interest_rate'];


            if ($day == '01') {
                $interest_amount = round(($this->request->data['EmployeeLoan']['loan_amount'] * ($this->request->data['EmployeeLoan']['number_of_installment'] + 1 ) * $interest_rt) / 2400, 2);
            } else {
                $interest_amount = ($this->request->data['EmployeeLoan']['loan_amount'] * ($this->request->data['EmployeeLoan']['number_of_installment'] + 1 ) * $interest_rt) / 2400;

                $oneDayInterest = ( $this->request->data['EmployeeLoan']['number_of_installment'] * 31 ) / $interest_amount;

                $extra_day_interest = $oneDayInterest * $day;

                $interest_amount = round($interest_amount + $extra_day_interest, 2);
            }

            $this->request->data['EmployeeLoan']['interest_amount'] = $interest_amount;
            $this->request->data['EmployeeLoan']['total_payable'] = $interest_amount + $this->request->data['EmployeeLoan']['loan_amount'];

            ###################################################################################
            ########  current due interest ammount total pay calculation end
            ###################################################################################


            if ($this->EmployeeLoan->save($this->request->data)) {
                $this->Session->setFlash(__('The employee loan has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The employee loan could not be saved. Please, try again.'), 'flash/error');
            }
        }
        $employees = $this->EmployeeLoan->Employee->find('list');
        // pr($employees);
        $loanTypes = $this->EmployeeLoan->LoanType->find('list');
        // $loans = $this->EmployeeLoan->Loan->find('list');

        $this->loadModel('Department');
        $department = $this->Department->find('list');

        $this->loadModel('Designation');
        $designation = $this->Designation->find('list');

        $this->loadModel('Month');
        $Month = $this->Month->find('list');
        $this->loadModel('Loan');
        $Loan = $this->Loan->find('list');
        //pr($Loan);
        $this->loadModel('FiscalYear');
        $FiscalYear = $this->FiscalYear->find('list');



        $this->set(compact('employees', 'loanTypes', 'department', 'designation', 'Month', 'FiscalYear','Loan'));
    }

    /**
     * admin_edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_edit($id = null) {
        $this->set('page_title', 'Edit Employee loan');
        $this->EmployeeLoan->id = $id;
        if (!$this->EmployeeLoan->exists($id)) {
            throw new NotFoundException(__('Invalid employee loan'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['EmployeeLoan']['updated_by'] = $this->UserAuth->getUserId();
            $this->request->data['EmployeeLoan']['loan_apply_date'] = date("Y-m-d", strtotime($this->request->data['EmployeeLoan']['loan_apply_date'])); #add by arafat
            $this->request->data['EmployeeLoan']['loan_approved_date'] = date("Y-m-d", strtotime($this->request->data['EmployeeLoan']['loan_approved_date'])); #add by arafat
            /*if ($this->request->data['EmployeeLoan']['current_due'] > 0) {
                $this->request->data['EmployeeLoan']['current_due'] = $this->request->data['EmployeeLoan']['current_due'];
            } else {
                $this->request->data['EmployeeLoan']['current_due'] = $this->request->data['EmployeeLoan']['loan_amount'];
            }*/

            if ($this->EmployeeLoan->save($this->request->data)) {
                $this->Session->setFlash(__('The employee loan has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The employee loan could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('EmployeeLoan.' . $this->EmployeeLoan->primaryKey => $id));
            $this->request->data = $this->EmployeeLoan->find('first', $options);
        }
        $employees = $this->EmployeeLoan->Employee->find('list');
        $loanTypes = $this->EmployeeLoan->LoanType->find('list');
        $loans = $this->EmployeeLoan->Loan->find('list');

        $this->loadModel('Department');
        $department = $this->Department->find('list');

        $this->loadModel('Designation');
        $designation = $this->Designation->find('list');

        $this->loadModel('Month');
        $Month = $this->Month->find('list');

        $this->loadModel('FiscalYear');
        $FiscalYear = $this->FiscalYear->find('list');

        $this->set(compact('employees', 'loanTypes', 'loans', 'department', 'designation', 'Month', 'FiscalYear'));
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
        $this->EmployeeLoan->id = $id;
        if (!$this->EmployeeLoan->exists()) {
            throw new NotFoundException(__('Invalid employee loan'));
        }
        if ($this->EmployeeLoan->delete()) {
            $this->Session->setFlash(__('Employee loan deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Employee loan was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

    public function admin_get_employee_names() {
        $department_id = $this->request->data('department_id');
        $designation_id = $this->request->data('designation_id');
        $this->loadModel('Employee');
        $employee = $this->Employee->find('list', array('conditions' => array('Employee.department_id' => $department_id, 'Employee.designation_id' => $designation_id)));
        //pr($employee);
        echo "<option value=''> select </option>";
        foreach ($employee as $key => $value) {
            // pr($value);
            /* foreach ($value as $val) { */
            echo "<option value=" . $key . ">" . $value . "</option>";
            /* } */
        }
        $this->autoRender = false;
    }

    public function admin_get_loans() {
        $loan_type_id = $this->request->data('loan_type_id');
        $this->loadModel('Loan');
        $loans = $this->Loan->find('list', array('conditions' => array('Loan.loan_type_id' => $loan_type_id)));
        //pr($employee);
        echo "<option value=''> select </option>";
        foreach ($loans as $key => $value) {
            // pr($value);
            /* foreach ($value as $val) { */
            echo "<option value=" . $key . ">" . $value . "</option>";
            /* } */
        }
        $this->autoRender = false;
    }

    public function admin_employee_loans_search() {
        $department_id = $this->request->data('department_id');
        $loan_id = $this->request->data('loan_id');
        /* $this->loadModel('employees');
          $this->loadModel('loans'); */

        $this->EmployeeLoan->recursive = 2;
        $emloan = $this->EmployeeLoan->find('all', array('conditions' => array('employee.department_id' => $department_id, 'loan.id' => $loan_id)));

        $this->set($this->paginate());

        $this->loadModel('Department');
        $department = $this->Department->find('list');

        $this->loadModel('Loan');
        $loan = $this->Loan->find('list');

        $this->set(compact('department', 'loan', 'emloan'));
    }

    private function __interest_rate($id = null) {
        $this->loadModel('LoanType');
        $this->LoanType->recursive = -1;
        $interest_rate = $this->LoanType->find('all', array('fields' => array('interest_rate'), 'conditions' => array('LoanType.id' => $id)));
        return $interest_rate;
    }

}
