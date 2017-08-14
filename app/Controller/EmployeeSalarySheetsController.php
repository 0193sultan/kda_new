<?php

App::uses('AppController', 'Controller');

/**
 * EmployeeSalarySheets Controller
 *
 * @property EmployeeSalarySheet $EmployeeSalarySheet
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class EmployeeSalarySheetsController extends AppController {

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
        $this->loadModel('Scale');
        $this->loadModel('EmployeeGrade');
        $this->loadModel('Employee');
        $this->loadModel('FiscalYear');
        $this->Scale->recursive = -1;
        $this->Employee->recursive = 0;
        $this->FiscalYear->recursive = -1;
        $this->EmployeeSalarySheet->recursive = -1;
        $fiscalYearData = $this->FiscalYear->find('list');
        //$a = $this->EmployeeGrade->find('all');


        if ($this->request->is('post')) {
            $get_data = $this->request->data['employeesalarysheets'];
            //pr($this->request->data);
            //die();
            if (!empty($get_data['fiscal_year_id']) && !empty($get_data['month_id'])) {
                $emp_salary_sheet = $this->EmployeeSalarySheet->find('all', array(
                    // 'fields' => array('EmployeeLoan.employee_id', 'EmployeeLoan.loan_amount', 'EmployeeLoan.current_due', 'EmployeeLoan.interest_amount', 'EmployeeLoan.installment_amount'),
                    'conditions' => array(
                        'EmployeeSalarySheet.fiscal_year_id' => $this->request->data['employeesalarysheets']['fiscal_year_id'],
                        'EmployeeSalarySheet.month_id' => $this->request->data['employeesalarysheets']['month_id']),
                        // 'group' => array('EmployeeSalarySheet.employee_id'),
                        )
                );
                $this->set('emp_salary_sheet', $emp_salary_sheet);
                //$this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('Please, Select Year and Month.'), 'flash/error');
                $this->redirect(array('action' => 'index'));
            }
            //pr($emp_salary_sheet);
            // die();
            //$this->salary_process($this->request->data);
        }
        $this->loadModel('ConfigMetas');
        $this->ConfigMetas->recursive = -1;
        $salaryTypes = $this->ConfigMetas->find('all', array('conditions' => array('ConfigMetas.key LIKE' => 'sal_%')));
        if (count($salaryTypes) > 0) {
            foreach ($salaryTypes as $key => $value) {
                if ($value['ConfigMetas']['key'] == 'sal_festival_buddhisam') {
                    $newArray[$value['ConfigMetas']['trackingId']] = 'Salary Festival Buddhisam';
                } elseif ($value['ConfigMetas']['key'] == 'sal_boishikh') {
                    $newArray[$value['ConfigMetas']['trackingId']] = 'Salary Festival Boishikh';
                } elseif ($value['ConfigMetas']['key'] == 'sal_festival_muslims') {
                    $newArray[$value['ConfigMetas']['trackingId']] = 'Salary Festival Muslims';
                } elseif ($value['ConfigMetas']['key'] == 'sal_festival_hinduism') {
                    $newArray[$value['ConfigMetas']['trackingId']] = 'Salary Festival Hinduism';
                } elseif ($value['ConfigMetas']['key'] == 'sal_festival_cristianity') {
                    $newArray[$value['ConfigMetas']['trackingId']] = 'Salary Festival Cristianity';
                } else {
                    $newArray[$value['ConfigMetas']['trackingId']] = 'Salary General';
                }
            }
        }
       // pr($newArray);
        $this->set('page_title', 'Employee salary sheet List');
        $this->paginate = array('order' => array('EmployeeSalarySheet.id' => 'DESC'));
        $this->set('employeeSalarySheets', $this->paginate());
        $this->set('salaryTypes', $newArray);
        $this->set('fiscalYearData', $fiscalYearData);
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Employee salary sheet Details');
        if (!$this->EmployeeSalarySheet->exists($id)) {
            throw new NotFoundException(__('Invalid employee salary sheet'));
        }
        $options = array('conditions' => array('EmployeeSalarySheet.' . $this->EmployeeSalarySheet->primaryKey => $id));
        $this->set('employeeSalarySheet', $this->EmployeeSalarySheet->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Employee salary sheet');
        if ($this->request->is('post')) {
            $this->EmployeeSalarySheet->create();
            $this->request->data['EmployeeSalarySheet']['created_at'] = $this->current_datetime();
            $this->request->data['EmployeeSalarySheet']['created_by'] = $this->UserAuth->getUserId();
            if ($this->EmployeeSalarySheet->save($this->request->data)) {
                $this->Session->setFlash(__('The employee salary sheet has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The employee salary sheet could not be saved. Please, try again.'), 'flash/error');
            }
        }
    }

    /**
     * admin_edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_edit($id = null) {
        $this->set('page_title', 'Edit Employee salary sheet');
        $this->EmployeeSalarySheet->id = $id;
        if (!$this->EmployeeSalarySheet->exists($id)) {
            throw new NotFoundException(__('Invalid employee salary sheet'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['EmployeeSalarySheet']['updated_by'] = $this->UserAuth->getUserId();
            if ($this->EmployeeSalarySheet->save($this->request->data)) {
                $this->Session->setFlash(__('The employee salary sheet has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The employee salary sheet could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('EmployeeSalarySheet.' . $this->EmployeeSalarySheet->primaryKey => $id));
            $this->request->data = $this->EmployeeSalarySheet->find('first', $options);
        }
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
        $this->EmployeeSalarySheet->id = $id;
        if (!$this->EmployeeSalarySheet->exists()) {
            throw new NotFoundException(__('Invalid employee salary sheet'));
        }
        if ($this->EmployeeSalarySheet->delete()) {
            $this->Session->setFlash(__('Employee salary sheet deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Employee salary sheet was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

}
