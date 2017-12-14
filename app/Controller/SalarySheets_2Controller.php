<?php

App::uses('AppController', 'Controller');

/**
 * Sallery Shit
 *
 * @property Employee $Employee
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class SalarySheets_2Controller extends AppController {

    public $uses = array();

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
        $this->set('page_title', 'Sallery Shit');
        $this->loadModel('Employee');
        $this->loadModel('FiscalYear');
        $this->FiscalYear->recursive = -1;
        $fiscalYearData = $this->FiscalYear->find('list');
        $all_emp = $this->Employee->find('all');
        $this->loadModel('MonthlyOthersEnty');
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
        // pr($newArray);
        // die();
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
            $this->loadModel('Employee');
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

            foreach ($emp_info as $key => $val) {

                /* pr($this->request->data);
                  pr($val);
                  pr($val[0]['Employee']['festival_recovery']);
                  pr($sumOfRecovery);
                  pr($loanRecovery);
                  die(); */
                //$this->loan_recovery($emp_data['salarysheets']['fiscal_year_id'], $emp_data['salarysheets']['month_id'], 4, $val[0]['Employee']['id']);
                //die();

                $empAllowace = $val[0]['EmployeeAllowance'];
                $empRecovery = $val[0]['EmployeeRecovery'];
                $countEmployeeLoan = count($val[0]['EmployeeLoan']);
                //pr($val[0]);die();
                /* GpfSubscription start */
                $this->loadModel('GpfSubscription');


                /* MonthlyAttendanceEntry start   */
                $this->loadModel('MonthlyAttendanceEntry');
                //pr($monthlyAttendanceEntry);
                //die();
                /* MonthlyAttendanceEntry finish */


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
                        $loanRecoverydata['LoanRecovery']['month_id'] = $emp_data['salarysheets']['month_id'];
                        $loanRecoverydata['LoanRecovery']['fiscal_year_id'] = $emp_data['salarysheets']['fiscal_year_id'];
                        $loanRecoverydata['LoanRecovery']['loan_id'] = $loanval['loan_id'];
                        $loanRecoverydata['LoanRecovery']['employee_id'] = $loanval['employee_id'];
                        //pr($loanval); die();
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
                                }
                                $temp = $loanval['interest_amount_due'] + $loanval['current_due'];
                                $interst_amount = $temp - $loanval['installment_amount'];
                                $current_due = 0;
                                $this->EmployeeLoan->updateAll(
                                        array('EmployeeLoan.current_due' => $current_due, 'EmployeeLoan.interest_amount_due' => $interst_amount), array('EmployeeLoan.id ' => $loanval['id'])
                                );
                                $loanRecoverydata['LoanRecovery']['recovery_loan_amount'] = $loanval['installment_amount'];
                                $loanRecoverydata['LoanRecovery']['employee_loan_id'] = $emp_loans[$key][$j]['EmployeeLoan']['id'];
                                $loanRecoverydata['LoanRecovery']['created_at'] = $this->current_datetime();
                                $loanRecoverydata[] = $loanRecoverydata;
                                $this->LoanRecovery->saveAll($loanRecoverydata);

                                //pr($loanval);die();
                                //$this->salary_sheet($loanval['loan_id'], $loanval['installment_amount'], $val, $emp_data);
                            }
                        } else {

                            /* current due, interest ammount, total pay calculation  start */
                            if ($loanval['interest_amount'] == 0) {
                                $loanval['interest_amount_due'] = $this->interest_calculation($loanval);
                                //$loanval['interest_amount_due'] = $this->interest_calculation($loanval);
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
                                            array('EmployeeLoan.interest_amount_due' => $interest_amount_due), array('EmployeeLoan.id ' => $loanval['id'])
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
                                            array('EmployeeLoan.interest_amount_due' => $interest_amount_due), array('EmployeeLoan.id ' => $loanval['id'])
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
                                    $gpf['GpfSubscription']['subscription_recovery'] = 0;
                                    $gpf['GpfSubscription']['loan_recovery'] = $loanval['current_due'];
                                    $loan_interest_recovery = $loanval['installment_amount'] - $loanval['current_due'];
                                    $gpf['GpfSubscription']['total_subscription_balance'] = $gpf['GpfSubscription']['total_subscription_balance'] + $loanval['current_due'] + $loan_interest_recovery;
                                    $gpf['GpfSubscription']['loan_interest_recovery'] = $loan_interest_recovery;
                                    $gpf['GpfSubscription']['employee_loan_id'] = $emp_loans[$key][$j]['EmployeeLoan']['id'];
                                    $gpf['GpfSubscription']['loan_interest_amount'] = 0;
                                    $gpf['GpfSubscription']['sub_status'] = 2;
                                    $gpfdata[] = $gpf;
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
                        $j++;
                    }
                endif;
                // die();
                // $totalAllowance = $val[0]['Scale']['grade_basic'] + $empAllowace['da'] + $empAllowace['pp'] + $empAllowace['medical'] + $empAllowace['convence'] + $empAllowace['tiffin'] + $empAllowace['wash'] + $empAllowace['mobile'] + $empAllowace['charges'] + $empAllowace['others'] + $empAllowace['house_rent'] + $empAllowace['education'];
                //  $totalRecovery = $empRecovery['gpf'] + $empRecovery['gpf_recovery'] + $empRecovery['fixed_house_rent'] + $empRecovery['water_supply'] + $empRecovery['bf'] + $empRecovery['gi'] + $empRecovery['gi_recovery'] + $empRecovery['tin_shed'] + 0;
                // $netPay = $totalAllowance - $totalRecovery;
            }
            $loanRecoveries = $this->LoanRecovery->find('all', array(
                'conditions' => array('LoanRecovery.fiscal_year_id' => $emp_data['salarysheets']['fiscal_year_id'], 'LoanRecovery.month_id' => $emp_data['salarysheets']['month_id'])));
            $i = 0;
            //pr($loanRecoveries);                            
            foreach ($loanRecoveries as $lrkey => $lrValue) {
                //pr($lrValue);die();
                $emplyoee_id_collect[] = $lrValue['EmployeeLoan']['employee_id'];
                $storeData[$i]['employee_id'] = $lrValue['EmployeeLoan']['employee_id'];
                $storeData[$i]['house_build_recovery'] = ($lrValue['Loan']['id'] == 4) ? $lrValue['LoanRecovery']['recovery_loan_amount'] : 0;
                $storeData[$i]['house_repair_recovery'] = ($lrValue['Loan']['id'] == 7) ? $lrValue['LoanRecovery']['recovery_loan_amount'] : 0;
                $storeData[$i]['car_loan'] = ($lrValue['Loan']['id'] == 9) ? $lrValue['LoanRecovery']['recovery_loan_amount'] : 0;
                $storeData[$i]['computer_loan'] = ($lrValue['Loan']['id'] == 5) ? $lrValue['LoanRecovery']['recovery_loan_amount'] : 0;
                $storeData[$i]['bycycle_loan'] = ($lrValue['Loan']['id'] == 10) ? $lrValue['LoanRecovery']['recovery_loan_amount'] : 0;
                $storeData[$i]['gpf_loan'] = ($lrValue['Loan']['id'] == 6) ? $lrValue['LoanRecovery']['recovery_loan_amount'] : 0;
                $storeData[$i]['motorcycle_loan'] = ($lrValue['Loan']['id'] == 8) ? $lrValue['LoanRecovery']['recovery_loan_amount'] : 0;
                $i++;
            }
            // pr($storeData);die();
            if (!empty($storeData[0])):
                $final_array = array($storeData[0]);
                for ($i = 1; $i < sizeof($storeData); $i++) {
                    $k = -1;
                    foreach ($final_array as $key => $valf) {
                        if ($storeData[$i]['employee_id'] == $valf['employee_id']) {
                            $k = $key;
                            break;
                        }
                    }

                    if ($k == -1) {
                        array_push($final_array, $storeData[$i]);
                    } else {
                        $final_array[$k]['house_build_recovery'] += $storeData[$i]['house_build_recovery'];
                        $final_array[$k]['house_repair_recovery'] += $storeData[$i]['house_repair_recovery'];
                        $final_array[$k]['car_loan'] += $storeData[$i]['car_loan'];
                        $final_array[$k]['computer_loan'] += $storeData[$i]['computer_loan'];
                        $final_array[$k]['bycycle_loan'] += $storeData[$i]['bycycle_loan'];
                        $final_array[$k]['gpf_loan'] += $storeData[$i]['gpf_loan'];
                        $final_array[$k]['motorcycle_loan'] += $storeData[$i]['motorcycle_loan'];
                    }
                }

                //pr($final_array);die();
                foreach ($final_array as $va) {
                    $last_final_array[$va['employee_id']]['employee_id'] = $va['employee_id'];
                    $last_final_array[$va['employee_id']]['house_build_recovery'] = $va['house_build_recovery'];
                    $last_final_array[$va['employee_id']]['house_repair_recovery'] = $va['house_repair_recovery'];
                    $last_final_array[$va['employee_id']]['car_loan'] = $va['car_loan'];
                    $last_final_array[$va['employee_id']]['computer_loan'] = $va['computer_loan'];
                    $last_final_array[$va['employee_id']]['bycycle_loan'] = $va['bycycle_loan'];
                    $last_final_array[$va['employee_id']]['gpf_loan'] = $va['gpf_loan'];
                    $last_final_array[$va['employee_id']]['motorcycle_loan'] = $va['motorcycle_loan'];
                }

                foreach ($last_final_array as $last_key => $last_value) {
                    //pr($last_value);
                    $arrayForEmp[$last_key]['employee_id'] = $last_value['employee_id'];
                    $arrayForEmp[$last_key]['house_build_recovery'] = $last_value['house_build_recovery'];
                    $arrayForEmp[$last_key]['house_repair_recovery'] = $last_value['house_repair_recovery'];
                    $arrayForEmp[$last_key]['car_loan'] = $last_value['car_loan'];
                    $arrayForEmp[$last_key]['computer_loan'] = $last_value['computer_loan'];
                    $arrayForEmp[$last_key]['bycycle_loan'] = $last_value['bycycle_loan'];
                    $arrayForEmp[$last_key]['gpf_loan'] = $last_value['gpf_loan'];
                    $arrayForEmp[$last_key]['motorcycle_loan'] = $last_value['motorcycle_loan'];
                }

                //  pr($arrayForEmp);
                $m = 0;
                foreach ($arrayForEmp as $emvalue) {
                    $finshArray[$m]['employee_id'] = $emvalue['employee_id'];
                    $finshArray[$m]['house_build_recovery'] = $emvalue['house_build_recovery'];
                    $finshArray[$m]['house_repair_recovery'] = $emvalue['house_repair_recovery'];
                    $finshArray[$m]['car_loan'] = $emvalue['car_loan'];
                    $finshArray[$m]['computer_loan'] = $emvalue['computer_loan'];
                    $finshArray[$m]['bycycle_loan'] = $emvalue['bycycle_loan'];
                    $finshArray[$m]['gpf_loan'] = $emvalue['gpf_loan'];
                    $finshArray[$m]['motorcycle_loan'] = $emvalue['motorcycle_loan'];
                    $m++;
                }

                //Marge two arrays
                $marge_array = array_merge($last_final_array, $arrayForEmp);

