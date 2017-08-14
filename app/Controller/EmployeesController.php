<?php

App::uses('AppController', 'Controller');

/**
 * Employees Controller
 *
 * @property Employee $Employee
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class EmployeesController extends AppController {

//comment by shahed
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

        $this->Employee->recursive = 0;
        $departments = $this->Employee->Department->find('list');
        $designations = $this->Employee->Designation->find('list');
        $this->set(compact('departments', 'designations'));
        if ($this->request->is('POST') || $this->request->is('PUT')) {
            $this->set('page_title', 'Search Employee');
            //echo '<pre>';print_r($this->request->data('search'));die();
            if (!empty($this->request->data['search']['employee_no'] && $this->request->data['search']['employee_dept'] && $this->request->data['search']['employee_desg'])) {
                $employee = $this->request->data['search']['employee_no'];
                $dept = $this->request->data['search']['employee_dept'];
                $desg = $this->request->data['search']['employee_desg'];
                $options = array('OR' => array('Employee.employeeID' => $employee, 'Employee.name LIKE' => '%' . $employee . '%'), 'Employee.department_id' => $dept, 'Employee.designation_id' => $desg);
            } else if (!empty($this->request->data['search']['employee_dept'] && $this->request->data['search']['employee_desg'])) {
                $dept = $this->request->data['search']['employee_dept'];
                $desg = $this->request->data['search']['employee_desg'];
                $options = array('Employee.department_id' => $dept, 'Employee.designation_id' => $desg);
            } else if (!empty($this->request->data['search']['employee_no'] && $this->request->data['search']['employee_dept'])) {
                $employee = $this->request->data['search']['employee_no'];
                $dept = $this->request->data['search']['employee_dept'];
                $options = array('OR' => array('Employee.employeeID' => $employee, 'Employee.name LIKE' => '%' . $employee . '%'), 'Employee.department_id' => $dept);
            } else if (!empty($this->request->data['search']['employee_no'] && $this->request->data['search']['employee_desg'])) {
                $employee = $this->request->data['search']['employee_no'];
                $desg = $this->request->data['search']['employee_desg'];
                $options = array('OR' => array('Employee.employeeID' => $employee, 'Employee.name LIKE' => '%' . $employee . '%'), 'Employee.designation_id' => $desg);
            } else if (!empty($this->request->data['search']['employee_no'])) {
                $employee = $this->request->data['search']['employee_no'];
                $options = array('OR' => array('Employee.employeeID' => $employee, 'Employee.name LIKE' => '%' . $employee . '%'));
            } else if (!empty($this->request->data['search']['employee_dept'])) {
                $dept = $this->request->data['search']['employee_dept'];
                $options = array('Employee.department_id' => $dept);
            } else if (!empty($this->request->data['search']['employee_desg'])) {
                $desg = $this->request->data['search']['employee_desg'];
                $options = array('Employee.designation_id' => $desg);
            } else {
                $this->redirect(array('action' => 'index'));
                //Router::redirect('admin/employees',array('controller' => 'Emploeyees','action'=>'index'));
            }

            $this->paginate = array('order' => array('Employee.id' => 'DESC'), 'conditions' => $options);
            $this->set('employees', $this->paginate());
        } else {
            $this->set('page_title', 'Employee List');
            $this->Employee->recursive = 0;
            $this->paginate = array('order' => array('Employee.id' => 'DESC'));
            $this->set('employees', $this->paginate());
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
        $this->set('page_title', 'Employee Details');
        if (!$this->Employee->exists($id)) {
            throw new NotFoundException(__('Invalid employee'));
        }
        $this->Employee->recursive = 0;
        $options = array('conditions' => array('Employee.' . $this->Employee->primaryKey => $id));
        $employee = $this->Employee->find('first', $options);
        $this->set('employee', $employee);
        $this->loadModel('EmployeeChild');
        $this->EmployeeChild->recursive = 0;
        $options = array('conditions' => array('EmployeeChild.employee_id' => $id));
        $this->set('employeechild', $this->EmployeeChild->find('all', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Employee');
        $this->loadModel('Employee');
        $this->Employee->recursive = 2;
        $employee_id = 0;

        if ($this->request->is('post')) {
            // pr($this->request->data);
            //die();
            $options = array('conditions' => array('Employee.employeeID' => $this->request->data['Employee']['employeeID']));
            $checkDataHas = $this->Employee->find('first', $options);
            echo count($checkDataHas);
            if (count($checkDataHas) == 0) {
                $this->loadModel('Scale');

                //pr($grade_scale);
                // pr($this->request->data);
                //die();
                $this->Employee->create();
                $this->request->data['Employee']['created_at'] = $this->current_datetime();
                $this->request->data['Employee']['created_by'] = $this->UserAuth->getUserId();
                $this->request->data['Employee']['date_of_birth'] = date('Y-m-d', strtotime($this->request->data['Employee']['date_of_birth']));
                $this->request->data['Employee']['joining_date'] = date('Y-m-d', strtotime($this->request->data['Employee']['joining_date']));
                if ($this->Employee->save($this->request->data)) {
                    $employee_id = $this->Employee->getLastInsertId();
                    $file = $this->request->data['EmployeeChild']['file'];
                    $this->loadModel('EmployeeChild');
                    $data['EmployeeChild']['employee_id'] = $employee_id;
                    //$this->EmployeeChild->create();
                    for ($i = 0; $i < 2; $i++) {
                        $this->EmployeeChild->create();
                        // move_uploaded_file($file[$i]['tmp_name'], WWW_ROOT . 'uploads_files/birth_cirtificate/' . $file[$i]['name']);
                        $data['EmployeeChild']['name'] = $this->request->data['EmployeeChild']['name'][$i];
                        $data['EmployeeChild']['dob'] = date('Y-m-d', strtotime($this->request->data['EmployeeChild']['dob'][$i]));
                        $data['EmployeeChild']['edu_status_id'] = $this->request->data['EmployeeChild']['edu_status_id'][$i];
                        $data['EmployeeChild']['file_path'] = $file[$i]['name'];
                        //print_r($data['EmployeeChild']);
                        if ($data['EmployeeChild']['name'] != '' && $data['EmployeeChild']['dob'] != '') {
                            $this->EmployeeChild->save($data['EmployeeChild']);
                        }
                    }
                    $this->loadModel('EmployeeAllowance');
                    $this->EmployeeAllowance->create();
                    if (!empty($this->request->data['Employee']['scale_id'])):
                        $conditions = array('Scale.id' => $this->request->data['Employee']['scale_id']);
                        $grade_scale = $this->Scale->find('all', array('fields' => array('Scale.id', 'Scale.grade_basic'), 'conditions' => $conditions));
                        if ($this->request->data['EmployeeAllowance']['fix_charges'] == 0) {
                            $this->request->data['EmployeeAllowance']['charges'] = ($grade_scale[0]['Scale']['grade_basic'] * $this->request->data['EmployeeAllowance']['charges']) / 100;
                        }
                        if ($this->request->data['EmployeeRecovery']['fix_gpf'] == 0) {
                            $this->request->data['EmployeeRecovery']['gpf'] = ($grade_scale[0]['Scale']['grade_basic'] * $this->request->data['EmployeeRecovery']['gpf']) / 100;
                        }
                    endif;
                    $this->request->data['EmployeeAllowance']['employee_id'] = $employee_id;
                    if ($this->EmployeeAllowance->save($this->request->data['EmployeeAllowance'])) {
                        $this->loadModel('EmployeeRecovery');
                        $this->EmployeeRecovery->create();
                        $this->request->data['EmployeeRecovery']['employee_id'] = $employee_id;
                        if ($this->EmployeeRecovery->save($this->request->data['EmployeeRecovery'])) {
                            $this->Session->setFlash(__('The employee has been saved'), 'flash/success');
                            $this->redirect(array('action' => 'index'));
                        }
                    }
                } else {
                    $this->Session->setFlash(__('The employee could not be saved. Please, try again.'), 'flash/error');
                }
            } else {
                $this->Session->setFlash(__('The employee Id has already Exist'), 'flash/error');
                $this->redirect(array('action' => 'add'));
            }
        }
        $employeeGrades = $this->Employee->EmployeeGrade->find('list', array('conditions' => array('EmployeeGrade.grade_declare_year' => '2015',)));
        $scales = $this->Employee->Scale->find('list');
        $departments = $this->Employee->Department->find('list');
        $designations = $this->Employee->Designation->find('list');
        $quotas = $this->Employee->Quota->find('list');
        $employeeTypes = $this->Employee->EmployeeType->find('list');
        $religions = $this->Employee->Religion->find('list');
        $jobStatuses = $this->Employee->JobStatus->find('list');
        // pr($religions);        die();
        $bankInfos = $this->Employee->BankInfo->find('list');
        $sexes = $this->Employee->Sex->find('list');
        $maritalStatuses = $this->Employee->MaritalStatus->find('list');
        $livingStatuses = $this->Employee->LivingStatus->find('list');
        $locations = $this->Employee->Location->find('list');
        // pr($this->Employee);
        $this->loadModel('edu_status');
        $eduStatuses = $this->edu_status->find('list');
        $this->set(compact('employeeGrades', 'scales', 'departments', 'designations', 'basics', 'newBasics', 'quotas', 'employeeTypes', 'religions', 'jobStatuses', 'bankInfos', 'sexes', 'maritalStatuses', 'livingStatuses', 'eduStatuses', 'locations'));
    }

    /**
     * admin_edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_edit($id = null) {
        $this->set('page_title', 'Edit Employee');
        $this->Employee->id = $id;
        $this->loadModel('Scale');
        if (!$this->Employee->exists($id)) {
            throw new NotFoundException(__('Invalid employee'));
        }

        //pr($this->request->data);exit();
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['Employee']['updated_by'] = $this->UserAuth->getUserId();
            $this->request->data['Employee']['date_of_birth'] = date('Y-m-d', strtotime($this->request->data['Employee']['date_of_birth']));
            $this->request->data['Employee']['joining_date'] = date('Y-m-d', strtotime($this->request->data['Employee']['joining_date']));
            //pr($this->request->data);
            // die();
            if ($this->Employee->save($this->request->data)) {
                $file = $this->request->data['EmployeeChild']['file'];
                $this->loadModel('EmployeeChild');
                $data['EmployeeChild']['employee_id'] = $id;
                //$this->EmployeeChild->create();
                for ($i = 0; $i < 2; $i++) {
                    $this->EmployeeChild->id = $this->request->data['EmployeeChild']['id'][$i];
                    if (!empty($file[$i]['tmp_name'])) {
                        unlink(WWW_ROOT . 'uploads_files/birth_cirtificate/' . $this->request->data['EmployeeChild']['file_path'][$i]);
                        move_uploaded_file($file[$i]['tmp_name'], WWW_ROOT . 'uploads_files/birth_cirtificate/' . $file[$i]['name']);
                        $data['EmployeeChild']['file_path'] = $file[$i]['name'];
                    } else {
                        $data['EmployeeChild']['file_path'] = $this->request->data['EmployeeChild']['file_path'][$i];
                    }
                    $data['EmployeeChild']['name'] = $this->request->data['EmployeeChild']['name'][$i];
                    $data['EmployeeChild']['dob'] = date('Y-m-d', strtotime($this->request->data['EmployeeChild']['dob'][$i]));
                    $data['EmployeeChild']['edu_status_id'] = $this->request->data['EmployeeChild']['edu_status_id'][$i];
                    //$data['EmployeeChild']['file_path']=$file[$i]['name'];
                    //print_r($data['EmployeeChild']);
                    if ($data['EmployeeChild']['name'] != '' && $data['EmployeeChild']['dob'] != '') {
                        $this->EmployeeChild->save($data['EmployeeChild']);
                    }
                }
                $this->loadModel('EmployeeAllowance');
                $this->request->data['EmployeeAllowance']['employee_id'] = $id;
                $this->EmployeeAllowance->id = $this->request->data['EmployeeAllowance']['id'];
                if (!empty($this->request->data['Employee']['scale_id'])):
                    $conditions = array('Scale.id' => $this->request->data['Employee']['scale_id']);
                    $grade_scale = $this->Scale->find('first', array('fields' => array('Scale.id', 'Scale.grade_basic'), 'conditions' => $conditions));
                   // pr($grade_scale);die();
                    if ($this->request->data['EmployeeAllowance']['fix_charges'] == 0) {
                        $this->request->data['EmployeeAllowance']['charges'] = ($grade_scale['Scale']['grade_basic'] * $this->request->data['EmployeeAllowance']['charges']) / 100;
                    }
                    if ($this->request->data['EmployeeRecovery']['fix_gpf'] == 0) {
                        $this->request->data['EmployeeRecovery']['gpf'] = ($grade_scale['Scale']['grade_basic'] * $this->request->data['EmployeeRecovery']['gpf']) / 100;
                    }
                endif;
                if ($this->EmployeeAllowance->save($this->request->data['EmployeeAllowance'])) {
                    $this->loadModel('EmployeeRecovery');
                    $this->request->data['EmployeeRecovery']['employee_id'] = $id;
                    $this->EmployeeRecovery->id = $this->request->data['EmployeeRecovery']['id'];
                    if ($this->EmployeeRecovery->save($this->request->data['EmployeeRecovery'])) {
                        $this->Session->setFlash(__('The employee has been saved'), 'flash/success');
                        $this->redirect(array('action' => 'index'));
                    }
                }
            } else {
                $this->Session->setFlash(__('The employee could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('Employee.' . $this->Employee->primaryKey => $id));
            $this->Employee->recursive = 1;
            $this->request->data = $this->Employee->find('first', $options);
            // pr($this->request->data['EmployeeAllowance']['fix_charges']);//exit();
            if ($this->request->data['EmployeeAllowance']['fix_charges'] == 0) {
                $this->request->data['EmployeeAllowance']['charges'] = ($this->request->data['EmployeeAllowance']['charges'] * 100) / $this->request->data['Scale']['grade_basic'];
            }
            if ($this->request->data['EmployeeRecovery']['fix_gpf'] == 0) {
                $this->request->data['EmployeeRecovery']['gpf'] = ($this->request->data['EmployeeRecovery']['gpf'] * 100) / $this->request->data['Scale']['grade_basic'];
            }
        }
        $employeeGrades = $this->Employee->EmployeeGrade->find('list', array('conditions' => array('EmployeeGrade.grade_declare_year' => '2015')
        ));
        $departments = $this->Employee->Department->find('list');
        $designations = $this->Employee->Designation->find('list');
        $scales = $this->Employee->Scale->find('all', array('conditions' => array('Scale.id' => $this->request->data['Employee']['scale_id'])));
        if (count($scales) > 0):
            //$scale_option[$scales[0]['Scale']['id']] = $scales[0]['Scale']['grade_basic'];
            $scale_option[] = $scales[0]['Scale']['id'];
        endif;
        // pr($this->request->data);
        $quotas = $this->Employee->Quota->find('list');
        $employeeTypes = $this->Employee->EmployeeType->find('list');
        $religions = $this->Employee->Religion->find('list');
        $jobStatuses = $this->Employee->JobStatus->find('list');
        $bankInfos = $this->Employee->BankInfo->find('list');
        $sexes = $this->Employee->Sex->find('list');
        $maritalStatuses = $this->Employee->MaritalStatus->find('list');
        $livingStatuses = $this->Employee->LivingStatus->find('list');
        $locations = $this->Employee->Location->find('list');
        $currentPostingPlaces = $this->Employee->Location->find('list');
        $this->loadModel('edu_status');
        $eduStatuses = $this->edu_status->find('list');
        $this->set(compact('employeeGrades', 'scale_option', 'departments', 'designations', 'basics', 'newBasics', 'quotas', 'employeeTypes', 'religions', 'jobStatuses', 'bankInfos', 'sexes', 'maritalStatuses', 'livingStatuses', 'eduStatuses', 'currentPostingPlaces', 'locations'));
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
        $this->Employee->id = $id;
        if (!$this->Employee->exists()) {
            throw new NotFoundException(__('Invalid employee'));
        }
        if ($this->Employee->delete()) {
            $this->Session->setFlash(__('Employee deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Employee was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

    public function admin_get_increment_list() {
        $grade_id = $this->request->data('grade_id');
        $this->LoadModel('Scale');
        $conditions = array('employee_grade_id' => $grade_id);
        $increment_list = $this->Scale->find('all', array('fields' => array('Scale.id', 'Scale.grade_basic'), 'conditions' => $conditions));

        // $increment_list = $this->Scale->find('all', array('fields' => array('Scale.id', 'Scale.employee_grade_id', 'Scale.grade_basic'), array('conditions' => array('Scale.employee_grade_id' => $grade_id))));
        $this->Scale->recursive = -1;
        //$increment_range = $this->Employee->Scale->find('first', array('conditions' => array('Scale.employee_grade_id' => $grade_id), 'fields' => array('MIN(Scale.name) as min', 'MAX(Scale.name) as max')));

        echo json_encode(compact('increment_list'));
        $this->autoRender = false;
    }

    public function admin_get_fixed_allowance_recover() {
        $this->LoadModel('ConfigMeta');
        //$conditions = array('key' => 'allowance_medical', 'key' => 'allowance_education', 'key' => 'allowance_convence', 'key' => 'allowance_tiffin', 'key' => 'allowance_wash', 'key' => 'recovery_beneficiary_fund', 'key' => 'recovery_gi', 'key' => 'recovery_tin_shed');
        //$increment_list = $this->ConfigMeta->find('all', array('fields' => array('ConfigMeta.id', 'ConfigMeta.key', 'ConfigMeta.value'), 'conditions' => $conditions));
        $increment_list = $this->ConfigMeta->find('all', array(
            'fields' => array('ConfigMeta.key'),
            'conditions' => array(
                'OR' => array(
                    array('ConfigMeta.key' => 'allowance_medical'),
                    array('ConfigMeta.key' => 'allowance_education')
        ))));

        echo json_encode(compact('increment_list'));
        $this->autoRender = false;
    }

    public function admin_get_mobile_bills() {
        $gradeName = $this->request->data('gradeName');
        $this->LoadModel('MobileBillSetting');
        $mobileBill = $this->MobileBillSetting->find('all', array(
            'fields' => array('MobileBillSetting.mobile_bill'),
            'conditions' => array('MobileBillSetting.grade' => $gradeName)));

        echo json_encode($mobileBill);
        $this->autoRender = false;
    }

}
