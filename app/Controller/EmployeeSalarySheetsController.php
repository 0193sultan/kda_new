<?php

App::uses('AppController', 'Controller');

/**
 * Sallery Shit
 *
 * @property Employee $Employee
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class EmployeeSalarySheetsController extends AppController {

    public $uses = array();

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Session');

    /**
     * admin_index method
     *
     * @return void
     */
    public function admin_index() {
        $this->set('page_title', 'Sallery Shit');
        $this->loadModel('Employee');
        $this->loadModel('FiscalYear');
        $this->FiscalYear->recursive = -1;
        $fiscalYearData = $this->FiscalYear->find('list');
        $all_emp = $this->Employee->find('all', array('conditions' => array(
		                'NOT' => array(
                    'Employee.job_status_id' => array(3,4,6)
                ),
            ),
            //'fields' => 'FiscalYearSetting.working_day,FiscalYearSetting.id,',
            'order' => 'Employee.id ASC',
            //'limit' => 1,
            'recursive' => 1));

        $this->loadModel('MonthlyOthersEnty');
        //pr($all_emp);die();
        // Bonus Configure Part
        $this->loadModel('DeductSalary');
        $deductSalaries = $this->DeductSalary->find('list');
        $this->set('deductSalaries', $deductSalaries);
        $this->loadModel('ConfigMetas');
        $this->ConfigMetas->recursive = -1;
        $salaryTypes = $this->ConfigMetas->find('all', array('conditions' => array('ConfigMetas.key LIKE' => 'sal_%')));
        if (count($salaryTypes) > 0) {
            $i = 1;
            foreach ($salaryTypes as $key => $value) {
                if ($value['ConfigMetas']['key'] == 'sal_festival_buddhisam') {
                    $salaryTypesWithTrackingKey[$value['ConfigMetas']['trackingId']] = 'Salary Festival Buddhisam';
                    $salaryTypesWithValue[$value['ConfigMetas']['trackingId']] = $value['ConfigMetas']['value'];
                } elseif ($value['ConfigMetas']['key'] == 'sal_boishikh') {
                    $salaryTypesWithTrackingKey[$value['ConfigMetas']['trackingId']] = 'Salary Festival Boishikh';
                    $salaryTypesWithValue[$value['ConfigMetas']['trackingId']] = $value['ConfigMetas']['value'];
                } elseif ($value['ConfigMetas']['key'] == 'sal_festival_muslims') {
                    $salaryTypesWithTrackingKey[$value['ConfigMetas']['trackingId']] = 'Salary Festival Muslims';
                    $salaryTypesWithValue[$value['ConfigMetas']['trackingId']] = $value['ConfigMetas']['value'];
                } elseif ($value['ConfigMetas']['key'] == 'sal_festival_hinduism') {
                    $salaryTypesWithTrackingKey[$value['ConfigMetas']['trackingId']] = 'Salary Festival Hinduism';
                    $salaryTypesWithValue[$value['ConfigMetas']['trackingId']] = $value['ConfigMetas']['value'];
                } elseif ($value['ConfigMetas']['key'] == 'sal_festival_cristianity') {
                    $salaryTypesWithTrackingKey[$value['ConfigMetas']['trackingId']] = 'Salary Festival Cristianity';
                    $salaryTypesWithValue[$value['ConfigMetas']['trackingId']] = $value['ConfigMetas']['value'];
                } else {
                    $salaryTypesWithTrackingKey[$value['ConfigMetas']['trackingId']] = 'General Salary';
                    $salaryTypesWithValue[$value['ConfigMetas']['trackingId']] = $value['ConfigMetas']['value'];
                }
            }
        }
        $this->set('salaryTypes', $salaryTypesWithTrackingKey);
        // Bonus Configure Part end
        if ($this->request->is('post')) {
            $this->loadModel('EmployeeSalarySheet');
            $getYearOrMonth = $this->request->data['salarysheets'];
            if ($getYearOrMonth['fiscal_year_id'] != '' && isset($getYearOrMonth['month_id']) && $getYearOrMonth['month_id'] != 0) {
                $conditions = array('EmployeeSalarySheet.fiscal_year_id' => $getYearOrMonth['fiscal_year_id'], 'EmployeeSalarySheet.month_id' => $getYearOrMonth['month_id']);
                $check_for_duplicate_entry = $this->EmployeeSalarySheet->find('first', array('fields' => array('EmployeeSalarySheet.id'), 'conditions' => $conditions));
                $count_row = count($check_for_duplicate_entry);
                if ($count_row > 0) {
                    $this->Session->setFlash(__('Data has already exist for this Month!'), 'flash/error');
                    $this->redirect(array('action' => 'index'));
                } else {
                    $this->salary_process($this->request->data);
                }
            } else {
                $this->Session->setFlash(__('Please select Year and Month!'), 'flash/error');
                $this->redirect(array('action' => 'index'));
            }
            $this->Session->setFlash(__('Salary has been created'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->set('employeeData', $all_emp);
        $this->set('fiscalYearData', $fiscalYearData);
    }

    public function salary_process($emp_data = '') {
        $count_data = count($emp_data['employee_id']);
        if ($count_data >= 1 && !empty($emp_data['salarysheets']['fiscal_year_id']) && !empty($emp_data['salarysheets']['month_id'])) {
            $this->loadModel('EmployeeLoan');
            $this->loadModel('LoanRecovery');
            $this->loadModel('EmployeeSalarySheet');
            $this->loadModel('FiscalYearSetting');
            $get_working_day = $this->FiscalYearSetting->find('all', array('conditions' => array(
                    'FiscalYearSetting.fiscal_year_id' => $emp_data['salarysheets']['fiscal_year_id'],
                    'FiscalYearSetting.month_id' => $emp_data['salarysheets']['month_id'],
                ),
                'fields' => 'FiscalYearSetting.working_day,'
                . 'FiscalYearSetting.id,',
                'order' => 'FiscalYearSetting.id ASC',
                //'limit' => 1,
                'recursive' => -1));
            $this->Employee->recursive = 1;
            // $emp_info = array();
            // $emp_info=[];
            //pr($emp_data);die();
            foreach ($emp_data['employee_id'] as $key => $value) {
                if ($value == 1) {
                    $emp_loans[] = $this->EmployeeLoan->find('all', array(
                        'fields' => array('EmployeeLoan.id', 'EmployeeLoan.employee_id', 'EmployeeLoan.loan_amount', 'EmployeeLoan.current_due', 'EmployeeLoan.interest_amount', 'EmployeeLoan.installment_amount'),
                        'conditions' => array('EmployeeLoan.employee_id' => $key,'EmployeeLoan.status' => 1)));
                    $emp_info[] = $this->Employee->find('all', array('conditions' => array('Employee.id' => $key, 'Employee.job_status_id !=' => 3, 'Employee.job_status_id !=' => 6)));
                    $checkEmpOnSalarySheet[] = $this->EmployeeSalarySheet->find('all', array(
                        'fields' => array('EmployeeSalarySheet.id'),
                        'conditions' => array('EmployeeSalarySheet.employee_id' => $key, 'EmployeeSalarySheet.fiscal_year_id' => $emp_data['salarysheets']['fiscal_year_id'], 'EmployeeSalarySheet.month_id' => $emp_data['salarysheets']['month_id'])));
                }
            }
            //$this->SaleTarget->create();
            // $data_array = array();
            $this->loadModel('GpfSubscription');
            $this->loadModel('MonthlyAttendanceEntry');
            /*  $gpfSubscriptionFirstRow = $this->GpfSubscription->find('all', array('conditions' => array(
              'GpfSubscription.employee_id' => 22,
              'GpfSubscription.fiscal_year_id' => 2
              ),
              //'fields' => 'Post.name',
              'order' => 'GpfSubscription.id ASC',
              'limit' => 1,
              'recursive' => -1));

              $gpfSubscriptionLastRow = $this->GpfSubscription->find('all', array('conditions' => array(
              'GpfSubscription.employee_id' => 22,
              'GpfSubscription.fiscal_year_id' => 2
              ),
              //'fields' => 'Post.name',
              'order' => 'GpfSubscription.id DESC',
              'limit' => 1,
              'recursive' => -1));
              pr($gpfSubscriptionFirstRow);
              echo '----------------------';
              pr($gpfSubscriptionLastRow);
              die(); */
            foreach ($emp_info as $key => $val) {
                $empAllowace = $val[0]['EmployeeAllowance'];
                $empRecovery = $val[0]['EmployeeRecovery'];
                $countEmployeeLoan = count($val[0]['EmployeeLoan']);

                $gpfSubscription = $this->GpfSubscription->find('all', array('conditions' => array(
                        'GpfSubscription.employee_id' => $val[0]['Employee']['id']
                    ),
                    //'fields' => 'Post.name',
                    'order' => 'GpfSubscription.id DESC',
                    'limit' => 1,
                    'recursive' => 0));
                // pr($gpfSubscription);die();
                $gpf['GpfSubscription']['employee_id'] = $val[0]['EmployeeRecovery']['employee_id'];
                $gpf['GpfSubscription']['fiscal_year_id'] = $emp_data['salarysheets']['fiscal_year_id'];
                $gpf['GpfSubscription']['month_id'] = $emp_data['salarysheets']['month_id'];
                $gpf['GpfSubscription']['created_at'] = $this->current_datetime();
                if ($val[0]['EmployeeRecovery']['gpf_recovery'] == 1) {
                    $gpf['GpfSubscription']['subscription_recovery'] = $val[0]['EmployeeRecovery']['gpf'];
                    $gpfSubscription[0]['GpfSubscription']['total_subscription_balance'] = !empty($gpfSubscription[0]['GpfSubscription']['total_subscription_balance']) ? $gpfSubscription[0]['GpfSubscription']['total_subscription_balance'] : 0;
                    $gpf['GpfSubscription']['total_subscription_balance'] = $gpfSubscription[0]['GpfSubscription']['total_subscription_balance'] + $val[0]['EmployeeRecovery']['gpf'];
                    $gpf['GpfSubscription']['sub_status'] = 1;
                    $gpf_array[] = $gpf;
                    $this->GpfSubscription->saveAll($gpf_array);
                    $gpf_array = [];
                } else {
                    $gpf['GpfSubscription']['total_subscription_balance'] = $gpfSubscription[0]['GpfSubscription']['total_subscription_balance'];
                }
                // die();
                /* GpfSubscription end */
                if ($countEmployeeLoan > 0):
                    $j = 0;
                    foreach ($val[0]['EmployeeLoan'] as $loanKey => $loanval) {
                        //  pr($loanval);
                        // echo $this->interest_calculation($loanval);
                        // die();
                        if ($val[0]['Employee']['festival_recovery'] == 1) {
                            $checkFlag = $this->check_fiscal_year_vs_recovery_year($emp_data['salarysheets']['fiscal_year_id'], $emp_data['salarysheets']['month_id'], $loanval['recovery_year_id'], $loanval['recovery_start_month_id']);
                        } else {
                            if ($this->request->data['salarysheets']['salary_types'] == 32) {
                                $checkFlag = 0;
                            } elseif ($this->request->data['salarysheets']['salary_types'] == 33 && $val[0]['Religion']['id'] == 1) {
                                $checkFlag = $this->check_fiscal_year_vs_recovery_year($emp_data['salarysheets']['fiscal_year_id'], $emp_data['salarysheets']['month_id'], $loanval['recovery_year_id'], $loanval['recovery_start_month_id']);
                                if ($checkFlag == 1) {
                                    $checkFlag = 0;
                                }
                            } elseif ($this->request->data['salarysheets']['salary_types'] == 34 && $val[0]['Religion']['id'] == 2) {
                                $checkFlag = $this->check_fiscal_year_vs_recovery_year($emp_data['salarysheets']['fiscal_year_id'], $emp_data['salarysheets']['month_id'], $loanval['recovery_year_id'], $loanval['recovery_start_month_id']);
                                if ($checkFlag == 1) {
                                    $checkFlag = 0;
                                }
                            } elseif ($this->request->data['salarysheets']['salary_types'] == 35 && $val[0]['Religion']['id'] == 3) {
                                $checkFlag = $this->check_fiscal_year_vs_recovery_year($emp_data['salarysheets']['fiscal_year_id'], $emp_data['salarysheets']['month_id'], $loanval['recovery_year_id'], $loanval['recovery_start_month_id']);
                                if ($checkFlag == 1) {
                                    $checkFlag = 0;
                                }
                            } elseif ($this->request->data['salarysheets']['salary_types'] == 36 && $val[0]['Religion']['id'] == 4) {
                                $checkFlag = $this->check_fiscal_year_vs_recovery_year($emp_data['salarysheets']['fiscal_year_id'], $emp_data['salarysheets']['month_id'], $loanval['recovery_year_id'], $loanval['recovery_start_month_id']);
                                if ($checkFlag == 1) {
                                    $checkFlag = 0;
                                }
                            } else {
                                $checkFlag = $this->check_fiscal_year_vs_recovery_year($emp_data['salarysheets']['fiscal_year_id'], $emp_data['salarysheets']['month_id'], $loanval['recovery_year_id'], $loanval['recovery_start_month_id']);
                            }
                        }
                        if ($checkFlag == 1 && $loanval['status'] == 1) {
                            $loanRecoverydata['LoanRecovery']['month_id'] = $emp_data['salarysheets']['month_id'];
                            $loanRecoverydata['LoanRecovery']['fiscal_year_id'] = $emp_data['salarysheets']['fiscal_year_id'];
                            $loanRecoverydata['LoanRecovery']['loan_id'] = $loanval['loan_id'];
                            $loanRecoverydata['LoanRecovery']['employee_id'] = $loanval['employee_id'];
                            if ($loanval['current_due'] != 0) {
                                if ($loanval['current_due'] >= $loanval['installment_amount']) {
                                    $current_due = $loanval['current_due'] - $loanval['installment_amount'];
                                    // echo $current_due;die();
                                    $this->EmployeeLoan->updateAll(
                                            array('EmployeeLoan.current_due' => $current_due), array('EmployeeLoan.id ' => $loanval['id'])
                                    );
                                    $loanRecoverydata['LoanRecovery']['recovery_loan_amount'] = $loanval['installment_amount'];
                                    $loanRecoverydata['LoanRecovery']['employee_loan_id'] = $emp_loans[$key][$j]['EmployeeLoan']['id'];
                                    $loanRecoverydata['LoanRecovery']['created_at'] = $this->current_datetime();
                                    $loanRecoverydata[] = $loanRecoverydata;
                                    $this->LoanRecovery->saveAll($loanRecoverydata);
                                } else {
                                    if ($loanval['interest_amount'] == 0) {
                                        $loanval['interest_amount_due'] = $this->interest_calculation($loanval);
                                        $loanval['interest_amount'] = $this->interest_calculation($loanval);
                                    }
                                    $temp = $loanval['interest_amount_due'] + $loanval['current_due'];
                                    $interest_amount_due = $temp - $loanval['installment_amount'];
                                    $current_due = 0;
                                    $this->EmployeeLoan->updateAll(
                                            array('EmployeeLoan.current_due' => $current_due, 'EmployeeLoan.interest_amount' => $loanval['interest_amount'], 'EmployeeLoan.interest_amount_due' => $interest_amount_due), array('EmployeeLoan.id ' => $loanval['id'])
                                    );
                                    $loanRecoverydata['LoanRecovery']['recovery_loan_amount'] = $loanval['installment_amount'];
                                    $loanRecoverydata['LoanRecovery']['employee_loan_id'] = $emp_loans[$key][$j]['EmployeeLoan']['id'];
                                    $loanRecoverydata['LoanRecovery']['created_at'] = $this->current_datetime();
                                    $loanRecoverydata[] = $loanRecoverydata;
                                    $this->LoanRecovery->saveAll($loanRecoverydata);
                                }
                            } else {

                                /* current due, interest ammount, total pay calculation  start */
                                if ($loanval['interest_amount'] == 0) {
                                    $loanval['interest_amount_due'] = $this->interest_calculation($loanval);
                                    $loanval['interest_amount'] = $this->interest_calculation($loanval);
                                    $gpf['GpfSubscription']['loan_interest_amount'] = $this->interest_calculation($loanval);
                                    $gpf['GpfSubscription']['sub_status'] = 4;
                                    $gpf['GpfSubscription']['subscription_recovery'] = 0;
                                    $gpf['GpfSubscription']['loan_recovery'] = 0;
                                    $gpf['GpfSubscription']['loan_interest_recovery'] = 0;
                                    $gpf_array[] = $gpf;
                                    $this->GpfSubscription->saveAll($gpf_array);
                                    $gpf_array = [];
                                }

                                // pr($loanval);die();
                                if ($loanval['interest_amount_due'] != 0) {
                                    if ($loanval['interest_amount_due'] >= $loanval['installment_amount']) {
                                        $interest_amount_due = $loanval['interest_amount_due'] - $loanval['installment_amount'];
                                        $this->EmployeeLoan->updateAll(
                                                array('EmployeeLoan.interest_amount_due' => $interest_amount_due, 'EmployeeLoan.interest_amount' => $loanval['interest_amount']), array('EmployeeLoan.id ' => $loanval['id'])
                                        );
                                        $loanRecoverydata['LoanRecovery']['recovery_loan_amount'] = $loanval['installment_amount'];
                                        $loanRecoverydata['LoanRecovery']['employee_loan_id'] = $emp_loans[$key][$j]['EmployeeLoan']['id'];
                                        $loanRecoverydata['LoanRecovery']['created_at'] = $this->current_datetime();
                                        $loanRecoverydata[] = $loanRecoverydata;
                                        $this->LoanRecovery->saveAll($loanRecoverydata);
                                    } else {
                                        $interest_amount_due = 0;
                                        //$this->salary_sheet($loanval['loan_id'], $loanval['interest_amount'], $val, $emp_data);
                                        $this->EmployeeLoan->updateAll(
                                                array('EmployeeLoan.interest_amount_due' => $interest_amount_due, 'EmployeeLoan.interest_amount' => $loanval['interest_amount'], 'EmployeeLoan.status' => 0), array('EmployeeLoan.id ' => $loanval['id'])
                                        );
                                        $loanRecoverydata['LoanRecovery']['recovery_loan_amount'] = $loanval['interest_amount_due'];
                                        $loanRecoverydata['LoanRecovery']['employee_loan_id'] = $emp_loans[$key][$j]['EmployeeLoan']['id'];
                                        $loanRecoverydata['LoanRecovery']['created_at'] = $this->current_datetime();
                                        $loanRecoverydata[] = $loanRecoverydata;
                                        $this->LoanRecovery->saveAll($loanRecoverydata);
                                    }
                                }
                                /* current due interest ammount total pay calculation end */
                            }
                            if ($loanval['loan_type_id'] == 8):
                                if ($loanval['current_due'] != 0) {
                                    if ($loanval['current_due'] >= $loanval['installment_amount']) {
                                        $gpf['GpfSubscription']['subscription_recovery'] = 0;
                                        $gpf['GpfSubscription']['total_subscription_balance'] = $gpf['GpfSubscription']['total_subscription_balance'] + $loanval['installment_amount'];
                                        $gpf['GpfSubscription']['loan_recovery'] = $loanval['installment_amount'];
                                        $gpf['GpfSubscription']['loan_interest_recovery'] = 0;
                                        $gpf['GpfSubscription']['employee_loan_id'] = $emp_loans[$key][$j]['EmployeeLoan']['id'];
                                        $gpf['GpfSubscription']['loan_interest_amount'] = 0;
                                        $gpf['GpfSubscription']['sub_status'] = 2;
                                        $gpfdata[] = $gpf;
                                        $this->GpfSubscription->saveAll($gpfdata);
                                        $gpfdata = [];
                                        $gpf['GpfSubscription']['employee_loan_id'] = 0;
                                        $gpf['GpfSubscription']['loan_recovery'] = 0;
                                    } else {
                                        // $this->GpfSubscription->create();
                                        $gpf['GpfSubscription']['subscription_recovery'] = 0;
                                        $gpf['GpfSubscription']['total_subscription_balance'] = $gpf['GpfSubscription']['total_subscription_balance'];
                                        $gpf['GpfSubscription']['loan_interest_amount'] = $this->interest_calculation($loanval);
                                        $gpf['GpfSubscription']['employee_loan_id'] = $emp_loans[$key][$j]['EmployeeLoan']['id'];
                                        $gpf['GpfSubscription']['created_at'] = $this->current_datetime();
                                        $gpf['GpfSubscription']['sub_status'] = 4;
                                        $gpfdataExtra[] = $gpf;

                                        $this->GpfSubscription->saveAll($gpfdataExtra);
                                        $gpfdataExtra = [];
                                        //$this->GpfSubscription->create();
                                        $gpf['GpfSubscription']['loan_recovery'] = $loanval['current_due'];
                                        $loan_interest_recovery = $loanval['installment_amount'] - $loanval['current_due'];
                                        $gpf['GpfSubscription']['total_subscription_balance'] = $gpf['GpfSubscription']['total_subscription_balance'] + $loanval['current_due'] + $loan_interest_recovery;
                                        $gpf['GpfSubscription']['loan_interest_recovery'] = $loan_interest_recovery;
                                        $gpf['GpfSubscription']['loan_interest_amount'] = 0;
                                        $gpf['GpfSubscription']['sub_status'] = 2;
                                        $gpfdata[] = $gpf;
                                        //$this->GpfSubscription->create();
                                        $this->GpfSubscription->saveAll($gpfdata);
                                        $gpfdata = [];
                                        $gpf['GpfSubscription']['loan_recovery'] = 0;
                                        $gpf['GpfSubscription']['loan_interest_recovery'] = 0;
                                    }
                                } else {
                                    if ($loanval['interest_amount_due'] != 0) {
                                        if ($loanval['interest_amount_due'] >= $loanval['installment_amount']) {
                                            $gpf['GpfSubscription']['subscription_recovery'] = 0;
                                            $gpf['GpfSubscription']['total_subscription_balance'] = $gpf['GpfSubscription']['total_subscription_balance'] + $loanval['installment_amount'];
                                            $gpf['GpfSubscription']['loan_interest_recovery'] = $loanval['installment_amount'];
                                            $gpf['GpfSubscription']['employee_loan_id'] = $emp_loans[$key][$j]['EmployeeLoan']['id'];
                                            $gpf['GpfSubscription']['loan_interest_amount'] = 0;
                                            $gpf['GpfSubscription']['sub_status'] = 3;
                                            $gpfdata[] = $gpf;
                                            $this->GpfSubscription->saveAll($gpfdata);
                                            $gpfdata = [];
                                            $gpf['GpfSubscription']['loan_interest_recovery'] = 0;
                                        } else {
                                            $interest_amount_due = 0;
                                            $gpf['GpfSubscription']['subscription_recovery'] = 0;
                                            $gpf['GpfSubscription']['total_subscription_balance'] = $gpf['GpfSubscription']['total_subscription_balance'] + $loanval['interest_amount_due'];
                                            $gpf['GpfSubscription']['loan_interest_recovery'] = $loanval['interest_amount_due'];
                                            $gpf['GpfSubscription']['employee_loan_id'] = $emp_loans[$key][$j]['EmployeeLoan']['id'];
                                            $gpf['GpfSubscription']['loan_interest_amount'] = 0;
                                            $gpf['GpfSubscription']['sub_status'] = 3;
                                            $gpfdata[] = $gpf;
                                            $this->GpfSubscription->saveAll($gpfdata);
                                            $gpfdata = [];
                                            $gpf['GpfSubscription']['loan_interest_recovery'] = 0;
                                        }
                                    }
                                }
                            endif;
                        }
                        $j++;
                    }
                endif;
                $this->request->data['EmployeeSalarySheet']['created_at'] = $this->current_datetime();
                $data['EmployeeSalarySheet']['created_at'] = $this->current_datetime();
                $emp_id = $val[0]['EmployeeRecovery']['employee_id'];
                $year = $emp_data['salarysheets']['fiscal_year_id'];
                $month = $emp_data['salarysheets']['month_id'];
                $data['EmployeeSalarySheet']['employee_id'] = $val[0]['Employee']['id'];

                /* Employee allowance start */
                if ($val[0]['Employee']['job_status_id'] == 2) {
                    $data['EmployeeSalarySheet']['current_basic'] = $this->partial_salary($emp_id, $year, $month, $val[0]['Scale']['grade_basic'], 'new_basic');
                    $data['EmployeeSalarySheet']['current_basic'] = $data['EmployeeSalarySheet']['current_basic'] / 2;
                    $data['EmployeeSalarySheet']['convance'] = 0;
                } else {
                    $data['EmployeeSalarySheet']['current_basic'] = $this->partial_salary($emp_id, $year, $month, $val[0]['Scale']['grade_basic'], 'new_basic');
                    $data['EmployeeSalarySheet']['convance'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['convence'], 'others');
                }
                $data['EmployeeSalarySheet']['da'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['da'], 'others'); //$val[0]['EmployeeAllowance']['da'];
                $data['EmployeeSalarySheet']['pp'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['pp'], 'others'); //$val[0]['EmployeeAllowance']['pp'];
                $data['EmployeeSalarySheet']['medical'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['medical'], 'others'); //$val[0]['EmployeeAllowance']['medical'];
                $data['EmployeeSalarySheet']['tiffin'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['tiffin'], 'others'); //$val[0]['EmployeeAllowance']['tiffin'];
                $data['EmployeeSalarySheet']['wash'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['wash'], 'others'); //$val[0]['EmployeeAllowance']['wash'];
                $data['EmployeeSalarySheet']['mobile'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['mobile'], 'others'); //$val[0]['EmployeeAllowance']['mobile'];
                $data['EmployeeSalarySheet']['cycle'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['cycle'], 'others');
                $data['EmployeeSalarySheet']['charge'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['charges'], 'others'); //$val[0]['EmployeeAllowance']['charges'];
                $data['EmployeeSalarySheet']['other'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['others'], 'others'); //$val[0]['EmployeeAllowance']['others'];
                $data['EmployeeSalarySheet']['house_rent'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['house_rent'], 'others'); //$val[0]['EmployeeAllowance']['house_rent'];
                $data['EmployeeSalarySheet']['education'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['education'], 'others'); //$val[0]['EmployeeAllowance']['education'];
                /* Employee  allowance end */

                /* Employee recovery start  */
                $data['EmployeeSalarySheet']['gpf'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeRecovery']['gpf'], 'others');
                $data['EmployeeSalarySheet']['gpf_recovery'] = $val[0]['EmployeeRecovery']['gpf_recovery'];
                $data['EmployeeSalarySheet']['fixed_house_rent_recovery'] = $val[0]['EmployeeRecovery']['fixed_house_rent'];
                $data['EmployeeSalarySheet']['water_supply_recovery'] = $val[0]['EmployeeRecovery']['water_supply'];
                $data['EmployeeSalarySheet']['bf_recovery'] = $val[0]['EmployeeRecovery']['bf'];
                $data['EmployeeSalarySheet']['gi'] = $val[0]['EmployeeRecovery']['gi'];
                $data['EmployeeSalarySheet']['gi_recovery'] = $val[0]['EmployeeRecovery']['gi_recovery'];
                $data['EmployeeSalarySheet']['tin_shade_recovery'] = $val[0]['EmployeeRecovery']['tin_shed'];
                $data['EmployeeSalarySheet']['emp_tax'] = $val[0]['EmployeeRecovery']['tax'];
                /* Employee recovery end */

                /* Others recovery start  */
                $data['EmployeeSalarySheet']['electricity_recovery'] = $this->others_recovery($emp_id, $year, $month, 1);
                $data['EmployeeSalarySheet']['telephone_recovery'] = $this->others_recovery($emp_id, $year, $month, 2);
                $data['EmployeeSalarySheet']['vehicle_recovery'] = $this->others_recovery($emp_id, $year, $month, 3);
                if ($emp_data['salarysheets']['deductSalaries'] == 1 && count($get_working_day) > 0) {
                    $one_day_salary = $data['EmployeeSalarySheet']['current_basic'] / $get_working_day[0]['FiscalYearSetting']['working_day'];
                    $half_day_salary = $one_day_salary / 2;
                    $data['EmployeeSalarySheet']['deduct_salary'] = $half_day_salary;
                    $get_others_recovery = $this->others_recovery($emp_id, $year, $month, 4);
                    $data['EmployeeSalarySheet']['others_recovery'] = $get_others_recovery + $half_day_salary;
                } elseif ($emp_data['salarysheets']['deductSalaries'] == 2 && count($get_working_day) > 0) {
                    $one_day_salary = $data['EmployeeSalarySheet']['current_basic'] / $get_working_day[0]['FiscalYearSetting']['working_day'];
                    $full_day_salary = $one_day_salary * $emp_data['salarysheets']['deduct_salary'];
                    $data['EmployeeSalarySheet']['deduct_salary'] = $full_day_salary;
                    $get_others_recovery = $this->others_recovery($emp_id, $year, $month, 4);
                    $data['EmployeeSalarySheet']['others_recovery'] = $get_others_recovery + $full_day_salary;
                } else {
                    $data['EmployeeSalarySheet']['others_recovery'] = $this->others_recovery($emp_id, $year, $month, 4);
                }

                /* Others recovery end  */

                //cutting_loan_recovery($emp_id, $fiscal_id, $month_id, $loan_id)
                $data['EmployeeSalarySheet']['house_build_recovery'] = $this->cutting_loan_recovery($emp_id, $year, $month, 4);
                $data['EmployeeSalarySheet']['house_repair_recovery'] = $this->cutting_loan_recovery($emp_id, $year, $month, 7);
                $data['EmployeeSalarySheet']['car_loan'] = $this->cutting_loan_recovery($emp_id, $year, $month, 9);
                $data['EmployeeSalarySheet']['computer_loan'] = $this->cutting_loan_recovery($emp_id, $year, $month, 5);
                $data['EmployeeSalarySheet']['bycycle_loan'] = $this->cutting_loan_recovery($emp_id, $year, $month, 10);
                $data['EmployeeSalarySheet']['gpf_loan'] = $this->cutting_loan_recovery($emp_id, $year, $month, 6);
                $data['EmployeeSalarySheet']['motorcycle_loan'] = $this->cutting_loan_recovery($emp_id, $year, $month, 8);

                $data['EmployeeSalarySheet']['fiscal_year_id'] = $emp_data['salarysheets']['fiscal_year_id'];
                $data['EmployeeSalarySheet']['month_id'] = $emp_data['salarysheets']['month_id'];

                /* calculation part start        */
                // $data['EmployeeSalarySheet']['gross_pay'] = !empty($totalAllowance) ? $totalAllowance : 0;
                $emp_ss = $data['EmployeeSalarySheet'];
                $data['EmployeeSalarySheet']['gross_pay'] = $emp_ss['current_basic'] + $emp_ss['da'] + $emp_ss['pp'] + $emp_ss['medical'] + $emp_ss['convance'] + $emp_ss['tiffin'] + $emp_ss['wash'] + $emp_ss['mobile'] + $emp_ss['charge'] + $emp_ss['house_rent'] + $emp_ss['education'] + $emp_ss['cycle'] + $emp_ss['other'];
                $data['EmployeeSalarySheet']['total_recovery'] = $emp_ss['gpf'] + $emp_ss['gpf_loan'] + $emp_ss['house_build_recovery'] + $emp_ss['house_repair_recovery'] + $emp_ss['computer_loan'] + $emp_ss['fixed_house_rent_recovery'] + $emp_ss['water_supply_recovery'] + $emp_ss['electricity_recovery'] + $emp_ss['bf_recovery'] + $emp_ss['gi'] + $emp_ss['emp_tax'] + $emp_ss['tin_shade_recovery'] + $emp_ss['others_recovery'] + $emp_ss['telephone_recovery'] + $emp_ss['vehicle_recovery'] + $emp_ss['motorcycle_loan'] + $emp_ss['car_loan'] + $emp_ss['bycycle_loan'];
                $data['EmployeeSalarySheet']['net_pay'] = $data['EmployeeSalarySheet']['gross_pay'] - $data['EmployeeSalarySheet']['total_recovery'];
//};
                // $data['EmployeeSalarySheet']['net_pay'] = !empty($netPay) ? $netPay : 0;
                /* calculation part end */

                $data_array[] = $data;
                //die();
                $this->EmployeeSalarySheet->saveAll($data_array);

                $data_array = [];
            }
        }
    }

    public function check_fiscal_year_vs_recovery_year($fiscal_year_id, $month_id, $recovery_year_id, $recovery_start_month_id) {
        if ($fiscal_year_id > $recovery_year_id) {
            return 1;
        } elseif ($fiscal_year_id == $recovery_year_id) {
            if ($month_id >= $recovery_start_month_id) {
                return 1;
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    }

    public function getlastTotalSubsriptionBalance($employeeId, $fiscalYear, $month) {
        $gpfSubscription = $this->GpfSubscription->find('first', array('conditions' =>
            array('GpfSubscription.employee_id' => $employeeId, 'GpfSubscription.employee_id' => $fiscalYear, 'GpfSubscription.employee_id' => $month
            ),
            'fields' => 'GpfSubscription.total_subscription_balance',
            'order' => 'GpfSubscription.id DESC',
            'limit' => 1,
            'recursive' => -1));
        return $gpfSubscription['GpfSubscription']['total_subscription_balance'];
    }

    public function interest_calculation($loanval) {
        $this->loadModel('LoanType');
        $loanType = $this->LoanType->find('first', array('conditions' => array('LoanType.id' => $loanval['loan_type_id']),
            'fields' => 'LoanType.interest_rate',
            'order' => 'LoanType.id DESC',
            'limit' => 1,
            'recursive' => -1));
        $loan_amount = $loanval['loan_amount'];
        $current_due = $loanval['current_due'];
        $first_installment_amount = $loanval['first_installment_amount'];
        $first_installment_date = $loanval['first_installment_date'];
        $second_installment_amount = $loanval['second_installment_amount'];
        $second_installment_date = $loanval['second_installment_date'];

        if ($second_installment_amount == 0) {
            //calculate only first instalment and first installment date

            $installment = $this->__get_installment_number($first_installment_date);
            $interest_amount = $this->__get_interest_amount($installment, $first_installment_amount, $loanType['LoanType']['interest_rate']);

            $total_installment = $installment;
            $total_interest = $interest_amount;

            return $total_interest;
        } else {
            //Calculate first and second installment amount and date
            /* 1st installment and interest */
            $installment_1st = $this->__get_installment_number($first_installment_date);

            $interest_amount_1st = $this->__get_interest_amount($installment_1st, $first_installment_amount, $loanType['LoanType']['interest_rate']);
            /* 1st installment and interest end */

            /* 2nd installment and interest */
            $installment_2nd = $this->__get_installment_number($second_installment_date);
            $interest_amount_2nd = $this->__get_interest_amount($installment_2nd, $second_installment_amount, $loanType['LoanType']['interest_rate']);
            /* 2nd installment and interest end */

            $total_installment = $installment_1st + $installment_2nd;

            $total_interest = $interest_amount_1st + $interest_amount_2nd;

            return $total_interest;
        }
    }

    private function __get_installment_number($installment_date = null) {
        $installment_date_obj = new DateTime($installment_date);
        $today = new DateTime();
        $interval = $installment_date_obj->diff($today);
        $months_of_year = ($interval->y > 0) ? $interval->y * 12 : 0;
        $months = ($interval->m > 0) ? $interval->m : 0;
        $month = ($interval->d > 0) ? 1 : 0;
        $total_months = $months_of_year + $months + $month;
        return $total_months;
    }

    private function __get_interest_amount($installment = null, $amount_interest_cal = null, $interest_rt = null) {

        $interest_amount = ($amount_interest_cal * ($installment + 1) * $interest_rt) / 2400;

        return $interest_amount;
    }

    public function others_recovery($emp_id, $fiscal_id, $month_id, $otherRecoveryType) {
        $monthlyOthersEnty = $this->MonthlyOthersEnty->find('all', array(
            'conditions' => array(
                'MonthlyOthersEnty.employee_id' => $emp_id,
                'MonthlyOthersEnty.fiscal_year_id' => $fiscal_id,
                'MonthlyOthersEnty.month_id' => $month_id
            ),
            'fields' => 'MonthlyOthersEnty.electric_bill,MonthlyOthersEnty.telephone_bill,MonthlyOthersEnty.rent_a_car_bill,MonthlyOthersEnty.others',
            'order' => 'MonthlyOthersEnty.id DESC',
            // 'limit' => 1,
            'recursive' => -1));
        if (count($monthlyOthersEnty) > 0) {
            $initilize = 0;
            foreach ($monthlyOthersEnty as $entrykey => $entryValue) {
                if ($otherRecoveryType == 1) {
                    $sumOfRecovery = $initilize + $entryValue['MonthlyOthersEnty']['electric_bill'];
                    $initilize = $sumOfRecovery;
                } elseif ($otherRecoveryType == 2) {
                    $sumOfRecovery = $initilize + $entryValue['MonthlyOthersEnty']['telephone_bill'];
                    $initilize = $sumOfRecovery;
                } elseif ($otherRecoveryType == 3) {
                    $sumOfRecovery = $initilize + $entryValue['MonthlyOthersEnty']['rent_a_car_bill'];
                    $initilize = $sumOfRecovery;
                } elseif ($otherRecoveryType == 4) {
                    $sumOfRecovery = $initilize + $entryValue['MonthlyOthersEnty']['others'];
                    $initilize = $sumOfRecovery;
                }
            }
            return $sumOfRecovery;
        } else {
            return 0;
        }
    }

    public function cutting_loan_recovery($emp_id, $fiscal_id, $month_id, $loan_id) {
        $loanRecovery = $this->LoanRecovery->find('all', array(
            'conditions' => array(
                'LoanRecovery.employee_id' => $emp_id,
                'LoanRecovery.fiscal_year_id' => $fiscal_id,
                'LoanRecovery.month_id' => $month_id,
                'LoanRecovery.loan_id' => $loan_id,
				'LoanRecovery.adjustment_status' => 0
            //'GpfSubscription.month_id' => $this->request->data['EmployeeLoan']['recovery_start_month_id']
            ),
            'fields' => 'LoanRecovery.recovery_loan_amount',
            'order' => 'LoanRecovery.id DESC',
            // 'limit' => 1,
            'recursive' => -1));
        if (count($loanRecovery) > 0) {
            $initilize = 0;
            foreach ($loanRecovery as $loankey => $loanValue) {
                $sumOfRecovery = $initilize + $loanValue['LoanRecovery']['recovery_loan_amount'];
                $initilize = $sumOfRecovery;
            }
            return $sumOfRecovery;
        } else {
            return 0;
        }
    }

    public function loan_recovery($emp_id, $fiscal_id, $month_id, $loan_id, $salary_types, $religion, $festival_recovery) {

        if ($salary_types == 31) {
            $catchRecoveryData = $this->cutting_loan_recovery($emp_id, $fiscal_id, $month_id, $loan_id);
            return $catchRecoveryData;
        } else {
            if ($festival_recovery == 0) {//Loan off for employee
                return 0;
            } else {//Loan effective for employee
                if ($religion == 1 && $salary_types == 33) {//Loan effective for muslim
                    $catchRecoveryData = $this->cutting_loan_recovery($emp_id, $fiscal_id, $month_id, $loan_id);
                    return $catchRecoveryData;
                } else if ($religion == 2 && $salary_types == 34) {
                    $catchRecoveryData = $this->cutting_loan_recovery($emp_id, $fiscal_id, $month_id, $loan_id);
                    return $catchRecoveryData;
                } else if ($religion == 3 && $salary_types == 35) {
                    $catchRecoveryData = $this->cutting_loan_recovery($emp_id, $fiscal_id, $month_id, $loan_id);
                    return $catchRecoveryData;
                } else if ($religion == 4 && $salary_types == 36) {
                    $catchRecoveryData = $this->cutting_loan_recovery($emp_id, $fiscal_id, $month_id, $loan_id);
                    return $catchRecoveryData;
                } else if ($salary_types == 32) {
                    $catchRecoveryData = $this->cutting_loan_recovery($emp_id, $fiscal_id, $month_id, $loan_id);
                    return $catchRecoveryData;
                } else {
                    return 0;
                }
            }
        }
    }

    public function partial_salary1($emp_id, $year, $month, $allowance) {
        $monthlyAttendanceEntry = $this->MonthlyAttendanceEntry->find('first', array('conditions' =>
            array(
                'MonthlyAttendanceEntry.employee_id' => $emp_id,
                'MonthlyAttendanceEntry.fiscal_year_id' => $year,
                'MonthlyAttendanceEntry.month_id' => $month,
            // 'MonthlyAttendanceEntry.monthly_attendance_entry_type_id' => 1,
            ),
            //'fields' => 'Post.name',
            'order' => 'MonthlyAttendanceEntry.id DESC',
            'limit' => 1,
            'recursive' => -1));
        if (count($monthlyAttendanceEntry) > 0) {
            $checkEntry = $monthlyAttendanceEntry['MonthlyAttendanceEntry'];
            if ($checkEntry['official_attendence'] > $checkEntry['total_attendance']):
                $perUnit = $allowance / $checkEntry['official_attendence'];
                $lastPay = $checkEntry['total_attendance'] * $perUnit;
                return $lastPay;
            endif;
        }else {
            return $allowance;
        }
    }

    public function partial_salary($emp_id, $year, $month, $allowance, $trace) {
        if ($allowance > 0) {
            $monthlyAttendanceEntry = $this->MonthlyAttendanceEntry->find('first', array('conditions' =>
                array(
                    'MonthlyAttendanceEntry.employee_id' => $emp_id,
                    'MonthlyAttendanceEntry.fiscal_year_id' => $year,
                    'MonthlyAttendanceEntry.month_id' => $month,
                ),
                //'fields' => 'Post.name',
                'order' => 'MonthlyAttendanceEntry.id DESC',
                'limit' => 1,
                'recursive' => -1));
            if (count($monthlyAttendanceEntry) > 0) {
                $checkEntry = $monthlyAttendanceEntry['MonthlyAttendanceEntry'];
                if ($checkEntry['monthly_attendance_entry_type_id'] == 3) {
                    if ($trace === 'new_basic') {
                        $perdaySalary = $allowance / $checkEntry['official_attendence'];
                        $salaryForTotalAttendance = $perdaySalary * $checkEntry['total_attendance'];
                        $leftDay = $checkEntry['official_attendence'] - $checkEntry['total_attendance'];
                        $perdaySalaryAfterIncrement = $checkEntry['new_basic'] / $checkEntry['official_attendence'];
                        $salaryForLeftDay = $leftDay * $perdaySalaryAfterIncrement;
                        $finalSalary = $salaryForTotalAttendance + $salaryForLeftDay;
                        return $finalSalary;
                    } else {
                        return $allowance;
                    }
                } else if ($checkEntry['monthly_attendance_entry_type_id'] == 2) {
                    if ($trace === 'new_basic') {
                        $perdaySalary = $allowance / $checkEntry['official_attendence'];
                        $salaryForTotalAttendance = $perdaySalary * $checkEntry['total_attendance'];
                        $leftDay = $checkEntry['official_attendence'] - $checkEntry['total_attendance'];
                        $salaryForLeftDay = $leftDay * $perdaySalary;
                        $halfSalaryForLeftDay = $salaryForLeftDay / 2;
                        $finalSalary = $salaryForTotalAttendance + $halfSalaryForLeftDay;
                        return $finalSalary;
                    } else {
                        return $allowance;
                    }
                } else {
                    if ($checkEntry['official_attendence'] > $checkEntry['total_attendance']):
                        $perUnit = $allowance / $checkEntry['official_attendence'];
                        $lastPay = $checkEntry['total_attendance'] * $perUnit;
                        return $lastPay;
                    endif;
                }
            } else {
                return $allowance;
            }
        } else {
            return $allowance;
        }
    }

}
