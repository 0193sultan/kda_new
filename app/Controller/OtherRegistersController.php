<?php

App::uses('AppController', 'Controller');

class OtherRegistersController extends AppController {

    public $components = array('Paginator', 'Session');

    public function admin_index() {
        #########################################################################
        ###Fill form data start
        #########################################################################

        $this->loadModel('Department');
        $Department = $this->Department->find('list');

        $this->loadModel('Employee');
        $Employee = $this->Employee->find('list');

        #########################################################################
        ###Fill form data End
        #########################################################################
        ##########################################################################
        ###Submitted form data
        ##########################################################################

        $employee_id = $this->request->data('employee_id');
        $register_id = $this->request->data('register_id');
        $this->loadModel('EmployeeSalarySheet');
        $this->loadModel('GpfSubscription');

        if ($employee_id != 0) {
            if ($register_id == 1) {
                $con = array('EmployeeSalarySheet.employee_id' => $employee_id);
                $fileds = array('sum(EmployeeSalarySheet.bf_recovery) as ttl', 'EmployeeSalarySheet.employee_id as employee_id');
                $type = 'BF';

                $res = $this->EmployeeSalarySheet->find('all', array('fields' => $fileds, 'conditions' => $con, 'group' => array('EmployeeSalarySheet.employee_id')));
            } else if ($register_id == 2) {
                $con = array('EmployeeSalarySheet.employee_id' => $employee_id);
                $fileds = array('sum(EmployeeSalarySheet.gi) as ttl', 'EmployeeSalarySheet.employee_id as employee_id');
                $type = 'GI';

                $res = $this->EmployeeSalarySheet->find('all', array('fields' => $fileds, 'conditions' => $con, 'group' => array('EmployeeSalarySheet.employee_id')));
            } else {

                $con = array('GpfSubscription.employee_id' => $employee_id);
                $fileds = array('GpfSubscription.total_subscription_balance as ttl', 'GpfSubscription.employee_id as employee_id');
                $type = 'GPF Subcription';

                $res[] = $this->GpfSubscription->find('first', array('fields' => $fileds, 'conditions' => $con, 'order' => array('GpfSubscription.id DESC')));

                // pr($res1);
            }
        } else {
            if ($register_id == 1) {
                $fileds = array('sum(EmployeeSalarySheet.bf_recovery) as ttl', 'EmployeeSalarySheet.employee_id as employee_id');
                $type = 'BF';
            } else if ($register_id == 2) {
                $fileds = array('sum(EmployeeSalarySheet.gi) as ttl', 'EmployeeSalarySheet.employee_id as employee_id');
                $type = 'GI';
            } else {
                $fileds = array('sum(EmployeeSalarySheet.gpf) as ttl', 'EmployeeSalarySheet.employee_id as employee_id');
                $type = 'GPF Subcription';
            }

            $res = $this->EmployeeSalarySheet->find('all', array('fields' => $fileds, 'group' => array('EmployeeSalarySheet.employee_id')));
        }

        #########################################################################
        ###Submitted form data end
        #########################################################################

        $this->set(compact('Department', 'Employee', 'res', 'type'));
    }

    public function admin_get_employee_names() {

        $department_id = $this->request->data('department_id');

        $this->loadModel('Employee');
        $employee = $this->Employee->find('list', array('conditions' => array('Employee.department_id' => $department_id)));

        echo "<option value=''> select </option>";
        foreach ($employee as $key => $value) {
            echo "<option value=" . $key . ">" . $value . "</option>";
        }

        $this->autoRender = false;
    }

    public function get_name_designation_byId($id = null) {
        $this->loadModel('Employee');
        $data = $this->Employee->find('all', array('conditions' => array('Employee.id' => $id)));
        return $data;
    }

    public function admin_details($employee_id = null, $register_id = null) {
        echo $employee_id;
        $this->loadModel('EmployeeSalarySheet');
        $this->loadModel('GpfSubscription');
        if ($register_id == 1) {
            $con = array('EmployeeSalarySheet.employee_id' => $employee_id);
            $fileds = array('sum(EmployeeSalarySheet.bf_recovery) as ttl', 'EmployeeSalarySheet.employee_id as employee_id');
            $type = 'BF';
            $flag = 1;
            $res = $this->EmployeeSalarySheet->find('all', array('fields' => $fileds, 'conditions' => $con, 'group' => array('EmployeeSalarySheet.employee_id')));
        } else if ($register_id == 2) {
            $con = array('EmployeeSalarySheet.employee_id' => $employee_id);
            $fileds = array('sum(EmployeeSalarySheet.gi) as ttl', 'EmployeeSalarySheet.employee_id as employee_id');
            $type = 'GI';
            $flag = 2;
            $res = $this->EmployeeSalarySheet->find('all', array('fields' => $fileds, 'conditions' => $con, 'group' => array('EmployeeSalarySheet.employee_id')));
        } else {

            /* $con = array('GpfSubscription.employee_id' => $employee_id);

              $fileds = array('GpfSubscription.total_subscription_balance as ttl', 'GpfSubscription.employee_id as employee_id');
              echo 'kkkkkk';
              $type = 'GPF Subcription';
              $res[] = $this->GpfSubscription->find('first', array('fields' => $fileds, 'conditions' => $con, 'order' => array('GpfSubscription.id DESC'))); */
            $res[] = $this->GpfSubscription->find('first', array(
                'conditions' => array(
                    'GpfSubscription.employee_id' => $employee_id, //$this->request->data['EmployeeLoan']['employee_id'],
                ),
                'fields' => 'GpfSubscription.total_subscription_balance as ttl,GpfSubscription.employee_id as employee_id',
                'order' => 'GpfSubscription.id DESC',
                'limit' => 1,
                'recursive' => 0));
            $type = 'GPF Subcription';
            // pr($res);
            $flag = 3;
        }
        $gpfSubscription = $this->GpfSubscription->find('all', array(
            'conditions' => array(
                'GpfSubscription.employee_id' => $employee_id, //$this->request->data['EmployeeLoan']['employee_id'],
                //'GpfSubscription.fiscal_year_id >=' => 2,
                // 'GpfSubscription.month_id' => 8,
               // 'GpfSubscription.sub_status !=' => 0
            ),
            //'fields' => 'Post.name',
            'order' => 'GpfSubscription.id ASC',
            // 'limit' => 1,
            'recursive' => 0));
        // pr($gpfSubscription);
        $con = array('EmployeeSalarySheet.employee_id' => $employee_id);
        $details = $this->EmployeeSalarySheet->find('all', array('conditions' => $con));
        // $this->EmployeeSalarySheet->recursive=2;
        $this->set(compact('res', 'type', 'details', 'gpfSubscription', 'flag'));
    }

}
