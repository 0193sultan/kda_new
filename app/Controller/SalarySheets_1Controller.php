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
        if ($this->request->is('post')) {
            // pr($this->request->data);
            //die();
            $this->salary_process($this->request->data);
        }
        $this->set('employeeData', $all_emp);
        $this->set('fiscalYearData', $fiscalYearData);
    }

    public function salary_process($emp_data = '') {
        $count_data = count($emp_data['employee_id']);

        if ($count_data >= 1) {
            $this->loadModel('Employee');
            $this->loadModel('EmployeeLoan');
            $this->loadModel('LoanRecovery');
            $this->loadModel('EmployeeSalarySheet');
            $this->Employee->recursive = 1;

            // $emp_info = array();
            // $emp_info=[];
            // pr($emp_data);
            // die();
            foreach ($emp_data['employee_id'] as $key => $value) {
                //echo $key . '<br>' . $value;
                if ($value == 1) {
                    $arrayForEmp[$key]['employee_id'] = $key;
                    $arrayForEmp[$key]['house_build_recovery'] = 0;
                    $arrayForEmp[$key]['house_repair_recovery'] = 0;
                    $arrayForEmp[$key]['car_loan'] = 0;
                    $arrayForEmp[$key]['computer_loan'] = 0;
                    $arrayForEmp[$key]['extra_loan'] = 0;
                    $arrayForEmp[$key]['gpf_loan'] = 0;

                    $emp_loans[] = $this->EmployeeLoan->find('all', array(
                        'fields' => array('EmployeeLoan.employee_id', 'EmployeeLoan.loan_amount', 'EmployeeLoan.current_due', 'EmployeeLoan.interest_amount', 'EmployeeLoan.installment_amount'),
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
            // pr(array_merge($last_final_array,$arrayForEmp));
            //$formated_array = array_count_values($emplyee_id_collect);
            // pr($formated_array);
            // pr($storeData);
            //die();
            //pr(count($checkEmpOnSalarySheet[0]));
            // pr($emp_info);
            //die();
            foreach ($emp_info as $key => $val) {
                //echo $key; die();
                //$this->loan_recovery($emp_data['salarysheets']['fiscal_year_id'], $emp_data['salarysheets']['month_id'], 4, $val[0]['Employee']['id']);
                //die();
                $empAllowace = $val[0]['EmployeeAllowance'];
                $empRecovery = $val[0]['EmployeeRecovery'];
                $countEmployeeLoan = count($val[0]['EmployeeLoan']);
                if ($countEmployeeLoan > 0):
                    foreach ($val[0]['EmployeeLoan'] as $loanKey => $loanval) {
                       // pr($loanval);
                        $loanRecoverydata['LoanRecovery']['month_id'] = $emp_data['salarysheets']['month_id'];
                        $loanRecoverydata['LoanRecovery']['fiscal_year_id'] = $emp_data['salarysheets']['fiscal_year_id'];
                        $loanRecoverydata['LoanRecovery']['loan_id'] = $loanval['loan_id'];
                        $loanRecoverydata['LoanRecovery']['employee_id'] = $loanval['employee_id'];
                        if ($loanval['current_due'] != 0) {
                            if ($loanval['current_due'] >= $loanval['installment_amount']) {
                                $current_due = $loanval['current_due'] - $loanval['installment_amount'];
                                echo $current_due;
                                //die();
                                $this->EmployeeLoan->updateAll(
                                        array('EmployeeLoan.current_due' => $current_due), array('EmployeeLoan.id ' => $loanval['id'])
                                );
                                $loanRecoverydata['LoanRecovery']['recovery_loan_amount'] = $loanval['installment_amount'];
                                $loanRecoverydata[] = $loanRecoverydata;
                                $this->LoanRecovery->saveAll($loanRecoverydata);
                                //$this->salary_sheet($loanval['loan_id'], $loanval['installment_amount'], $val, $emp_data);
                            } else {
                                $temp = $loanval['interest_amount'] + $loanval['current_due'];
                                $interst_amount = $temp - $loanval['installment_amount'];
                                $current_due = 0;
                                $this->EmployeeLoan->updateAll(
                                        array('EmployeeLoan.current_due' => $current_due, 'EmployeeLoan.interest_amount' => $interst_amount), array('EmployeeLoan.id ' => $loanval['id'])
                                );
                                $loanRecoverydata['LoanRecovery']['recovery_loan_amount'] = $loanval['installment_amount'];
                                $loanRecoverydata[] = $loanRecoverydata;
                                $this->LoanRecovery->saveAll($loanRecoverydata);
                                //$this->salary_sheet($loanval['loan_id'], $loanval['installment_amount'], $val, $emp_data);
                            }
                        } else {
                            if ($loanval['interest_amount'] != 0):
                                if ($loanval['interest_amount'] >= $loanval['installment_amount']) {
                                    $interest_amount = $loanval['interest_amount'] - $loanval['installment_amount'];
                                    $this->EmployeeLoan->updateAll(
                                            array('EmployeeLoan.interest_amount' => $interest_amount), array('EmployeeLoan.id ' => $loanval['id'])
                                    );
                                    $loanRecoverydata['LoanRecovery']['recovery_loan_amount'] = $loanval['installment_amount'];
                                    $loanRecoverydata[] = $loanRecoverydata;
                                    $this->LoanRecovery->saveAll($loanRecoverydata);
                                    //$this->salary_sheet($loanval['loan_id'], $loanval['installment_amount'], $val, $emp_data);
                                } else {
                                    $interest_amount = 0;
                                    //$this->salary_sheet($loanval['loan_id'], $loanval['interest_amount'], $val, $emp_data);
                                    $this->EmployeeLoan->updateAll(
                                            array('EmployeeLoan.interest_amount' => $interest_amount), array('EmployeeLoan.id ' => $loanval['id'])
                                    );
                                    $loanRecoverydata['LoanRecovery']['recovery_loan_amount'] = $loanval['interest_amount'];
                                    $loanRecoverydata[] = $loanRecoverydata;
                                    $this->LoanRecovery->saveAll($loanRecoverydata);
                                }
                            endif;
                        }
                    }
                endif;
                // $totalAllowance = $val[0]['Scale']['grade_basic'] + $empAllowace['da'] + $empAllowace['pp'] + $empAllowace['medical'] + $empAllowace['convence'] + $empAllowace['tiffin'] + $empAllowace['wash'] + $empAllowace['mobile'] + $empAllowace['charges'] + $empAllowace['others'] + $empAllowace['house_rent'] + $empAllowace['education'];
                //  $totalRecovery = $empRecovery['gpf'] + $empRecovery['gpf_recovery'] + $empRecovery['fixed_house_rent'] + $empRecovery['water_supply'] + $empRecovery['bf'] + $empRecovery['gi'] + $empRecovery['gi_recovery'] + $empRecovery['tin_shed'] + 0;
                // $netPay = $totalAllowance - $totalRecovery;
            }
            $loanRecoveries = $this->LoanRecovery->find('all', array(
                'conditions' => array('LoanRecovery.fiscal_year_id' => $emp_data['salarysheets']['fiscal_year_id'], 'LoanRecovery.month_id' => $emp_data['salarysheets']['month_id'])));
            $i = 0;
                         //   pr($loanRecoveries);                            die();
            foreach ($loanRecoveries as $lrkey => $lrValue) {
                //pr($lrValue);
                $emplyoee_id_collect[] = $lrValue['Employee']['id'];
                $storeData[$i]['employee_id'] = $lrValue['Employee']['id'];
                $storeData[$i]['house_build_recovery'] = ($lrValue['Loan']['id'] == 4) ? $lrValue['LoanRecovery']['recovery_loan_amount'] : 0;
                $storeData[$i]['house_repair_recovery'] = ($lrValue['Loan']['id'] == 8) ? $lrValue['LoanRecovery']['recovery_loan_amount'] : 0;
                $storeData[$i]['car_loan'] = ($lrValue['Loan']['id'] == 7) ? $lrValue['LoanRecovery']['recovery_loan_amount'] : 0;
                $storeData[$i]['computer_loan'] = ($lrValue['Loan']['id'] == 5) ? $lrValue['LoanRecovery']['recovery_loan_amount'] : 0;
                $storeData[$i]['extra_loan'] = ($lrValue['Loan']['id'] == 9) ? $lrValue['LoanRecovery']['recovery_loan_amount'] : 0;
                $storeData[$i]['gpf_loan'] = ($lrValue['Loan']['id'] == 6) ? $lrValue['LoanRecovery']['recovery_loan_amount'] : 0;
                $i++;
            }
                      //  pr($storeData);die();
            if (!empty($storeData[0])):
                $final_array = array($storeData[0]);
                for ($i = 1; $i < sizeof($storeData); $i++) {

                    $k = -1;
                    foreach ($final_array as $key => $valf) {
                        if ($storeData[$i]['employee_id'] == $valf['employee_id']) {
                            //echo $val['employee_id'];
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
                        $final_array[$k]['extra_loan'] += $storeData[$i]['extra_loan'];
                        $final_array[$k]['gpf_loan'] += $storeData[$i]['gpf_loan'];
                    }
                }
                foreach ($final_array as $va) {
                    $last_final_array[$va['employee_id']]['employee_id'] = $va['employee_id'];
                    $last_final_array[$va['employee_id']]['house_build_recovery'] = $va['house_build_recovery'];
                    $last_final_array[$va['employee_id']]['house_repair_recovery'] = $va['house_repair_recovery'];
                    $last_final_array[$va['employee_id']]['car_loan'] = $va['car_loan'];
                    $last_final_array[$va['employee_id']]['computer_loan'] = $va['computer_loan'];
                    $last_final_array[$va['employee_id']]['extra_loan'] = $va['extra_loan'];
                    $last_final_array[$va['employee_id']]['gpf_loan'] = $va['gpf_loan'];
                }

                //pr($last_final_array);
                // pr($arrayForEmp);
                //Marge two arrays
                $marge_array = array_merge($last_final_array, $arrayForEmp);

//Now call array_sync
                $latest_array = $this->array_sync($marge_array);

            //pr($latest_array);            die();

            endif;


            foreach ($emp_info as $key => $val) {
                $data['EmployeeSalarySheet']['employee_id'] = $val[0]['Employee']['id'];
                $data['EmployeeSalarySheet']['current_basic'] = $val[0]['Scale']['grade_basic'];

                /* Employee start allowance */
                $data['EmployeeSalarySheet']['new_basic_salary'] = ($val[0]['Employee']['new_basic'] != '') ? $val[0]['Employee']['new_basic'] : 0;
                $data['EmployeeSalarySheet']['da'] = $val[0]['EmployeeAllowance']['da'];
                $data['EmployeeSalarySheet']['pp'] = $val[0]['EmployeeAllowance']['pp'];
                $data['EmployeeSalarySheet']['medical'] = $val[0]['EmployeeAllowance']['medical'];
                $data['EmployeeSalarySheet']['convance'] = $val[0]['EmployeeAllowance']['convence'];
                $data['EmployeeSalarySheet']['tiffin'] = $val[0]['EmployeeAllowance']['tiffin'];
                $data['EmployeeSalarySheet']['wash'] = $val[0]['EmployeeAllowance']['wash'];
                $data['EmployeeSalarySheet']['mobile'] = $val[0]['EmployeeAllowance']['mobile'];
                $data['EmployeeSalarySheet']['charge'] = $val[0]['EmployeeAllowance']['charges'];
                $data['EmployeeSalarySheet']['other'] = $val[0]['EmployeeAllowance']['others'];
                $data['EmployeeSalarySheet']['house_rent'] = $val[0]['EmployeeAllowance']['house_rent'];
                $data['EmployeeSalarySheet']['education'] = $val[0]['EmployeeAllowance']['education'];
                /* Employee  allowance end */

                /* Employee recovery start */
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

                /* Loan recovery start */
                // $data['EmployeeSalarySheet']['house_loan_recovery'] = 0; //$this->loan_recovery($emp_data['salarysheets']['fiscal_year_id'], $emp_data['salarysheets']['month_id'], 4, $val[0]['Employee']['id']);
                // $data['EmployeeSalarySheet']['computer_loan'] = 0; //$this->loan_recovery($emp_data['salarysheets']['fiscal_year_id'], $emp_data['salarysheets']['month_id'], 5, $val[0]['Employee']['id']);
                //  $data['EmployeeSalarySheet']['car_loan'] = 0; //$this->loan_recovery($emp_data['salarysheets']['fiscal_year_id'], $emp_data['salarysheets']['month_id'], 6, $val[0]['Employee']['id']);
                // $data['EmployeeSalarySheet']['extra_loan'] = 0; //$this->loan_recovery($emp_data['salarysheets']['fiscal_year_id'], $emp_data['salarysheets']['month_id'], 7, $val[0]['Employee']['id']);
                $data['EmployeeSalarySheet']['house_build_recovery'] = isset($latest_array[$key]['house_build_recovery']) ? $latest_array[$key]['house_build_recovery'] : 0;
                $data['EmployeeSalarySheet']['house_repair_recovery'] = isset($latest_array[$key]['house_repair_recovery']) ? $latest_array[$key]['house_repair_recovery'] : 0;
                $data['EmployeeSalarySheet']['car_loan'] = isset($latest_array[$key]['car_loan']) ? $latest_array[$key]['car_loan'] : 0;
                $data['EmployeeSalarySheet']['computer_loan'] = isset($latest_array[$key]['computer_loan']) ? $latest_array[$key]['computer_loan'] : 0;
                $data['EmployeeSalarySheet']['extra_loan'] = isset($latest_array[$key]['extra_loan']) ? $latest_array[$key]['extra_loan'] : 0;
                $data['EmployeeSalarySheet']['gpf_loan'] = isset($latest_array[$key]['gpf_loan']) ? $latest_array[$key]['gpf_loan'] : 0;
                /* Loan recovery end */

                $data['EmployeeSalarySheet']['fiscal_year_id'] = $emp_data['salarysheets']['fiscal_year_id'];
                $data['EmployeeSalarySheet']['month_id'] = $emp_data['salarysheets']['month_id'];

                /* calculation part start */
                // $data['EmployeeSalarySheet']['gross_pay'] = !empty($totalAllowance) ? $totalAllowance : 0;
                // $data['EmployeeSalarySheet']['total_payable'] = !empty($totalRecovery) ? $totalRecovery : 0;
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
                $final_array[$k]['extra_loan'] += $a[$i]['extra_loan'];
                $final_array[$k]['gpf_loan'] += $a[$i]['gpf_loan'];
            }
        }


        return $final_array;
    }

    public function loan_recovery($year, $month, $employee_loan_id, $employee_id) {
        $emp_loans = $this->LoanRecovery->find('all', array(
            'fields' => array('LoanRecovery.recovery_loan_amount'),
            'conditions' => array('LoanRecovery.fiscal_year_id' => $year, 'LoanRecovery.month_id' => $month, 'LoanRecovery.employee_loan_id' => $employee_loan_id, 'LoanRecovery.employee_id' => $employee_id)));
        // pr($emp_loans);
        if (count($emp_loans) == 1) {
            echo $emp_loans[0]['LoanRecovery']['recovery_loan_amount'];
        } else {
            echo 0;
        }
    }

    /* public function salary_sheet($loan_id, $loan_recovery_amount, $val, $emp_data) {
      $data['EmployeeSalarySheet']['employee_id'] = $val[0]['Employee']['id'];
      $data['EmployeeSalarySheet']['current_basic'] = $val[0]['Scale']['grade_basic'];
      $data['EmployeeSalarySheet']['new_basic_salary'] = ($val[0]['Employee']['new_basic'] != '') ? $val[0]['Employee']['new_basic'] : 0;
      $data['EmployeeSalarySheet']['da'] = $val[0]['EmployeeAllowance']['da'];
      $data['EmployeeSalarySheet']['pp'] = $val[0]['EmployeeAllowance']['pp'];
      $data['EmployeeSalarySheet']['medical'] = $val[0]['EmployeeAllowance']['medical'];
      $data['EmployeeSalarySheet']['convance'] = $val[0]['EmployeeAllowance']['convence'];
      $data['EmployeeSalarySheet']['tiffin'] = $val[0]['EmployeeAllowance']['tiffin'];
      $data['EmployeeSalarySheet']['wash'] = $val[0]['EmployeeAllowance']['wash'];
      $data['EmployeeSalarySheet']['mobile'] = $val[0]['EmployeeAllowance']['mobile'];
      $data['EmployeeSalarySheet']['charge'] = $val[0]['EmployeeAllowance']['charges'];
      $data['EmployeeSalarySheet']['other'] = $val[0]['EmployeeAllowance']['others'];
      $data['EmployeeSalarySheet']['house_rent'] = $val[0]['EmployeeAllowance']['house_rent'];
      $data['EmployeeSalarySheet']['education'] = $val[0]['EmployeeAllowance']['education'];

      $data['EmployeeSalarySheet']['gpf'] = $val[0]['EmployeeRecovery']['gpf'];
      $data['EmployeeSalarySheet']['gpf_recovery'] = $val[0]['EmployeeRecovery']['gpf_recovery'];
      $data['EmployeeSalarySheet']['fixed_house_rent_recovery'] = $val[0]['EmployeeRecovery']['fixed_house_rent'];
      $data['EmployeeSalarySheet']['water_supply_recovery'] = $val[0]['EmployeeRecovery']['water_supply'];
      $data['EmployeeSalarySheet']['bf_recovery'] = $val[0]['EmployeeRecovery']['bf'];
      $data['EmployeeSalarySheet']['gi'] = $val[0]['EmployeeRecovery']['gi'];
      $data['EmployeeSalarySheet']['gi_recovery'] = $val[0]['EmployeeRecovery']['gi_recovery'];
      $data['EmployeeSalarySheet']['tin_shade_recovery'] = $val[0]['EmployeeRecovery']['tin_shed'];
      // Loan recovery
      $data['EmployeeSalarySheet']['house_loan_recovery'] = ($loan_id == 4) ? $loan_recovery_amount : 0;
      $data['EmployeeSalarySheet']['computer_loan'] = ($loan_id == 5) ? $loan_recovery_amount : 0;
      $data['EmployeeSalarySheet']['car_loan'] = ($loan_id == 6) ? $loan_recovery_amount : 0;
      $data['EmployeeSalarySheet']['extra_loan'] = ($loan_id == 7) ? $loan_recovery_amount : 0;

      $data['EmployeeSalarySheet']['fiscal_year_id'] = $emp_data['salarysheets']['fiscal_year_id'];
      $data['EmployeeSalarySheet']['month_id'] = $emp_data['salarysheets']['month_id'];

      //  $data['EmployeeSalarySheet']['effective_call_non_pharma'] = $this->request->data['Office']['SaleTarget']['effective_call_non_pharma'][$key];
      $data_array[] = $data;
      //die();
      // $this->EmployeeSalarySheet->saveAll($data_array);
      } */
}
