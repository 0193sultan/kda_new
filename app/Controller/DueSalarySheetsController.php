<?php

App::uses('AppController', 'Controller');

/**
 * DueSalarySheets Controller
 *
 * @property DueSalarySheet $DueSalarySheet
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class DueSalarySheetsController extends AppController {

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
        $this->set('page_title', 'Due salary sheet List');
        $this->DueSalarySheet->recursive = 0;
        $this->loadModel('FiscalYear');
        $this->loadModel('DueSalarySheet');
        $fiscalYearData = $this->FiscalYear->find('list');
        if ($this->request->is('post')) {
            $dueSalarySheet = $this->DueSalarySheet->find('all', array(
                'conditions' => array(
                    'DueSalarySheet.fiscal_year_id' => $this->request->data['DueSalarySheets']['fiscal_year_id'],
                    'DueSalarySheet.month_id' => $this->request->data['DueSalarySheets']['month_id']
                ),
                //'fields' => 'Post.name',
                'order' => 'DueSalarySheet.id DESC',
                    //'limit' => 1,
                    //'recursive' => 1
                    )
            );
            if (count($dueSalarySheet) > 0) {
                $this->set('dueSalary', $dueSalarySheet);
            } else {
                $this->Session->setFlash(__('No data Exist in the due list.'), 'flash/error');
                $this->redirect(array('action' => 'index'));
            }
           // pr($this->request->data);
          //  pr($dueSalarySheet);
           // die();
        }
        $this->paginate = array('order' => array('DueSalarySheet.id' => 'DESC'));
        $this->set('dueSalarySheets', $this->paginate());
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
        $this->set('page_title', 'Due salary sheet Details');
        if (!$this->DueSalarySheet->exists($id)) {
            throw new NotFoundException(__('Invalid due salary sheet'));
        }
        $options = array('conditions' => array('DueSalarySheet.' . $this->DueSalarySheet->primaryKey => $id));
        $this->set('dueSalarySheet', $this->DueSalarySheet->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Due salary sheet');
        if ($this->request->is('post')) {
            $this->DueSalarySheet->create();

            $this->loadModel('Employee');
            $this->loadModel('FiscalYearSetting');
            //$this->Employee->recursive = 2;
            //$all_emp = $this->Employee->find('all');
            $employee = $this->Employee->find('first', array(
                'conditions' => array(
                    'Employee.id' => $this->request->data['DueSalarySheet']['employee_id'],
                //'GpfSubscription.month_id' => $this->request->data['EmployeeLoan']['recovery_start_month_id']
                ),
                //'fields' => 'Post.name',
                //'order' => 'GpfSubscription.id DESC',
                'limit' => 1,
                'recursive' => 1));
            $workingDays = $this->FiscalYearSetting->find('first', array(
                'conditions' => array(
                    'FiscalYearSetting.fiscal_year_id' => $this->request->data['DueSalarySheet']['fiscal_year_id'],
                    'FiscalYearSetting.month_id' => $this->request->data['DueSalarySheet']['month_id']
                ),
                'fields' => 'FiscalYearSetting.working_day',
                //'order' => 'GpfSubscription.id DESC',
                'limit' => 1,
                'recursive' => -1));
            $dueSalarySheet = $this->request->data['DueSalarySheet'];
            $this->request->data['DueSalarySheet']['current_basic'] = $this->due_salary($workingDays['FiscalYearSetting']['working_day'], $dueSalarySheet['due_days'], $employee['Scale']['grade_basic']);
            $this->request->data['DueSalarySheet']['house_rent'] = $this->due_salary($workingDays['FiscalYearSetting']['working_day'], $dueSalarySheet['due_days'], $employee['EmployeeAllowance']['house_rent']);
            $this->request->data['DueSalarySheet']['medical'] = $this->due_salary($workingDays['FiscalYearSetting']['working_day'], $dueSalarySheet['due_days'], $employee['EmployeeAllowance']['medical']);
            $this->request->data['DueSalarySheet']['education'] = $this->due_salary($workingDays['FiscalYearSetting']['working_day'], $dueSalarySheet['due_days'], $employee['EmployeeAllowance']['education']);
            $this->request->data['DueSalarySheet']['convance'] = $this->due_salary($workingDays['FiscalYearSetting']['working_day'], $dueSalarySheet['due_days'], $employee['EmployeeAllowance']['convence']);
            $this->request->data['DueSalarySheet']['tiffin'] = $this->due_salary($workingDays['FiscalYearSetting']['working_day'], $dueSalarySheet['due_days'], $employee['EmployeeAllowance']['tiffin']);
            $this->request->data['DueSalarySheet']['wash'] = $this->due_salary($workingDays['FiscalYearSetting']['working_day'], $dueSalarySheet['due_days'], $employee['EmployeeAllowance']['wash']);
            $this->request->data['DueSalarySheet']['mobile'] = $this->due_salary($workingDays['FiscalYearSetting']['working_day'], $dueSalarySheet['due_days'], $employee['EmployeeAllowance']['mobile']);
            $this->request->data['DueSalarySheet']['cycle'] = $this->due_salary($workingDays['FiscalYearSetting']['working_day'], $dueSalarySheet['due_days'], $employee['EmployeeAllowance']['cycle']);
            $this->request->data['DueSalarySheet']['da'] = $this->due_salary($workingDays['FiscalYearSetting']['working_day'], $dueSalarySheet['due_days'], $employee['EmployeeAllowance']['da']);
            $this->request->data['DueSalarySheet']['charge'] = $this->due_salary($workingDays['FiscalYearSetting']['working_day'], $dueSalarySheet['due_days'], $employee['EmployeeAllowance']['charges']);
            $this->request->data['DueSalarySheet']['other'] = $this->due_salary($workingDays['FiscalYearSetting']['working_day'], $dueSalarySheet['due_days'], $employee['EmployeeAllowance']['others']);
            $this->request->data['DueSalarySheet']['pp'] = $this->due_salary($workingDays['FiscalYearSetting']['working_day'], $dueSalarySheet['due_days'], $employee['EmployeeAllowance']['pp']);

            // pr($workingDays);
            //pr($this->request->data);
            // pr($employee);
            // die();


            $this->request->data['DueSalarySheet']['created_at'] = $this->current_datetime();
            $this->request->data['DueSalarySheet']['created_by'] = $this->UserAuth->getUserId();
            if ($this->DueSalarySheet->save($this->request->data)) {
                $this->Session->setFlash(__('The due salary sheet has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The due salary sheet could not be saved. Please, try again.'), 'flash/error');
            }
        }
        $employees = $this->DueSalarySheet->Employee->find('list');
        // $employees[] = '';
        $fiscalYears = $this->DueSalarySheet->FiscalYear->find('list');
        $months = $this->DueSalarySheet->Month->find('list');
        $this->set(compact('employees', 'salaryTypes', 'fiscalYears', 'months'));
    }

    public function due_salary($working_days, $due_days, $allowance) {
        if ($allowance == 0) {
            return $allowance;
        } else {
            $perUnit = $allowance / $working_days;
            $lastPay = $due_days * $perUnit;
            return $lastPay;
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
        $this->set('page_title', 'Edit Due salary sheet');
        $this->DueSalarySheet->id = $id;
        if (!$this->DueSalarySheet->exists($id)) {
            throw new NotFoundException(__('Invalid due salary sheet'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['DueSalarySheet']['updated_by'] = $this->UserAuth->getUserId();
            if ($this->DueSalarySheet->save($this->request->data)) {
                $this->Session->setFlash(__('The due salary sheet has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The due salary sheet could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('DueSalarySheet.' . $this->DueSalarySheet->primaryKey => $id));
            $this->request->data = $this->DueSalarySheet->find('first', $options);
        }
        $employees = $this->DueSalarySheet->Employee->find('list');
        $fiscalYears = $this->DueSalarySheet->FiscalYear->find('list');
        $months = $this->DueSalarySheet->Month->find('list');
        $this->set(compact('employees', 'salaryTypes', 'fiscalYears', 'months'));
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
        $this->DueSalarySheet->id = $id;
        if (!$this->DueSalarySheet->exists()) {
            throw new NotFoundException(__('Invalid due salary sheet'));
        }
        if ($this->DueSalarySheet->delete()) {
            $this->Session->setFlash(__('Due salary sheet deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Due salary sheet was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

}
