<?php

App::uses('AppController', 'Controller');

/**
 * Sallery Shit
 *
 * @property Employee $Employee
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class SalarySheetsController extends AppController {

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
        $all_emp = $this->Employee->find('all');
        $this->loadModel('MonthlyOthersEnty');
        //pr($this->current_date());        die();
        // Bonus Configure Part
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
            //  pr($this->request->data);            die();
            $getYearOrMonth = $this->request->data['salarysheets'];
            if ($getYearOrMonth['fiscal_year_id'] != '' && isset($getYearOrMonth['month_id']) && $getYearOrMonth['month_id'] != 0) {
                $this->salary_process($this->request->data/* , $salaryTypesWithTrackingKey, $salaryTypesWithValue */);
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

    public function salary_process($emp_data = ''/* , $salaryTypesWithTrackingKey, $salaryTypesWithValue */) {
        $count_data = count($emp_data['employee_id']);

        if ($count_data >= 1 && !empty($emp_data['salarysheets']['fiscal_year_id']) && !empty($emp_data['salarysheets']['month_id'])) {
            $this->loadModel('EmployeeLoan');
            $this->loadModel('LoanRecovery');
            $this->loadModel('EmployeeSalarySheet');
            $this->Employee->recursive = 1;

            // $emp_info = array();
            // $emp_info=[];
            //pr($emp_data);die();
            foreach ($emp_data['employee_id'] as $key => $value) {
                //echo $key . '<br>' . $value;
                if ($value == 1) {
                    $arrayForEmp[$key]['employee_id'] = $key;
                    $arrayForEmp[$key]['house_build_recovery'] = 0;
                    $arrayForEmp[$key]['house_repair_recovery'] = 0;
                    $arrayForEmp[$key]['car_loan'] = 0;
                    $arrayForEmp[$key]['computer_loan'] = 0;
                    $arrayForEmp[$key]['bycycle_loan'] = 0;
                    $arrayForEmp[$key]['gpf_loan'] = 0;
                    $arrayForEmp[$key]['motorcycle_loan'] = 0;
                    $emp_loans[] = $this->EmployeeLoan->find('all', array(
                        'fields' => array('EmployeeLoan.id', 'EmployeeLoan.employee_id', 'EmployeeLoan.loan_amount', 'EmployeeLoan.current_due', 'EmployeeLoan.interest_amount', 'EmployeeLoan.installment_amount'),
                        'conditions' => array('EmployeeLoan.employee_id' => $key)));
                    $emp_info[] = $this->Employee->find('all', array('conditions' => array('Employee.id' => $key)));
                    $checkEmpOnSalarySheet[] = $this->EmployeeSalarySheet->find('all', array(
                        'fields' => array('EmployeeSalarySheet.id'),
                        'conditions' => array('EmployeeSalarySheet.employee_id' => $key, 'EmployeeSalarySheet.fiscal_year_id' => $emp_data['salarysheets']['fiscal_year_id'], 'EmployeeSalarySheet.month_id' => $emp_data['salarysheets']['month_id'])));
                }
                //
            }
            //$this->SaleTarget->create();
            // $data_array = array();
            $this->loadModel('GpfSubscription');
            $this->loadModel('MonthlyAttendanceEntry');

            foreach ($emp_info as $key => $val) {
                $empAllowace = $val[0]['EmployeeAllowance'];
                $empRecovery = $val[0]['EmployeeRecovery'];
                $countEmployeeLoan = count($val[0]['EmployeeLoan']);

                $gpfSubscription = $this->GpfSubscription->find('all', array('conditions' => array('GpfSubscription.employee_id' => $val[0]['Employee']['id']),
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
                        if ($emp_data['salarysheets']['fiscal_year_id'] > $loanval['recovery_year_id']) {
                            $checkFlag = 1;
                        } elseif ($emp_data['salarysheets']['fiscal_year_id'] == $loanval['recovery_year_id']) {
                            if ($emp_data['salarysheets']['month_id'] >= $loanval['recovery_start_month_id']) {
                                $checkFlag = 1;
                            } else {
                                $checkFlag = 0;
                            }
                        } else {
                            $checkFlag = 0;
                        }
                        if ($checkFlag == 1) {
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
                                    $temp = $loanval['installment_amount'] + $loanval['current_due'];
                                    $interest_amount_due = $loanval['interest_amount'] - $temp;
                                    $current_due = 0;
                                    $this->EmployeeLoan->updateAll(
                                            array('EmployeeLoan.current_due' => $current_due, 'EmployeeLoan.interest_amount' => $loanval['interest_amount'], 'EmployeeLoan.interest_amount_due' => $interest_amount_due), array('EmployeeLoan.id ' => $loanval['id'])
                                    );
                                    $loanRecoverydata['LoanRecovery']['recovery_loan_amount'] = $loanval['installment_amount'];
                                    $loanRecoverydata['LoanRecovery']['employee_loan_id'] = $emp_loans[$key][$j]['EmployeeLoan']['id'];
                                    $loanRecoverydata['LoanRecovery']['created_at'] = $this->current_datetime();
                                    $loanRecoverydata[] = $loanRecoverydata;
                                    $this->LoanRecovery->saveAll($loanRecoverydata);

                                    // pr($temp);pr($loanval['interest_amount']);pr($interest_amount_due);die();
                                    //$this->salary_sheet($loanval['loan_id'], $loanval['installment_amount'], $val, $emp_data);
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
                                        //$this->salary_sheet($loanval['loan_id'], $loanval['installment_amount'], $val, $emp_data);
                                    } else {
                                        $interest_amount_due = 0;
                                        //$this->salary_sheet($loanval['loan_id'], $loanval['interest_amount'], $val, $emp_data);
                                        $this->EmployeeLoan->updateAll(
                                                array('EmployeeLoan.interest_amount_due' => $interest_amount_due, 'EmployeeLoan.interest_amount' => $loanval['interest_amount']), array('EmployeeLoan.id ' => $loanval['id'])
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
                    $data['EmployeeSalarySheet']['current_basic'] = $this->partial_salary($emp_id, $year, $month, $val[0]['Scale']['grade_basic']);
                    $data['EmployeeSalarySheet']['current_basic'] = $data['EmployeeSalarySheet']['current_basic'] / 2;
                    $data['EmployeeSalarySheet']['convance'] = 0;
                } else {
                    $data['EmployeeSalarySheet']['current_basic'] = $this->partial_salary($emp_id, $year, $month, $val[0]['Scale']['grade_basic']);
                    $data['EmployeeSalarySheet']['convance'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['convence']);
                }
                $data['EmployeeSalarySheet']['da'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['da']); //$val[0]['EmployeeAllowance']['da'];
                $data['EmployeeSalarySheet']['pp'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['pp']); //$val[0]['EmployeeAllowance']['pp'];
                $data['EmployeeSalarySheet']['medical'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['medical']); //$val[0]['EmployeeAllowance']['medical'];
                $data['EmployeeSalarySheet']['tiffin'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['tiffin']); //$val[0]['EmployeeAllowance']['tiffin'];
                $data['EmployeeSalarySheet']['wash'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['wash']); //$val[0]['EmployeeAllowance']['wash'];
                $data['EmployeeSalarySheet']['mobile'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['mobile']); //$val[0]['EmployeeAllowance']['mobile'];
                $data['EmployeeSalarySheet']['cycle'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['cycle']);
                $data['EmployeeSalarySheet']['charge'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['charges']); //$val[0]['EmployeeAllowance']['charges'];
                $data['EmployeeSalarySheet']['other'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['others']); //$val[0]['EmployeeAllowance']['others'];
                $data['EmployeeSalarySheet']['house_rent'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['house_rent']); //$val[0]['EmployeeAllowance']['house_rent'];
                $data['EmployeeSalarySheet']['education'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['education']); //$val[0]['EmployeeAllowance']['education'];
                /* Employee  allowance end */

                /* Employee recovery start  */
                $data['EmployeeSalarySheet']['gpf'] = $val[0]['EmployeeRecovery']['gpf'];
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
                $data['EmployeeSalarySheet']['others_recovery'] = $this->others_recovery($emp_id, $year, $month, 4);
                /* Others recovery end  */

                //loan_recovery($emp_id, $fiscal_id, $month_id, $loan_id, $salary_types, $religion)
                $data['EmployeeSalarySheet']['house_build_recovery'] = $this->loan_recovery($emp_id, $year, $month, 4, $this->request->data['salarysheets']['salary_types'], $val[0]['Religion']['id'], $val[0]['Employee']['festival_recovery']);
                $data['EmployeeSalarySheet']['house_repair_recovery'] = $this->loan_recovery($emp_id, $year, $month, 7, $this->request->data['salarysheets']['salary_types'], $val[0]['Religion']['id'], $val[0]['Employee']['festival_recovery']);
                $data['EmployeeSalarySheet']['car_loan'] = $this->loan_recovery($emp_id, $year, $month, 9, $this->request->data['salarysheets']['salary_types'], $val[0]['Religion']['id'], $val[0]['Employee']['festival_recovery']);
                $data['EmployeeSalarySheet']['computer_loan'] = $this->loan_recovery($emp_id, $year, $month, 5, $this->request->data['salarysheets']['salary_types'], $val[0]['Religion']['id'], $val[0]['Employee']['festival_recovery']);
                $data['EmployeeSalarySheet']['bycycle_loan'] = $this->loan_recovery($emp_id, $year, $month, 10, $this->request->data['salarysheets']['salary_types'], $val[0]['Religion']['id'], $val[0]['Employee']['festival_recovery']);
                $data['EmployeeSalarySheet']['gpf_loan'] = $this->loan_recovery($emp_id, $year, $month, 6, $this->request->data['salarysheets']['salary_types'], $val[0]['Religion']['id'], $val[0]['Employee']['festival_recovery']);
                $data['EmployeeSalarySheet']['motorcycle_loan'] = $this->loan_recovery($emp_id, $year, $month, 8, $this->request->data['salarysheets']['salary_types'], $val[0]['Religion']['id'], $val[0]['Employee']['festival_recovery']);

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

        if ($current_due == 0) {
            //Loan amount is ZERO

            if (empty($second_installment_amount) && empty($second_installment_date)) {
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
    }

    private function __get_installment_number($installment_date = null) {
        $diff = abs(strtotime($installment_date) - strtotime($this->current_date()));
        $years = floor($diff / (365 * 60 * 60 * 24));
        $months = floor(($diff - $years * 365 * 60 * 60 * 24) / (30 * 60 * 60 * 24));
        $days = floor(($diff - $years * 365 * 60 * 60 * 24 - $months * 30 * 60 * 60 * 24) / (60 * 60 * 24));

        if ($days == 0) {

            return $months;
        } else {
            return $months + 1;
        }
    }

    private function __get_interest_amount($installment = null, $amount_interest_cal = null, $interest_rt = null) {

        $interest_amount = round(($amount_interest_cal * ($installment + 1) * $interest_rt) / 2400, 2);

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
                    $initilize = $entryValue['MonthlyOthersEnty']['electric_bill'];
                } elseif ($otherRecoveryType == 2) {
                    $sumOfRecovery = $initilize + $entryValue['MonthlyOthersEnty']['telephone_bill'];
                    $initilize = $entryValue['MonthlyOthersEnty']['telephone_bill'];
                } elseif ($otherRecoveryType == 3) {
                    $sumOfRecovery = $initilize + $entryValue['MonthlyOthersEnty']['rent_a_car_bill'];
                    $initilize = $entryValue['MonthlyOthersEnty']['rent_a_car_bill'];
                } elseif ($otherRecoveryType == 4) {
                    $sumOfRecovery = $initilize + $entryValue['MonthlyOthersEnty']['others'];
                    $initilize = $entryValue['MonthlyOthersEnty']['others'];
                }
            }
            return $sumOfRecovery;
        } else {
            return 0;
        }
    }

    public function cutting_employee_recovery($emp_id, $fiscal_id, $month_id, $loan_id) {
        $loanRecovery = $this->LoanRecovery->find('all', array(
            'conditions' => array(
                'LoanRecovery.employee_id' => $emp_id,
                'LoanRecovery.fiscal_year_id' => $fiscal_id,
                'LoanRecovery.month_id' => $month_id,
                'LoanRecovery.loan_id' => $loan_id,
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
                $initilize = $loanValue['LoanRecovery']['recovery_loan_amount'];
            }
            return $sumOfRecovery;
        } else {
            return 0;
        }
    }

    public function loan_recovery($emp_id, $fiscal_id, $month_id, $loan_id, $salary_types, $religion, $festival_recovery) {
        if ($salary_types == 31) {
            $catchRecoveryDaya = $this->cutting_employee_recovery($emp_id, $fiscal_id, $month_id, $loan_id);
            return $catchRecoveryDaya;
        } else {
            if ($festival_recovery == 0) {//Loan off for employee 
                return 0;
            } else {//Loan effective for employee
                if ($religion == 1 && $salary_types == 33) {//Loan effective for muslim
                    $catchRecoveryDaya = $this->cutting_employee_recovery($emp_id, $fiscal_id, $month_id, $loan_id);
                    return $catchRecoveryDaya;
                } else if ($religion == 2 && $salary_types == 34) {
                    $catchRecoveryDaya = $this->cutting_employee_recovery($emp_id, $fiscal_id, $month_id, $loan_id);
                    return $catchRecoveryDaya;
                } else if ($religion == 3 && $salary_types == 35) {
                    $catchRecoveryDaya = $this->cutting_employee_recovery($emp_id, $fiscal_id, $month_id, $loan_id);
                    return $catchRecoveryDaya;
                } else if ($religion == 4 && $salary_types == 36) {
                    $catchRecoveryDaya = $this->cutting_employee_recovery($emp_id, $fiscal_id, $month_id, $loan_id);
                    return $catchRecoveryDaya;
                } else if ($salary_types == 32) {
                    $catchRecoveryDaya = $this->cutting_employee_recovery($emp_id, $fiscal_id, $month_id, $loan_id);
                    return $catchRecoveryDaya;
                }
            }
        }
    }

    public function partial_salary($emp_id, $year, $month, $allowance) {
        $monthlyAttendanceEntry = $this->MonthlyAttendanceEntry->find('first', array('conditions' =>
            array(
                'MonthlyAttendanceEntry.employee_id' => $emp_id,
                'MonthlyAttendanceEntry.fiscal_year_id' => $year,
                'MonthlyAttendanceEntry.month_id' => $month
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

}
