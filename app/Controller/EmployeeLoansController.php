<?php

App::uses('AppController', 'Controller');
App::import('Controller', 'SalarySheets');

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
    private function get_previous_interest_with_current_due($employee_loan_id, $previous_loan, $current_due) {
        $take_interest_data = 0;
        $take_current_due = 0;
        $salaryController = new SalarySheetsController();
        foreach ($employee_loan_id as $k => $v) {
            if ($previous_loan[$v]['record_current_due'] > 0) {
                $take_interest_data += $salaryController->interest_calculation($previous_loan[$v]);
                $take_current_due += $previous_loan[$v]['record_current_due'];
            } else {
                if ($previous_loan[$v]['interest_amount_due'] > 0) {
                    $take_interest_data += $previous_loan[$v]['interest_amount_due'];
                }
            }
        }
        return $take_interest_data + $take_current_due + $current_due;
    }

    private function get_previous_applied_interest($count_loan_id, $emp_loan_id, $flag, $previous_loan) {
        $salaryController = new SalarySheetsController();
        if ($count_loan_id == 1) {
            $array_key = empty($emp_loan_id[$flag]) ? '' : $emp_loan_id[$flag];
            // return $array_key;
            $key = array_key_exists($array_key, $previous_loan);
            //return $key;
            if (!empty($key)) {
                if ($previous_loan[$emp_loan_id[$flag]]['loan_amount'] > $previous_loan[$emp_loan_id[$flag]]['first_installment_amount']) {
                    return $salaryController->interest_calculation($previous_loan[$emp_loan_id[$flag]]);
                } else {
                    return 0;
                }
            } else {
                return 0;
            }
        } elseif ($count_loan_id == 2) {
            if ($previous_loan[$emp_loan_id[$flag]]['loan_amount'] > $previous_loan[$emp_loan_id[$flag]]['first_installment_amount']) {
                return $salaryController->interest_calculation($previous_loan[$emp_loan_id[$flag]]);
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    }

    private function get_previous_interest_amount_due($count_loan_id, $emp_loan_id, $flag, $previous_loan) {
        if ($count_loan_id == 1) {
            $array_key = empty($emp_loan_id[$flag]) ? '' : $emp_loan_id[$flag];
            $key = array_key_exists($array_key, $previous_loan);
            if (!empty($key)) {
                return $previous_loan[$emp_loan_id[$flag]]['interest_amount_due'];
            } else {
                return 0;
            }
        } elseif ($count_loan_id == 2) {
            return $previous_loan[$emp_loan_id[$flag]]['interest_amount_due'];
        } else {
            return 0;
        }
    }

    private function get_previous_interest_applied_amount($count_loan_id, $emp_loan_id, $flag, $previous_loan) {
        if ($count_loan_id == 1) {
            $array_key = empty($emp_loan_id[$flag]) ? '' : $emp_loan_id[$flag];
            $key = array_key_exists($array_key, $previous_loan);
            if (!empty($key)) {
                if ($previous_loan[$emp_loan_id[$flag]]['loan_amount'] > $previous_loan[$emp_loan_id[$flag]]['first_installment_amount']) {
                    return $previous_loan[$emp_loan_id[$flag]]['loan_amount'] - $previous_loan[$emp_loan_id[$flag]]['record_current_due'];
                } else {
                    return 0;
                }
            } else {
                return 0;
            }
        } elseif ($count_loan_id == 2) {
            if ($previous_loan[$emp_loan_id[$flag]]['loan_amount'] > $previous_loan[$emp_loan_id[$flag]]['first_installment_amount']) {
                return $previous_loan[$emp_loan_id[$flag]]['loan_amount'] - $previous_loan[$emp_loan_id[$flag]]['record_current_due'];
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    }

    private function get_previous_current_due($count_loan_id, $emp_loan_id, $flag, $previous_loan) {
        if ($count_loan_id == 1) {
            $array_key = empty($emp_loan_id[$flag]) ? '' : $emp_loan_id[$flag];
            $key = array_key_exists($array_key, $previous_loan);
            if (!empty($key)) {
                return $previous_loan[$emp_loan_id[$flag]]['record_current_due'];
            } else {
                return 0;
            }
        } elseif ($count_loan_id == 2) {
            return $previous_loan[$emp_loan_id[$flag]]['record_current_due'];
        } else {
            return 0;
        }
    }

    public function get_total_subscription_balance($employee_id, $loan_amount) {
        $this->loadModel('GpfSubscription');
        $responseData = $this->GpfSubscription->find('all', array('conditions' => array(
                'GpfSubscription.employee_id' => $employee_id
            ),
            'fields' => 'GpfSubscription.total_subscription_balance,'
            . 'GpfSubscription.id,',
            'order' => 'GpfSubscription.id DESC',
            //'limit' => 1,
            'recursive' => -1));
        return $responseData[0]['GpfSubscription']['total_subscription_balance'] - $loan_amount;
    }

    public function admin_add() {
        $this->set('page_title', 'Add Employee loan');
        if ($this->request->is('post')) {
           // pr($this->request->data); die();
            $emp_loan_id = array_key_exists('employee_loan_id', $this->request->data['EmployeeLoan']) ? $this->request->data['EmployeeLoan']['employee_loan_id'] : array();
            $count_loan_id = count($emp_loan_id);
            $this->loadModel('GpfSubscription');
            //echo $this->get_previous_interest_with_current_due($this->request->data['EmployeeLoan']['employee_loan_id'], $this->request->data['EmployeeLoan']['previous_loan'], $this->request->data['EmployeeLoan']['current_due']);
            if ($count_loan_id > 0):
                $emp_loan_id = $this->request->data['EmployeeLoan']['employee_loan_id'];
                foreach ($this->request->data['EmployeeLoan']['employee_loan_id'] as $key => $employee_loan_id) {
                    $data = $this->request->data['EmployeeLoan']['previous_loan'][$employee_loan_id];
                    $this->request->data['EmployeeLoan']['previous_loan'][$employee_loan_id]['first_installment_amount'] = $data['loan_amount'] - $data['current_due'];
                    $this->request->data['EmployeeLoan']['previous_loan'][$employee_loan_id]['record_current_due'] = $data['current_due'];
                    $this->request->data['EmployeeLoan']['previous_loan'][$employee_loan_id]['current_due'] = 0;
                    $this->request->data['EmployeeLoan']['employee_loan_id'][$key] = $employee_loan_id;
                    // $this->request->data['EmployeeLoan']['current_due'] = $this->get_last_gpf_current_due($count_loan_id, 1, $this->request->data['EmployeeLoan']['current_due']);
                }
                //echo $this->get_previous_applied_interest($count_loan_id, $emp_loan_id, 0, $this->request->data['EmployeeLoan']['previous_loan']);
                $this->request->data['EmployeeLoan']['first_adjustment_employee_loan_id'] = isset($emp_loan_id[0]) ? $emp_loan_id[0] : 0;
                $this->request->data['EmployeeLoan']['first_adjustment_current_due'] = $this->get_previous_current_due($count_loan_id, $emp_loan_id, 0, $this->request->data['EmployeeLoan']['previous_loan']);
                $this->request->data['EmployeeLoan']['first_adjustment_interest_amount_due'] = $this->get_previous_interest_amount_due($count_loan_id, $emp_loan_id, 0, $this->request->data['EmployeeLoan']['previous_loan']);
                $this->request->data['EmployeeLoan']['first_adjustment_interest_applied_amount'] = $this->get_previous_interest_applied_amount($count_loan_id, $emp_loan_id, 0, $this->request->data['EmployeeLoan']['previous_loan']);
                $this->request->data['EmployeeLoan']['first_adjustment_applied_interest'] = $this->get_previous_applied_interest($count_loan_id, $emp_loan_id, 0, $this->request->data['EmployeeLoan']['previous_loan']);
                $this->request->data['EmployeeLoan']['second_adjustment_employee_loan_id'] = isset($emp_loan_id[1]) ? $emp_loan_id[1] : 0;
                $this->request->data['EmployeeLoan']['second_adjustment_current_due'] = $this->get_previous_current_due($count_loan_id, $emp_loan_id, 1, $this->request->data['EmployeeLoan']['previous_loan']);
                $this->request->data['EmployeeLoan']['second_adjustment_interest_amount_due'] = $this->get_previous_interest_amount_due($count_loan_id, $emp_loan_id, 1, $this->request->data['EmployeeLoan']['previous_loan']);
                $this->request->data['EmployeeLoan']['second_adjustment_interest_applied_amount'] = $this->get_previous_interest_applied_amount($count_loan_id, $emp_loan_id, 1, $this->request->data['EmployeeLoan']['previous_loan']);
                $this->request->data['EmployeeLoan']['second_adjustment_applied_interest'] = $this->get_previous_applied_interest($count_loan_id, $emp_loan_id, 1, $this->request->data['EmployeeLoan']['previous_loan']);
                $this->request->data['EmployeeLoan']['current_due'] = $this->get_previous_interest_with_current_due($this->request->data['EmployeeLoan']['employee_loan_id'], $this->request->data['EmployeeLoan']['previous_loan'], $this->request->data['EmployeeLoan']['current_due']);
                $this->request->data['EmployeeLoan']['installment_amount'] = $this->request->data['EmployeeLoan']['current_due'] / $this->request->data['EmployeeLoan']['number_of_installment'];
                $this->EmployeeLoan->updateAll(
                        array('EmployeeLoan.status' => 0), array('EmployeeLoan.id' => $this->request->data['EmployeeLoan']['employee_loan_id'])
                );
            endif;
            $this->EmployeeLoan->create();
            $this->request->data['EmployeeLoan']['created_at'] = $this->current_datetime();
            $this->request->data['EmployeeLoan']['created_by'] = $this->UserAuth->getUserId();
            $this->request->data['EmployeeLoan']['loan_apply_date'] = date("Y-m-d", strtotime($this->request->data['EmployeeLoan']['loan_apply_date']));
            $this->request->data['EmployeeLoan']['loan_approved_date'] = date("Y-m-d", strtotime($this->request->data['EmployeeLoan']['loan_approved_date']));
            $this->request->data['EmployeeLoan']['first_installment_date'] = date("Y-m-d", strtotime($this->request->data['EmployeeLoan']['first_installment_date']));
            if($this->request->data['EmployeeLoan']['refundable']==1):
                $this->request->data['EmployeeLoan']['status']=0;
            endif;

            if (!empty($this->request->data['EmployeeLoan']['second_installment_date'])) {
                $this->request->data['EmployeeLoan']['second_installment_date'] = date("Y-m-d", strtotime($this->request->data['EmployeeLoan']['second_installment_date']));
            } else {
                $this->request->data['EmployeeLoan']['second_installment_date'] = '0000-00-00';
            }
            if (empty($this->request->data['EmployeeLoan']['second_installment_amount'])):
                $this->request->data['EmployeeLoan']['second_installment_amount'] = 0;
            endif;

            if ($this->EmployeeLoan->save($this->request->data)) {
                $employeeHas = $this->GpfSubscription->hasAny(['employee_id' => $this->request->data['EmployeeLoan']['employee_id']]);
                if (!empty($employeeHas)) {
                    $this->GpfSubscription->create();
                    $this->request->data['GpfSubscription']['employee_id'] = $this->request->data['EmployeeLoan']['employee_id'];
                    $this->request->data['GpfSubscription']['employee_loan_id'] = $this->EmployeeLoan->getLastInsertID();
                    $this->request->data['GpfSubscription']['fiscal_year_id'] = $this->request->data['EmployeeLoan']['recovery_year_id'];
                    $this->request->data['GpfSubscription']['month_id'] = $this->request->data['EmployeeLoan']['recovery_start_month_id'];
                    $this->request->data['GpfSubscription']['total_subscription_balance'] = $this->get_total_subscription_balance($this->request->data['EmployeeLoan']['employee_id'], $this->request->data['EmployeeLoan']['loan_amount']);
                    $this->request->data['GpfSubscription']['loan_amount'] = $this->request->data['EmployeeLoan']['loan_amount'];
                    $this->request->data['GpfSubscription']['sub_status'] = 7;
                    $this->request->data['GpfSubscription']['created_at'] = $this->current_datetime();
                    //pr($this->request->data);die();
                    $this->GpfSubscription->save($this->request->data);
                } else {
                    $this->Session->setFlash(__('Theere has no opening balance for this employee in Gpf.'), 'flash/error');
                    $this->redirect(array('action' => 'index'));
                }
                $this->Session->setFlash(__('The employee loan has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The employee loan could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            
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
        // $loans = $this->EmployeeLoan->Loan->find('list');
        //pr($Loan);
        $this->loadModel('FiscalYear');
        $FiscalYear = $this->FiscalYear->find('list');



        $this->set(compact('employees', 'loanTypes', 'department', 'designation', 'Month', 'FiscalYear'));
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
            $this->request->data['EmployeeLoan']['loan_apply_date'] = date("Y-m-d", strtotime($this->request->data['EmployeeLoan']['loan_apply_date']));

            $this->request->data['EmployeeLoan']['loan_approved_date'] = date("Y-m-d", strtotime($this->request->data['EmployeeLoan']['loan_approved_date']));
            $this->request->data['EmployeeLoan']['first_installment_date'] = date("Y-m-d", strtotime($this->request->data['EmployeeLoan']['first_installment_date']));
            $this->request->data['EmployeeLoan']['second_installment_date'] = date("Y-m-d", strtotime($this->request->data['EmployeeLoan']['second_installment_date']));
            if ($this->request->data['EmployeeLoan']['current_due'] > 0) {
                $this->request->data['EmployeeLoan']['current_due'] = $this->request->data['EmployeeLoan']['current_due'];
            } else {
                $this->request->data['EmployeeLoan']['current_due'] = $this->request->data['EmployeeLoan']['loan_amount'];
            }

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
        echo "<option>------ Please Select ------</option>";
        foreach ($loans as $key => $value) {
            // pr($value);
            /* foreach ($value as $val) { */
            echo "<option value=" . $key . ">" . $value . "</option>";
            /* } */
        }
        $this->autoRender = false;
    }

    public function admin_get_gpf_loan() {
        $responseData = $this->EmployeeLoan->find('all', array('conditions' => array(
                'EmployeeLoan.employee_id' => $this->request->data('employee_id'),
                'EmployeeLoan.loan_type_id' => $this->request->data('loan_type_id'),
                'EmployeeLoan.loan_id' => $this->request->data('loan_id'),
                'EmployeeLoan.status' => 1
            ),
            'fields' => 'EmployeeLoan.loan_amount,'
            . 'EmployeeLoan.id,'
            . 'EmployeeLoan.current_due,'
            . 'EmployeeLoan.interest_amount,'
            . 'EmployeeLoan.interest_amount_due,'
            . 'EmployeeLoan.first_installment_amount,'
            . 'EmployeeLoan.first_installment_date,'
            . 'EmployeeLoan.second_installment_amount,'
            . 'EmployeeLoan.second_installment_date,'
            . 'EmployeeLoan.loan_type_id',
            'order' => 'EmployeeLoan.id ASC',
            //'limit' => 1,
            'recursive' => -1));
        echo json_encode(compact('responseData'));
        $this->autoRender = false;
    }

    public function admin_employee_loans_search() {
        $department_id = $this->request->data('department_id');
        $loan_id = $this->request->data('loan_id');
        // pr($this->request->data);
        $this->loadModel('Employee');
        $this->loadModel('EmployeeLoan');

        $this->EmployeeLoan->recursive = 2;
        $query = array(); #GLOBAL VARIABLE DECLARE

        if ($this->request->data['department_id'] != 0) {
            $query['Employee.department_id'] = $this->request->data['department_id'];
        }
        if ($this->request->data['loan_id'] != 0) {
            $query['EmployeeLoan.loan_id'] = $this->request->data['loan_id'];
        }
        if (!empty($query)) {
            $emloan = $this->EmployeeLoan->find('all', array('conditions' => $query));
        } else {
            $emloan = $this->EmployeeLoan->find('all');
        }


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
