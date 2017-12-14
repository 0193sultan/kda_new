<?php

App::uses('AppController', 'Controller');

/**
 * Sallery Shit
 *
 * @property Employee $Employee
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class BackTracesController extends AppController {

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
    public function get_current_due($current_due, $installment_amount, $recovery_current_due) {
        if ($recovery_current_due > 0) {
            return $current_due + $recovery_current_due;
        } else {
            return 0;
        }
    }

    public function get_interest_amount($interest_amount,$recovery_current_due, $recovery_interest_amount_due) {
        if ($recovery_current_due > 0 && $recovery_interest_amount_due > 0) {
            return 0;
        } else {
            return $interest_amount;
        }
    }
    public function get_interest_amount_due($interest_amount_due,$recovery_current_due, $recovery_interest_amount_due) {
        if ($recovery_current_due > 0 && $recovery_interest_amount_due > 0) {
            return 0;
        } else {
            return $interest_amount_due+$recovery_interest_amount_due;
        }
    }
    public function admin_index() {
        $this->set('page_title', 'Back Trace');
        $this->loadModel('FiscalYear');
        $this->loadModel('Month');
        $this->loadModel('LoanRecovery');
        $this->FiscalYear->recursive = -1;
        $fiscalYears = $this->FiscalYear->find('list');
        $months = $this->Month->find('list');
        $this->set(compact('fiscalYears', 'months'));
        if ($this->request->is('post')) {
            if ($this->request->data['BackTraces']['fiscal_year_id'] != '' && $this->request->data['BackTraces']['month_id'] != '') {
                /* Employee Loan back to previous position start */
                $loanRecoveries = $this->LoanRecovery->find('all', array(
                    'conditions' => array(
                        'LoanRecovery.fiscal_year_id' => $this->request->data['BackTraces']['fiscal_year_id'],
                        'LoanRecovery.month_id' => $this->request->data['BackTraces']['month_id']
                    ),
                    //'fields' => 'MonthlyOthersEnty.electric_bill,MonthlyOthersEnty.telephone_bill,MonthlyOthersEnty.rent_a_car_bill,MonthlyOthersEnty.others',
                    'order' => 'LoanRecovery.id DESC',
                    // 'limit' => 1,
                    'recursive' => 0));
                if (count($loanRecoveries) > 0) {
                    $employeeLoan = array();
                    foreach ($loanRecoveries as $key => $value) {
                        $empLoan = $value['EmployeeLoan'];
                        $loanRecovery = $value['LoanRecovery'];
                        $employeeLoan['EmployeeLoan'][$key]['id'] = $value['EmployeeLoan']['id'];
                        $employeeLoan['EmployeeLoan'][$key]['current_due'] = $this->get_current_due($empLoan['current_due'], $empLoan['installment_amount'], $loanRecovery['recovery_current_due']);
                        $employeeLoan['EmployeeLoan'][$key]['interest_amount'] = $this->get_interest_amount($empLoan['interest_amount'],$loanRecovery['recovery_current_due'], $loanRecovery['recovery_interest_amount_due']);
                        $employeeLoan['EmployeeLoan'][$key]['interest_amount_due'] =$this->get_interest_amount_due($empLoan['interest_amount_due'],$loanRecovery['recovery_current_due'], $loanRecovery['recovery_interest_amount_due']);
                    }
                } else {
                    $this->Session->setFlash(__('Please select Exist Year and Month!'), 'flash/error');
                    $this->redirect(array('action' => 'index'));
                }
                pr($employeeLoan);
                pr($loanRecoveries);
                die();
                /* Employee Loan back to previous position end */
            } else {
                $this->Session->setFlash(__('Please select Year and Month!'), 'flash/error');
                $this->redirect(array('action' => 'index'));
            }
            $this->Session->setFlash(__('Back Trace has been completed.'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
    }

}
