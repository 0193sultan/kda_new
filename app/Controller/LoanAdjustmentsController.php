<?php

App::uses('AppController', 'Controller');
App::import('Controller', 'SalarySheets');

/**
 * LoanAdjustments Controller
 *
 * @property LoanAdjustment $LoanAdjustment
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class LoanAdjustmentsController extends AppController {

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
        $this->set('page_title', 'Loan adjustment List');
        $this->LoanAdjustment->recursive = 0;
        $this->paginate = array('order' => array('LoanAdjustment.id' => 'DESC'));
        $this->set('loanAdjustments', $this->paginate());
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Loan adjustment Details');
        if (!$this->LoanAdjustment->exists($id)) {
            throw new NotFoundException(__('Invalid loan adjustment'));
        }
        $options = array('conditions' => array('LoanAdjustment.' . $this->LoanAdjustment->primaryKey => $id));
        $this->set('loanAdjustment', $this->LoanAdjustment->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Loan adjustment');
        if ($this->request->is('post')) {
            $empLoan = $this->request->data['EmployeeLoan'];
            // pr($this->request->data);die();
            if (!empty($empLoan['employee_loan_id'])) {
                $this->loadModel('EmployeeLoan');
                $this->loadModel('LoanRecovery');
                $this->loadModel('GpfSubscription');
                $salaryController = new SalarySheetsController();
                $loanRecoverydata['LoanRecovery']['month_id'] = $this->request->data['LoanAdjustment']['month_id'];
                $loanRecoverydata['LoanRecovery']['fiscal_year_id'] = $this->request->data['LoanAdjustment']['fiscalYears'];
                $loanRecoverydata['LoanRecovery']['employee_id'] = $this->request->data['LoanAdjustment']['employees'];

                foreach ($empLoan['employee_loan_id'] as $key => $keyAnother) {
                    $loanAdjustment['LoanAdjustment']['loan_id'] = $empLoan['previous_loan'][$keyAnother]['loan_id'];
                    $loanAdjustment['LoanAdjustment']['employee_loan_id'] = $keyAnother;
                    $loanAdjustment['LoanAdjustment']['adjustment_amount'] = $empLoan['loan_adjust'][$keyAnother];
                    $loanAdjustment['LoanAdjustment']['previous_current_due'] = $empLoan['previous_loan'][$keyAnother]['current_due'];
                    $loanAdjustment['LoanAdjustment']['previous_interest_amount_due'] = $empLoan['previous_loan'][$keyAnother]['interest_amount_due'];
                    $loanAdjustment['LoanAdjustment']['adjustment_date'] = date('Y-m-d', strtotime($empLoan['adjustment_date'][$keyAnother]));
                    $loanAdjustment['LoanAdjustment']['adjustment_status'] = 1;
                    $loanAdjustment['LoanAdjustment']['fiscal_year_id'] = $this->request->data['LoanAdjustment']['fiscalYears'];
                    $loanAdjustment['LoanAdjustment']['month_id'] = $this->request->data['LoanAdjustment']['month_id'];
                    $loanAdjustment['LoanAdjustment']['created_at'] = $this->current_datetime();
                    $loanAdjus[] = $loanAdjustment;
                    if (array_key_exists('close_loan_id', $this->request->data['EmployeeLoan'])) {
                        $interest_amount = $this->request->data['EmployeeLoan']['loan_adjust'][$keyAnother] - $this->request->data['EmployeeLoan']['previous_loan'][$keyAnother]['current_due'];
                        $this->EmployeeLoan->updateAll(
                                array('EmployeeLoan.current_due' => 0, 'EmployeeLoan.status' => 0, 'EmployeeLoan.interest_amount' => $interest_amount), array('EmployeeLoan.id ' => $keyAnother)
                        );
                        //   pr($this->request->data);echo $current_due;die();
                        $loanRecoverydata['LoanRecovery']['loan_id'] = $empLoan['previous_loan'][$keyAnother]['loan_id'];
                        $loanRecoverydata['LoanRecovery']['recovery_loan_amount'] = $empLoan['loan_adjust'][$keyAnother];
                        $loanRecoverydata['LoanRecovery']['recovery_current_due'] = $empLoan['previous_loan'][$keyAnother]['current_due'];
                        $loanRecoverydata['LoanRecovery']['recovery_interest_amount_due'] = $interest_amount;
                        $loanRecoverydata['LoanRecovery']['employee_loan_id'] = $empLoan['previous_loan'][$keyAnother]['id'];
                        $loanRecoverydata['LoanRecovery']['recovery_current_due'] = $empLoan['loan_adjust'][$keyAnother];
                        $loanRecoverydata['LoanRecovery']['adjustment_status'] = 1;
                        $loanRecoverydata['LoanRecovery']['created_at'] = $this->current_datetime();
                        $loanRecoveryArray[] = $loanRecoverydata;
                        $this->LoanRecovery->saveAll($loanRecoveryArray);
                        $loanRecoveryArray = [];

                        $gpfSubscription = $this->GpfSubscription->find('all', array('conditions' => array(
                                'GpfSubscription.employee_id' => $this->request->data['LoanAdjustment']['employees']),
                            //'fields' => 'Post.name',
                            'order' => 'GpfSubscription.id DESC',
                            'limit' => 1,
                            'recursive' => 0));
                        // pr($gpfSubscription);die();
                        if (count($gpfSubscription) > 0 && $empLoan['previous_loan'][$keyAnother]['loan_type_id'] == 8):
                            $gpf['GpfSubscription']['employee_id'] = $this->request->data['LoanAdjustment']['employees'];
                            $gpf['GpfSubscription']['employee_loan_id'] = $keyAnother;
                            $gpf['GpfSubscription']['fiscal_year_id'] = $this->request->data['LoanAdjustment']['fiscalYears'];
                            $gpf['GpfSubscription']['month_id'] = $this->request->data['LoanAdjustment']['month_id'];
                            $gpf['GpfSubscription']['deposit_loan_amount'] = $empLoan['loan_adjust'][$keyAnother];
                            $gpf['GpfSubscription']['total_subscription_balance'] = $gpfSubscription[0]['GpfSubscription']['total_subscription_balance'] + $empLoan['loan_adjust'][$keyAnother];
                            $gpf['GpfSubscription']['created_at'] = $this->current_datetime();
                            $gpf['GpfSubscription']['sub_status'] = 6;
                            $gpf_array[] = $gpf;
                            $this->GpfSubscription->saveAll($gpf_array);
                            $gpf_array = [];
                        endif;
                        $this->LoanAdjustment->saveAll($loanAdjus);
                        $this->Session->setFlash(__('The loan adjustment has been saved'), 'flash/success');
                        $this->redirect(array('action' => 'index'));
                    }else {
                        $this->LoanAdjustment->saveAll($loanAdjus);
                    }
                    // die();
                    $loanAdjus = [];
                    if ($empLoan['previous_loan'][$keyAnother]['current_due'] != 0) {
                        if ($empLoan['previous_loan'][$keyAnother]['current_due'] >= $empLoan['loan_adjust'][$keyAnother]) {
                            $current_due = $empLoan['previous_loan'][$keyAnother]['current_due'] - $empLoan['loan_adjust'][$keyAnother];
                            $this->EmployeeLoan->updateAll(
                                    array('EmployeeLoan.current_due' => $current_due), array('EmployeeLoan.id ' => $keyAnother)
                            );
                            //   pr($this->request->data);echo $current_due;die();
                            $loanRecoverydata['LoanRecovery']['loan_id'] = $empLoan['previous_loan'][$keyAnother]['loan_id'];
                            $loanRecoverydata['LoanRecovery']['recovery_loan_amount'] = $empLoan['loan_adjust'][$keyAnother];
                            $loanRecoverydata['LoanRecovery']['recovery_current_due'] = $empLoan['loan_adjust'][$keyAnother];
                            $loanRecoverydata['LoanRecovery']['employee_loan_id'] = $empLoan['previous_loan'][$keyAnother]['id'];
                            $loanRecoverydata['LoanRecovery']['recovery_current_due'] = $empLoan['loan_adjust'][$keyAnother];
                            $loanRecoverydata['LoanRecovery']['adjustment_status'] = 1;
                            $loanRecoverydata['LoanRecovery']['created_at'] = $this->current_datetime();
                            $loanRecoveryArray[] = $loanRecoverydata;
                            $this->LoanRecovery->saveAll($loanRecoveryArray);
                            $loanRecoveryArray = [];
                        } else {
                            if ($empLoan['previous_loan'][$keyAnother]['interest_amount'] == 0) {
                                $empLoan['previous_loan'][$keyAnother]['interest_amount_due'] = $salaryController->interest_calculation($empLoan['previous_loan'][$keyAnother]);
                                $empLoan['previous_loan'][$keyAnother]['interest_amount'] = $salaryController->interest_calculation($empLoan['previous_loan'][$keyAnother]);
                            }
                            $temp = $empLoan['previous_loan'][$keyAnother]['interest_amount_due'] + $empLoan['previous_loan'][$keyAnother]['current_due'];
                            $interest_amount_due = $temp - $empLoan['loan_adjust'][$keyAnother];
                            $current_due = 0;
                            $this->EmployeeLoan->updateAll(
                                    array('EmployeeLoan.current_due' => $current_due,
                                'EmployeeLoan.interest_amount' => $empLoan['previous_loan'][$keyAnother]['interest_amount'],
                                'EmployeeLoan.interest_amount_due' => $interest_amount_due
                                    ), array('EmployeeLoan.id ' => $keyAnother)
                            );
                            $loanRecoverydata['LoanRecovery']['recovery_loan_amount'] = $empLoan['loan_adjust'][$keyAnother];
                            $loanRecoverydata['LoanRecovery']['employee_loan_id'] = $empLoan['previous_loan'][$keyAnother]['id'];
                            $loanRecoverydata['LoanRecovery']['recovery_current_due'] = $empLoan['previous_loan'][$keyAnother]['current_due'];
                            $loanRecoverydata['LoanRecovery']['recovery_interest_amount_due'] = $empLoan['loan_adjust'][$keyAnother]-$empLoan['previous_loan'][$keyAnother]['current_due'];
                            $loanRecoverydata['LoanRecovery']['adjustment_status'] = 1;
                            $loanRecoverydata['LoanRecovery']['created_at'] = $this->current_datetime();
                            $loanRecoveryArray[] = $loanRecoverydata;
                            $this->LoanRecovery->saveAll($loanRecoveryArray);
                            $loanRecoveryArray = [];
                        }
                    } else {

                        /* current due, interest ammount, total pay calculation  start */
                        if ($empLoan['previous_loan'][$keyAnother]['interest_amount'] == 0) {
                            $empLoan['previous_loan'][$keyAnother]['interest_amount_due'] = $salaryController->interest_calculation($empLoan['previous_loan'][$keyAnother]);
                            $empLoan['previous_loan'][$keyAnother]['interest_amount'] = $salaryController->interest_calculation($empLoan['previous_loan'][$keyAnother]);
                        }

                        // pr($loanval);die();
                        if ($empLoan['previous_loan'][$keyAnother]['interest_amount_due'] != 0) {
                            if ($empLoan['previous_loan'][$keyAnother]['interest_amount_due'] >= $empLoan['loan_adjust'][$keyAnother]) {
                                $interest_amount_due = $empLoan['previous_loan'][$keyAnother]['interest_amount_due'] - $empLoan['loan_adjust'][$keyAnother];
                                $this->EmployeeLoan->updateAll(
                                        array(
                                    'EmployeeLoan.interest_amount_due' => $interest_amount_due,
                                    'EmployeeLoan.interest_amount' => $empLoan['previous_loan'][$keyAnother]['interest_amount']
                                        ), array('EmployeeLoan.id ' => $keyAnother)
                                );
                                $loanRecoverydata['LoanRecovery']['recovery_loan_amount'] = $empLoan['loan_adjust'][$keyAnother];
                                $loanRecoverydata['LoanRecovery']['employee_loan_id'] = $keyAnother;
                                $loanRecoverydata['LoanRecovery']['recovery_current_due'] = 0;
                                $loanRecoverydata['LoanRecovery']['recovery_interest_amount_due'] = $empLoan['loan_adjust'][$keyAnother];
                                $loanRecoverydata['LoanRecovery']['adjustment_status'] = 1;
                                $loanRecoverydata['LoanRecovery']['created_at'] = $this->current_datetime();
                                $loanRecoveryArray[] = $loanRecoverydata;
                                $this->LoanRecovery->saveAll($loanRecoveryArray);
                                $loanRecoveryArray = [];
                            } else {
                                $interest_amount_due = 0;
                                $this->EmployeeLoan->updateAll(
                                        array('EmployeeLoan.interest_amount_due' => $interest_amount_due,
                                    'EmployeeLoan.interest_amount' => $empLoan['previous_loan'][$keyAnother]['interest_amount'],
                                    'EmployeeLoan.status' => 0), array('EmployeeLoan.id ' => $empLoan['previous_loan'][$keyAnother]['id']
                                        )
                                );
                                $loanRecoverydata['LoanRecovery']['recovery_loan_amount'] = $empLoan['loan_adjust'][$keyAnother];
                                $loanRecoverydata['LoanRecovery']['employee_loan_id'] = $empLoan['previous_loan'][$keyAnother]['id'];
                                $loanRecoverydata['LoanRecovery']['recovery_current_due'] = 0;
                                $loanRecoverydata['LoanRecovery']['recovery_interest_amount_due'] = $empLoan['previous_loan'][$keyAnother]['interest_amount_due'];
                                $loanRecoverydata['LoanRecovery']['adjustment_status'] = 1;
                                $loanRecoverydata['LoanRecovery']['created_at'] = $this->current_datetime();
                                $loanRecoveryArray[] = $loanRecoverydata;
                                $this->LoanRecovery->saveAll($loanRecoveryArray);
                                $loanRecoveryArray = [];
                            }
                        }
                        /* current due interest ammount total pay calculation end */
                    }
                    $gpfSubscription = $this->GpfSubscription->find('all', array('conditions' => array(
                            'GpfSubscription.employee_id' => $this->request->data['LoanAdjustment']['employees']),
                        //'fields' => 'Post.name',
                        'order' => 'GpfSubscription.id DESC',
                        'limit' => 1,
                        'recursive' => 0));
                    // pr($gpfSubscription);die();
                    if (count($gpfSubscription) > 0 && $empLoan['previous_loan'][$keyAnother]['loan_type_id'] == 8):
                        $gpf['GpfSubscription']['employee_id'] = $this->request->data['LoanAdjustment']['employees'];
                        $gpf['GpfSubscription']['employee_loan_id'] = $keyAnother;
                        $gpf['GpfSubscription']['fiscal_year_id'] = $this->request->data['LoanAdjustment']['fiscalYears'];
                        $gpf['GpfSubscription']['month_id'] = $this->request->data['LoanAdjustment']['month_id'];
                        $gpf['GpfSubscription']['deposit_loan_amount'] = $empLoan['loan_adjust'][$keyAnother];
                        $gpf['GpfSubscription']['total_subscription_balance'] = $gpfSubscription[0]['GpfSubscription']['total_subscription_balance'] + $empLoan['loan_adjust'][$keyAnother];
                        $gpf['GpfSubscription']['created_at'] = $this->current_datetime();
                        $gpf['GpfSubscription']['sub_status'] = 6;
                        $gpf_array[] = $gpf;
                        $this->GpfSubscription->saveAll($gpf_array);
                        $gpf_array = [];
                    endif;
                }
                $this->Session->setFlash(__('The loan adjustment has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The loan adjustment could not be saved. Please, try again.'), 'flash/error');
            }
        }
        $this->loadModel('Employee');
        $this->loadModel('FiscalYear');
        $fiscalYears = $this->FiscalYear->find('list');
        $employees = $this->Employee->find('list');
        $employeeLoans = $this->LoanAdjustment->EmployeeLoan->find('list');
        $this->set(compact('employeeLoans', 'employees', 'fiscalYears'));
    }

    /**
     * admin_edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_edit($id = null) {
        $this->set('page_title', 'Edit Loan adjustment');
        $this->LoanAdjustment->id = $id;
        if (!$this->LoanAdjustment->exists($id)) {
            throw new NotFoundException(__('Invalid loan adjustment'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['LoanAdjustment']['updated_by'] = $this->UserAuth->getUserId();
            if ($this->LoanAdjustment->save($this->request->data)) {
                $this->Session->setFlash(__('The loan adjustment has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The loan adjustment could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('LoanAdjustment.' . $this->LoanAdjustment->primaryKey => $id));
            $this->request->data = $this->LoanAdjustment->find('first', $options);
        }
        $employeeLoans = $this->LoanAdjustment->EmployeeLoan->find('list');
        $this->set(compact('employeeLoans'));
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
        $this->LoanAdjustment->id = $id;
        if (!$this->LoanAdjustment->exists()) {
            throw new NotFoundException(__('Invalid loan adjustment'));
        }
        if ($this->LoanAdjustment->delete()) {
            $this->Session->setFlash(__('Loan adjustment deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Loan adjustment was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

    public function admin_pre_loan() {
        $this->loadModel('EmployeeLoan');
        $responseData = $this->EmployeeLoan->find('all', array('conditions' => array(
                'EmployeeLoan.employee_id' => $this->request->data('employee_id'),
                'EmployeeLoan.status' => 1
            ),
            'fields' => 'EmployeeLoan.loan_amount,'
            . 'EmployeeLoan.id,'
            . 'EmployeeLoan.loan_id,'
            . 'EmployeeLoan.current_due,'
            . 'EmployeeLoan.interest_amount,'
            . 'EmployeeLoan.interest_amount_due,'
            . 'EmployeeLoan.installment_amount,'
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

    public function admin_loan_name() {
        $this->loadModel('Loan');
        $responseData = $this->Loan->find('all', array('conditions' => array(
                'Loan.id' => $this->request->data('loan_id')
            ),
            'fields' => 'Loan.name,',
            'order' => 'Loan.id ASC',
            //'limit' => 1,
            'recursive' => -1));
        echo json_encode(compact('responseData'));
        $this->autoRender = false;
    }

}
