<?php

App::uses('AppController', 'Controller');

/**
 * Designations Controller
 *
 * @property Designation $Designation
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class EmployeeTaxes_old_modified_on_03_10_17_Controller extends AppController {

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Paginator', 'Session');

    public function admin_index() {
        #################################################
        #### For Search form data
        #################################################

        $this->loadModel('Department');
        $departments = $this->Department->find('list');

        $this->loadModel('Designation');
        $Designations = $this->Designation->find('list');

        $this->loadModel('FiscalYear');
        $FiscalYears = $this->FiscalYear->find('list');

        $this->loadModel('Employee');
        $Employees = $this->Employee->find('list');

        $this->set(compact('departments', 'Designations', 'FiscalYears', 'Employees'));
        $this->loadModel('EmployeeSalarySheet');

        if ($this->request->is('post')) {
            $emp_id = $this->request->data('employee_id');
            $fiscalYear_id = $this->request->data('fiscal_year_id');
            $con = array();
            if ($this->request->data('employee_id') != 0):
                $con['EmployeeSalarySheet.employee_id'] = $this->request->data('employee_id');

            //$con = array('EmployeeSalarySheet.employee_id' => $this->request->data('employee_id'));
            endif;
            if ($this->request->data('fiscal_year_id') != 0):
                $con['EmployeeSalarySheet.fiscal_year_id'] = $this->request->data('fiscal_year_id');
            //$con = array('EmployeeSalarySheet.fiscal_year_id' => $this->request->data('fiscal_year_id'));
            endif;
            if ($this->request->data('department_id') != 0):
                $con['Employee.department_id'] = $this->request->data('department_id');
            //$con = array('Employee.department_id' => $this->request->data('department_id'));
            endif;
            if ($this->request->data('designation_id') != 0):
                $con['Employee.designation_id'] = $this->request->data('designation_id');
            // $con = array('Employee.designation_id as Employee_tb' => $this->request->data('designation_id'));
            endif;
            /* $data = $this->EmployeeSalarySheet->find('all', array(
              'joins' => array(
              array(
              'table' => 'Employees',
              'alias' => 'Employee_tb',
              'type' => 'INNER',
              'conditions' => array(
              'Employee_tb.id = EmployeeSalarySheet.employee_id'
              )
              )
              ),
              'conditions' => $salCon,
              'fields' => array('Employee_tb.name,Employee_tb.department_id,Employee_tb.designation_id', 'EmployeeSalarySheet.employee_id,EmployeeSalarySheet.fiscal_year_id,EmployeeSalarySheet.month_id,EmployeeSalarySheet.emp_tax'),
              'order' => 'EmployeeSalarySheet.id DESC',
              'group' => array('EmployeeSalarySheet.employee_id'),
              ));
             */
            $data = $this->EmployeeSalarySheet->find('all', array(
                'conditions' => $con,
                //'fields' => 'Employee.Designation.name,Employee.department_id,Employee.designation_id,EmployeeSalarySheet.employee_id,EmployeeSalarySheet.fiscal_year_id,EmployeeSalarySheet.month_id,EmployeeSalarySheet.emp_tax',
                'order' => 'EmployeeSalarySheet.id DESC',
                //'limit' => 1,
                'group' => array('EmployeeSalarySheet.employee_id'),
                'recursive' => 2)
            );
            //  pr($con);
            // pr($this->request->data);
            // pr($data);
            // die();
            $this->set('employeeSalarySheet', $data);
        }


        #################################################
        #### For Search form data End
        #################################################
        #################################################
        #### Receive submitted form data
        #################################################
        #################################################
        #### Receive submitted form data End
        #################################################
    }

    public function get_call() {
        $department = $this->request->data('department_name');
        $designation = $this->request->data('designation');
        $condition = array();
        if ($department != 0 && $designation != 0) {
            $condition = array('Employee.department_id' => $department, 'AND' => array('Employee.designation_id' => $designation));
        } else if ($designation != 0 && $department == 0) {
            $condition['Employee.designation_id'] = $designation;
        } else if ($designation == 0 && $department != 0) {
            $condition['Employee.department_id'] = $department;
        }

        $this->loadModel('Employee');
        $emp = $this->Employee->find('list', array('conditions' => array($condition)));
        $empls = array('All') + $emp;
        foreach ($empls as $key => $value) {
            echo "<option value= " . $key . ">" . $value . "</option>";
        }

        $this->autoRender = false;
    }

    public function get_ttl_tax($id = null, $fiscalYear = null) {
        $this->loadModel('EmployeeSalarySheet');
        $ttl_tax = $this->EmployeeSalarySheet->find('all', array('fields' => array('sum(EmployeeSalarySheet.emp_tax) as emp_tax'), 'conditions' => array('EmployeeSalarySheet.employee_id' => $id, 'AND' => array('EmployeeSalarySheet.fiscal_year_id' => $fiscalYear))));
        return $ttl_tax[0][0]['emp_tax'];
    }

    public function get_month($month = null) {
        $this->loadModel('Month');
        $this->Month->recursive = -1;
        $month_name = $this->Month->find('all', array('fields' => array('Month.name'),'conditions' => array('Month.id' => $month)));
        return $month_name[0]['Month']['name'];
    }
        public function get_fiscal_year($fiscal_year = null) {
        $this->loadModel('FiscalYear');
        $this->FiscalYear->recursive = -1;
        $month_name = $this->FiscalYear->find('all', array('fields' => array('FiscalYear.name'),'conditions' => array('FiscalYear.id' => $fiscal_year)));
        return $month_name[0]['FiscalYear']['name'];
    }

    private function __net_total_tax($fiscalYear = null) {
        $this->loadModel('EmployeeSalarySheet');
        $tax_amount = $this->EmployeeSalarySheet->find('all', array('fields' => array('sum(EmployeeSalarySheet.emp_tax) as emp_tax'), 'conditions' => array('EmployeeSalarySheet.fiscal_year_id' => $fiscalYear)));

        return $tax_amount;
    }

    public function admin_emp_tax_details($em_id = null, $fiscal_year_id = null) {
        $this->loadModel('EmployeeSalarySheet');
        $this->EmployeeSalarySheet->recursive = 2;
        $details = $this->EmployeeSalarySheet->find('all', array('conditions' => array('EmployeeSalarySheet.employee_id' => $em_id, 'AND' => array('EmployeeSalarySheet.fiscal_year_id' => $fiscal_year_id))));

        $ttl_tax = $this->get_ttl_tax($em_id, $fiscal_year_id);

        $this->set(compact('details', 'ttl_tax'));
    }

}