//Now call array_sync
                $latest_array = $this->array_sync($marge_array);


            endif;
//$this->request->data['salarysheets']['salary_types'];
            foreach ($emp_info as $key => $val) {
                // pr($val[0]);die();
                // Bonus Part
                /* foreach ($salaryTypesWithTrackingKey as $bonusKey => $bonusValue) {
                  if ($this->request->data['salarysheets']['salary_types'] == 32) {
                  $data['EmployeeSalarySheet']['bonus'] = ($val[0]['Scale']['grade_basic'] * $salaryTypesWithValue[32]) / 100;
                  $data['EmployeeSalarySheet']['bonus_type'] = $bonusKey;
                  }
                  if ($this->request->data['salarysheets']['salary_types'] == 33 && $val[0]['Employee']['religion_id'] == 1) {
                  $data['EmployeeSalarySheet']['bonus'] = ($val[0]['Scale']['grade_basic'] * $salaryTypesWithValue[33]) / 100;
                  $data['EmployeeSalarySheet']['bonus_type'] = $bonusKey;
                  }
                  if ($this->request->data['salarysheets']['salary_types'] == 34 && $val[0]['Employee']['religion_id'] == 2) {
                  $data['EmployeeSalarySheet']['bonus'] = ($val[0]['Scale']['grade_basic'] * $salaryTypesWithValue[34]) / 100;
                  $data['EmployeeSalarySheet']['bonus_type'] = $bonusKey;
                  }
                  if ($this->request->data['salarysheets']['salary_types'] == 35 && $val[0]['Employee']['religion_id'] == 3) {
                  $data['EmployeeSalarySheet']['bonus'] = ($val[0]['Scale']['grade_basic'] * $salaryTypesWithValue[35]) / 100;
                  $data['EmployeeSalarySheet']['bonus_type'] = $bonusKey;
                  }
                  if ($this->request->data['salarysheets']['salary_types'] == 36 && $val[0]['Employee']['religion_id'] == 4) {
                  $data['EmployeeSalarySheet']['bonus'] = ($val[0]['Scale']['grade_basic'] * $salaryTypesWithValue[36]) / 100;
                  $data['EmployeeSalarySheet']['bonus_type'] = $bonusKey;
                  } if ($this->request->data['salarysheets']['salary_types'] == 31) {
                  $data['EmployeeSalarySheet']['bonus'] = 0;
                  $data['EmployeeSalarySheet']['bonus_type'] = 0;
                  }
                  } */
                // Bonus Part end
                $this->request->data['EmployeeSalarySheet']['created_at'] = $this->current_datetime();
                $data['EmployeeSalarySheet']['created_at'] = $this->current_datetime();
                $emp_id = $val[0]['EmployeeRecovery']['employee_id'];
                $year = $emp_data['salarysheets']['fiscal_year_id'];
                $month = $emp_data['salarysheets']['month_id'];
                $data['EmployeeSalarySheet']['employee_id'] = $val[0]['Employee']['id'];
                $data['EmployeeSalarySheet']['current_basic'] = $this->partial_salary($emp_id, $year, $month, $val[0]['Scale']['grade_basic']); //$val[0]['Scale']['grade_basic'];

                /* Employee allowance start */
                if ($val[0]['Employee']['job_status_id'] == 2) {
                    $data['EmployeeSalarySheet']['new_basic_salary'] = $this->partial_salary($emp_id, $year, $month, $val[0]['Employee']['new_basic']);
                    $data['EmployeeSalarySheet']['new_basic_salary'] = $data['EmployeeSalarySheet']['new_basic_salary'] / 2;
                    $data['EmployeeSalarySheet']['convance'] = 0;
                } else {
                    $data['EmployeeSalarySheet']['new_basic_salary'] = $this->partial_salary($emp_id, $year, $month, $val[0]['Employee']['new_basic']);
                    $data['EmployeeSalarySheet']['convance'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['convence']);
                }
                $data['EmployeeSalarySheet']['da'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['da']); //$val[0]['EmployeeAllowance']['da'];
                $data['EmployeeSalarySheet']['pp'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['pp']); //$val[0]['EmployeeAllowance']['pp'];
                $data['EmployeeSalarySheet']['medical'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['medical']); //$val[0]['EmployeeAllowance']['medical'];
                $data['EmployeeSalarySheet']['tiffin'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['tiffin']); //$val[0]['EmployeeAllowance']['tiffin'];
                $data['EmployeeSalarySheet']['wash'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['wash']); //$val[0]['EmployeeAllowance']['wash'];
                $data['EmployeeSalarySheet']['mobile'] = $this->partial_salary($emp_id, $year, $month, $val[0]['EmployeeAllowance']['mobile']); //$val[0]['EmployeeAllowance']['mobile'];
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

                /* Loan recovery start */ /*
                  // $data['EmployeeSalarySheet']['extra_loan'] = 0; //$this->loan_recovery($emp_data['salarysheets']['fiscal_year_id'], $emp_data['salarysheets']['month_id'], 7, $val[0]['Employee']['id']);
                  $data['EmployeeSalarySheet']['house_build_recovery'] = isset($finshArray[$key]['house_build_recovery']) ? $finshArray[$key]['house_build_recovery'] : 0;
                  $data['EmployeeSalarySheet']['house_repair_recovery'] = isset($finshArray[$key]['house_repair_recovery']) ? $finshArray[$key]['house_repair_recovery'] : 0;
                  $data['EmployeeSalarySheet']['car_loan'] = isset($finshArray[$key]['car_loan']) ? $finshArray[$key]['car_loan'] : 0;
                  $data['EmployeeSalarySheet']['computer_loan'] = isset($finshArray[$key]['computer_loan']) ? $finshArray[$key]['computer_loan'] : 0;
                  $data['EmployeeSalarySheet']['extra_loan'] = isset($finshArray[$key]['extra_loan']) ? $finshArray[$key]['extra_loan'] : 0;
                  $data['EmployeeSalarySheet']['gpf_loan'] = isset($finshArray[$key]['gpf_loan']) ? $finshArray[$key]['gpf_loan'] : 0;
                  $data['EmployeeSalarySheet']['motorcycle_loan'] = isset($finshArray[$key]['motorcycle_loan']) ? $finshArray[$key]['motorcycle_loan'] : 0;
                 */ /* Loan recovery end */


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
                $data['EmployeeSalarySheet']['gross_pay'] = $emp_ss['current_basic'] + $emp_ss['da'] + $emp_ss['pp'] + $emp_ss['medical'] + $emp_ss['convance'] + $emp_ss['tiffin'] + $emp_ss['wash'] + $emp_ss['mobile'] + $emp_ss['charge'] + $emp_ss['house_rent'] + $emp_ss['education'];

                $total_recovery = $emp_ss['gpf'] + $emp_ss['gpf_loan'] + $emp_ss['house_build_recovery'] + $emp_ss['house_repair_recovery'] + $emp_ss['computer_loan'] + $emp_ss['fixed_house_rent_recovery'] + $emp_ss['water_supply_recovery'] + $emp_ss['electricity_recovery'] + $emp_ss['bf_recovery'] + $emp_ss['gi'] + $emp_ss['emp_tax'] + $emp_ss['tin_shade_recovery'] + $emp_ss['others_recovery'] + $emp_ss['telephone_recovery'] + $emp_ss['vehicle_recovery'] + $emp_ss['motorcycle_loan'] + $emp_ss['car_loan'] + $emp_ss['bycycle_loan'];

                $data['EmployeeSalarySheet']['net_pay'] = $data['EmployeeSalarySheet']['gross_pay'] - $total_recovery;
//};
                // $data['EmployeeSalarySheet']['net_pay'] = !empty($netPay) ? $netPay : 0;
                /* calculation part end */

                $data_array[] = $data;
                //die();
                $this->EmployeeSalarySheet->saveAll($data_array);

                $data_array = [];
            }
            //$pickLoanData = $this->LoanRecovery->find('all', array(
            //   'fields' => array('LoanRecovery.recovery_loan_amount'),
            // 'conditions' => array('EmployeeLoan.fiscal_year_id' => $emp_data['salarysheets']['fiscal_year_id'],'EmployeeLoan.month_id' => $emp_data['month_id'],'EmployeeLoan.employee_id' => $key)));


            /* if (count($checkEmpOnSalarySheet[0]) == 0):
              foreach ($emp_info as $key => $val):
              pr($val);
              endforeach;
              endif; */
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
        $day = substr($loanval['loan_approved_date'], -2);
        if ($loanval['current_due'] == 0 && $loanval['status'] == 0) {
            $loanval['current_due'] = $loanval['current_due'];
        } else {
            $loanval['current_due'] = $loanval['loan_amount'];
        }
        $interest_rate_arr = $this->__interest_rate($loanval['loan_type_id']);
        $interest_rt = $interest_rate_arr[0]['LoanType']['interest_rate'];


        if ($day == '01') {
            $interest_amount_data = round(($loanval['loan_amount'] * ($loanval['number_of_installment'] + 1 ) * $interest_rt) / 2400, 2);
        } else {
            $interest_amount_data = ($loanval['loan_amount'] * ($loanval['number_of_installment'] + 1 ) * $interest_rt) / 2400;

            $oneDayInterest = ( $loanval['number_of_installment'] * 31 ) / $interest_amount_data;

            $extra_day_interest = $oneDayInterest * $day;

            $interest_amount_data = round($interest_amount_data + $extra_day_interest, 2);
            $total_payable = $interest_amount_data + $loanval['loan_amount'];
        }
        $this->EmployeeLoan->updateAll(
                array('EmployeeLoan.interest_amount' => $interest_amount_data,
            /* 'EmployeeLoan.total_payable' => $total_payable, */ 'EmployeeLoan.interest_amount_due' => $interest_amount_data), array('EmployeeLoan.id ' => $loanval['id'])
        );
        return $interest_amount_data;
    }

    private function __interest_rate($id = null) {
        $this->loadModel('LoanType');
        $this->LoanType->recursive = -1;
        $interest_rate = $this->LoanType->find('all', array('fields' => array('interest_rate'), 'conditions' => array('LoanType.id' => $id)));
        return $interest_rate;
    }

    public function array_sync($a) {

        $final_array = array($a[0]);

        for ($i = 1; $i < sizeof($a); $i++) {

            $k = -1;
            foreach ($final_array as $key => $valn) {
                if ($a[$i]['employee_id'] == $valn['employee_id']) {
                    //echo $val['employee_id'];
                    $k = $key;
                    break;
                }
            }


            if ($k == -1) {
                array_push($final_array, $a[$i]);
            } else {
                $final_array[$k]['house_build_recovery'] += $a[$i]['house_build_recovery'];
                $final_array[$k]['house_repair_recovery'] += $a[$i]['house_repair_recovery'];
                $final_array[$k]['car_loan'] += $a[$i]['car_loan'];
                $final_array[$k]['computer_loan'] += $a[$i]['computer_loan'];
                $final_array[$k]['bycycle_loan'] += $a[$i]['bycycle_loan'];
                $final_array[$k]['gpf_loan'] += $a[$i]['gpf_loan'];
                $final_array[$k]['motorcycle_loan'] += $a[$i]['motorcycle_loan'];
            }
        }


        return $final_array;
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
        $loanRecovery = $this->LoanRecovery->find('first', array(
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
