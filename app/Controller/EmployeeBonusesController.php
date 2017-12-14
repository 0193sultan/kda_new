<?php

App::uses('AppController', 'Controller');

/**
 * EmployeeBonuses Controller
 *
 * @property EmployeeBonus $EmployeeBonus
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class EmployeeBonusesController extends AppController {

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
        $this->set('page_title', 'Employee bonus List');
        $this->loadModel('FiscalYear');
        $this->loadModel('Month');
        $this->loadModel('ConfigMetas');
        $this->ConfigMetas->recursive = -1;
        $FiscalYear = $this->FiscalYear->find('list');
        $Month = $this->Month->find('list');
        $salaryTypes = $this->ConfigMetas->find('all', array('conditions' => array('ConfigMetas.key LIKE' => 'sal_%')));
        if (count($salaryTypes) > 0):
            foreach ($salaryTypes as $key => $value) {
                if ($value['ConfigMetas']['trackingId'] == 32) {
                    $festival_string = 'Festival Bonus for Boishikh';
                } elseif ($value['ConfigMetas']['trackingId'] == 33) {
                    $festival_string = 'Festival Bonus for Muslims';
                } elseif ($value['ConfigMetas']['trackingId'] == 34) {
                    $festival_string = 'Festival Bonus for Hinduism';
                } elseif ($value['ConfigMetas']['trackingId'] == 35) {
                    $festival_string = 'Festival Bonus for Cristianity';
                } elseif ($value['ConfigMetas']['trackingId'] == 36) {
                    $festival_string = 'Festival Bonus for Buddishm';
                }
                $bonusTypes[$value['ConfigMetas']['trackingId']] = $festival_string;
                $bonus[$value['ConfigMetas']['trackingId']] = $value['ConfigMetas']['value'];
                unset($bonusTypes[31]);
            }
        endif;
        $this->set(compact('bonusTypes', 'FiscalYear', 'Month'));

        if ($this->request->is('post')) {
            $month_id = $this->request->data('month_id');
            $fiscal_year_id = $this->request->data('fiscal_year_id');
            $bonusTypes = $this->request->data('bonusTypes');
            $employeeBonusHas = $this->EmployeeBonus->find('all', array('conditions' => array(
                    'EmployeeBonus.fiscal_year_id' => $fiscal_year_id,
                    'EmployeeBonus.month_id' => $month_id,
                    'EmployeeBonus.festival_tracking_config_meta_id' => $bonusTypes
                ),
                'fields' => 'EmployeeBonus.id',
                'order' => 'EmployeeBonus.id ASC',
                'limit' => 1,
                'recursive' => -1));
            if (count($employeeBonusHas) > 0):
                $this->Session->setFlash(__('Bonus alredy exist!'), 'flash/error');
                $this->redirect(array('action' => 'index'));
            endif;

            $all = $this->request->data;
            $this->loadModel('Employee');
            // pr($bonusTypes);die();
            if ($bonusTypes == 33) {
                $calculate_for_bonus = 1;
                $bonus_value = 100;
                $condition = array('Employee.religion_id' => 1, 'Employee.job_status_id !=' => 3);
            } else if ($bonusTypes == 34) {
                $calculate_for_bonus = 2;
                $bonus_value = 200;
                $condition = array('Employee.religion_id' => 2, 'Employee.job_status_id !=' => 3);
            } else if ($bonusTypes == 35) {
                $calculate_for_bonus = 2;
                $bonus_value = 200;
                $condition = array('Employee.religion_id' => 3, 'Employee.job_status_id !=' => 3);
            } else if ($bonusTypes == 36) {
                $calculate_for_bonus = 2;
                $bonus_value = 200;
                $condition = array('Employee.religion_id' => 4, 'Employee.job_status_id !=' => 3);
            } else {
                $calculate_for_bonus = .2;
                $bonus_value = 20;
                $condition = array('Employee.job_status_id !=' => 3);
            }

            $Employee = $this->Employee->find('all', array('conditions' => $condition));
            //pr($Employee);
            // pr($this->request->data('emp_id'));
            // die();
            if (count($this->request->data('emp_id')) > 0) {
                foreach ($this->request->data('emp_id') as $key => $employee_id) {
                    $employeeBonus['EmployeeBonus']['employee_id'] = $employee_id;
                    $employeeBonus['EmployeeBonus']['current_basic'] = $Employee[$key]['Scale']['grade_basic'];
                    $employeeBonus['EmployeeBonus']['scale_id'] = $Employee[$key]['EmployeeGrade']['name'];
                    $employeeBonus['EmployeeBonus']['bonus_amount'] = $Employee[$key]['Scale']['grade_basic'] * $calculate_for_bonus;
                    $employeeBonus['EmployeeBonus']['percent'] = $bonus_value;
                    $employeeBonus['EmployeeBonus']['fiscal_year_id'] = $fiscal_year_id;
                    $employeeBonus['EmployeeBonus']['month_id'] = $month_id;
                    $employeeBonus['EmployeeBonus']['festival_tracking_config_meta_id'] = $bonusTypes;
                    $employeeBonus['EmployeeBonus']['created_at'] = $this->current_datetime();
                    $employeeBonus_array[] = $employeeBonus;
                    $this->EmployeeBonus->saveAll($employeeBonus_array);
                    $employeeBonus_array = [];
                }
                $this->Session->setFlash(__('Bonus has been created'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            }
//            } else {
//                $this->Session->setFlash(__('Please Check applied employee for bonus!'), 'flash/error');
//                $this->redirect(array('action' => 'index'));
//            }
            $this->set(compact('percent', 'tracking', 'Employee', 'month_id', 'fiscal_year_id'));
        }
    }

    public function admin_entry_bonus() {
        // pr($this->request->data);                    die();
        $this->EmployeeBonus->recursive = 2;

        if (empty($this->request->data)) {
            $this->redirect(array('action' => 'index'));
        }

        $all = $this->request->data;
        $all_id = $all['emp_id'];

        /* $entry_check = $this->EmployeeBonus->find('count',array('conditions' => array('EmployeeBonus.fiscal_year_id' => $all['fiscal_year_id'],'EmployeeBonus.month_id' => $all['month_id'], 'EmployeeBonus.festival_tracking_config_meta_id' => $all['tracking'])));
          if($entry_check > 0 )
          {
          $this->Session->setFlash(__('You Already Generate Bonus'), 'flash/error');
          //$this->redirect(array('action' => 'index'));

          $bonus = $this->EmployeeBonus->find('all',array('conditions' => array('EmployeeBonus.fiscal_year_id' => $all['fiscal_year_id'],'EmployeeBonus.month_id' => $all['month_id'], 'EmployeeBonus.festival_tracking_config_meta_id' => $all['tracking'])));
          //pr($bonus);
          } */
        /* else
          { */
        $this->loadModel('Employee');
        $this->Employee->recursive = 1;
        foreach ($all_id as $v) {
            $res = $this->Employee->find('all', array('conditions' => array('Employee.id' => $v)));
            $data['employee_id'] = $res[0]['Employee']['id'];
            $data['current_basic'] = $res[0]['Scale']['grade_basic'];
            $data['scale_id'] = $res[0]['Employee']['scale_id'];

            $data['bonus_amount'] = ($res[0]['Scale']['grade_basic'] * ($all['percentage'] / 100));

            $data['percent'] = $all['percentage'];
            $data['fiscal_year_id'] = $all['fiscal_year_id'];
            $data['month_id'] = $all['month_id'];
            $data['user_id'] = $this->UserAuth->getUserId();
            $data['festival_tracking_config_meta_id'] = $all['tracking'];

            $data['created_at'] = $this->current_datetime();

            #########################################################
            ### insert data using loop
            ##########################################################

            $this->EmployeeBonus->create();
            $this->EmployeeBonus->save($data);

            #########################################################
            ### insert data using loop end
            ##########################################################
        }

        $bonus = $this->EmployeeBonus->find('all', array('conditions' => array('EmployeeBonus.fiscal_year_id' => $all['fiscal_year_id'], 'EmployeeBonus.month_id' => $all['month_id'], 'EmployeeBonus.festival_tracking_config_meta_id' => $all['tracking'])));
        /* } */


        $this->set(compact('all', 'all_id', 'bonus'));
    }

    public function admin_show_bonus() {
        $this->set('page_title', 'Search Bonus');
        $this->loadModel('FiscalYear');
        $FiscalYear = $this->FiscalYear->find('list');

        $this->loadModel('Month');
        $Month = $this->Month->find('list');
        $bonusTypes_id = $this->request->data('bonusTypes');
        $this->loadModel('ConfigMetas');
        $this->ConfigMetas->recursive = -1;
        $salaryTypes = $this->ConfigMetas->find('all', array('conditions' => array('ConfigMetas.key LIKE' => 'sal_%')));
        if (count($salaryTypes) > 0):
            foreach ($salaryTypes as $key => $value) {
                if ($value['ConfigMetas']['trackingId'] == 32) {
                    $festival_string = 'Festival Bonus for Boishikh';
                } elseif ($value['ConfigMetas']['trackingId'] == 33) {
                    $festival_string = 'Festival Bonus for Muslims';
                } elseif ($value['ConfigMetas']['trackingId'] == 34) {
                    $festival_string = 'Festival Bonus for Hinduism';
                } elseif ($value['ConfigMetas']['trackingId'] == 35) {
                    $festival_string = 'Festival Bonus for Cristianity';
                } elseif ($value['ConfigMetas']['trackingId'] == 36) {
                    $festival_string = 'Festival Bonus for Buddishm';
                }
                $bonusTypes[$value['ConfigMetas']['trackingId']] = $festival_string;
                $bonus[$value['ConfigMetas']['trackingId']] = $value['ConfigMetas']['value'];
                unset($bonusTypes[31]);
            }
        endif;
        $this->set(compact('bonusTypes', 'FiscalYear', 'Month'));
        if ($this->request->is('post')) {
            $all = $this->request->data;
            $month_id = $this->request->data('month_id');
            $fiscal_year_id = $this->request->data('fiscal_year_id');
            $bonusTypes = $this->request->data('bonusTypes');
            $this->EmployeeBonus->recursive = 1;
            $bonus = $this->EmployeeBonus->find('all', array('conditions' => array('EmployeeBonus.fiscal_year_id' => $fiscal_year_id, 'EmployeeBonus.month_id' => $month_id, 'EmployeeBonus.festival_tracking_config_meta_id' => $bonusTypes)));
            //pr($employeeBonus);            die();
            if (count($bonus) == 0) {
                $this->Session->setFlash(__('There is no Bonus !'), 'flash/error');
                $this->redirect(array('action' => 'show_bonus'));
            }
            $this->set(compact('bonus', 'month_id', 'fiscal_year_id', 'bonusTypes_id'));
        }
    }

    public function get_department($department_id) {
        $this->loadModel('Department');
        $department = $this->Department->find('all', array('conditions' => array(
                'Department.id' => $department_id,
            ),
            'fields' => 'Department.name',
            'order' => 'Department.id ASC',
            'limit' => 1,
            'recursive' => -1));
        if (count($department) > 0) {
            return $department[0]['Department']['name'];
        } else {
            return '';
        }
    }

    public function get_designation($designation_id) {
        $this->loadModel('Designation');
        $designation = $this->Designation->find('all', array('conditions' => array(
                'Designation.id' => $designation_id,
            ),
            'fields' => 'Designation.name',
            //'order' => 'Designation.id ASC',
            'limit' => 1,
            'recursive' => -1));
        if (count($designation) > 0) {
            return $designation[0]['Designation']['name'];
        } else {
            return '';
        }
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Employee bonus Details');
        if (!$this->EmployeeBonus->exists($id)) {
            throw new NotFoundException(__('Invalid employee bonus'));
        }
        $options = array('conditions' => array('EmployeeBonus.' . $this->EmployeeBonus->primaryKey => $id));
        $this->set('employeeBonus', $this->EmployeeBonus->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Employee bonus');
        if ($this->request->is('post')) {
            $this->EmployeeBonus->create();
            $this->request->data['EmployeeBonus']['created_at'] = $this->current_datetime();
            $this->request->data['EmployeeBonus']['created_by'] = $this->UserAuth->getUserId();
            if ($this->EmployeeBonus->save($this->request->data)) {
                $this->Session->setFlash(__('The employee bonus has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The employee bonus could not be saved. Please, try again.'), 'flash/error');
            }
        }
        $employees = $this->EmployeeBonus->Employee->find('list');
        $scales = $this->EmployeeBonus->Scale->find('list');
        $fiscalYears = $this->EmployeeBonus->FiscalYear->find('list');
        $months = $this->EmployeeBonus->Month->find('list');
        $users = $this->EmployeeBonus->User->find('list');
        $this->set(compact('employees', 'scales', 'fiscalYears', 'months', 'users'));
    }

    /**
     * admin_edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_edit($id = null) {
        $this->set('page_title', 'Edit Employee bonus');
        $this->EmployeeBonus->id = $id;
        if (!$this->EmployeeBonus->exists($id)) {
            throw new NotFoundException(__('Invalid employee bonus'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['EmployeeBonus']['updated_by'] = $this->UserAuth->getUserId();
            if ($this->EmployeeBonus->save($this->request->data)) {
                $this->Session->setFlash(__('The employee bonus has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The employee bonus could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('EmployeeBonus.' . $this->EmployeeBonus->primaryKey => $id));
            $this->request->data = $this->EmployeeBonus->find('first', $options);
        }
        $employees = $this->EmployeeBonus->Employee->find('list');
        $scales = $this->EmployeeBonus->Scale->find('list');
        $fiscalYears = $this->EmployeeBonus->FiscalYear->find('list');
        $months = $this->EmployeeBonus->Month->find('list');
        $users = $this->EmployeeBonus->User->find('list');
        $this->set(compact('employees', 'scales', 'fiscalYears', 'months', 'users'));
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
        $this->EmployeeBonus->id = $id;
        if (!$this->EmployeeBonus->exists()) {
            throw new NotFoundException(__('Invalid employee bonus'));
        }
        if ($this->EmployeeBonus->delete()) {
            $this->Session->setFlash(__('Employee bonus deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Employee bonus was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

    public function get_config_meta_comment($trackingId = null) {
        $this->loadModel('ConfigMeta');
        $comment = $this->ConfigMeta->find('all', array('fields' => array('ConfigMeta.comment'), 'conditions' => array('trackingId' => $trackingId)));
        return $comment;
    }

}
