<?php

App::uses('AppController', 'Controller');

/**
 * EmployeeLoans Controller
 *
 * @property EmployeeLoan $EmployeeLoan
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class GpfLoanTransfersController extends AppController {

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
        $this->set('page_title', 'Gpf Loan Transfers');
        $this->loadModel('Department');
        $this->loadModel('Designation');
        $this->loadModel('Month');
        $this->loadModel('Loan');
        $this->loadModel('FiscalYear');
        $this->loadModel('EmployeeLoan');
        $employees = $this->EmployeeLoan->Employee->find('list');
        $loanTypes = $this->EmployeeLoan->LoanType->find('list');
        $department = $this->Department->find('list');
        $designation = $this->Designation->find('list');
        $Month = $this->Month->find('list');
        $FiscalYear = $this->FiscalYear->find('list');
        $this->set(compact('employees', 'loanTypes', 'department', 'designation', 'Month', 'FiscalYear'));
        if ($this->request->is('post')) {
            if ($this->request->data['EmployeeLoan']['refundable'] == 1) {
                $emp_loan_id = array_key_exists('employee_loan_id', $this->request->data['EmployeeLoan']) ? $this->request->data['EmployeeLoan']['employee_loan_id'] : array();
                $count_loan_id = count($emp_loan_id);
                $this->loadModel('GpfSubscription');
                if ($count_loan_id > 0):
                    $emp_loan_id = $this->request->data['EmployeeLoan']['employee_loan_id'];
                    foreach ($this->request->data['EmployeeLoan']['employee_loan_id'] as $key => $employee_loan_id) {
                        $this->EmployeeLoan->updateAll(
                                array('EmployeeLoan.status' => 0, 'EmployeeLoan.gpf_transfer_status' => 1), array('EmployeeLoan.id' => $employee_loan_id)
                        );
                    }
                    $this->Session->setFlash(__('Gpf Loan has Transfered.'), 'flash/success');
                    $this->redirect(array('action' => 'index'));
                endif;
            } else {
                $this->Session->setFlash(__('Please Select Refundable.'), 'flash/error');
                $this->redirect(array('action' => 'index'));
            }
        }
    }

}
