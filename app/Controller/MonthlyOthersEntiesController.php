<?php

App::uses('AppController', 'Controller');

/**
 * MonthlyOthersEnties Controller
 *
 * @property MonthlyOthersEnty $MonthlyOthersEnty
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class MonthlyOthersEntiesController extends AppController {

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
        $this->set('page_title', 'Monthly others enty List');
        $this->MonthlyOthersEnty->recursive = 0;
        $this->paginate = array('order' => array('MonthlyOthersEnty.id' => 'DESC'));
        $this->set('monthlyOthersEnties', $this->paginate());
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Monthly others enty Details');
        if (!$this->MonthlyOthersEnty->exists($id)) {
            throw new NotFoundException(__('Invalid monthly others enty'));
        }
        $options = array('conditions' => array('MonthlyOthersEnty.' . $this->MonthlyOthersEnty->primaryKey => $id));
        $this->set('monthlyOthersEnty', $this->MonthlyOthersEnty->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Monthly others enty');
        if ($this->request->is('post')) {
            // pr($this->request->data);
            // die();
            $enty = $this->request->data['designation_id'];
            $this->loadModel('Employee');
            $query=[];
            if ($this->request->data['designation_id'] != 0) {
                $query['Employee.designation_id'] = $this->request->data['designation_id'];
            }
            if ($this->request->data['department_id'] != 0) {
                $query['Employee.department_id'] = $this->request->data['department_id'];
            }
            if ($this->request->data['employee_id'] != 0) {
                $query['Employee.id'] = $this->request->data['employee_id'];
            }

            $employeeList = $this->Employee->find('all', array('conditions' => $query));

           // pr($query);
            //die();

            $this->request->data['MonthlyOthersEnty']['created_at'] = $this->current_datetime();
            $this->request->data['MonthlyOthersEnty']['created_by'] = $this->UserAuth->getUserId();
            if (!empty($this->request->data['emp_id'])) {
                if ($this->request->data['fiscal_year_id'] != '' && $this->request->data['month_id'] != '') {
                    foreach ($this->request->data['emp_id'] as $key):
                                           // pr($key);die();
                        $this->request->data['MonthlyOthersEnty']['employee_id'] = $key;
                        $this->request->data['MonthlyOthersEnty']['fiscal_year_id'] = $this->request->data['fiscal_year_id'];
                        $this->request->data['MonthlyOthersEnty']['month_id'] = $this->request->data['month_id'];
                        if ($this->request->data['entryType'] == 1) {
                            $this->request->data['MonthlyOthersEnty']['electric_bill'] = $this->request->data['MonthlyOthersEnty']['amount'][$key];
                        } elseif ($this->request->data['entryType'] == 2) {
                            $this->request->data['MonthlyOthersEnty']['telephone_bill'] = $this->request->data['MonthlyOthersEnty']['amount'][$key];
                        } elseif ($this->request->data['entryType'] == 3) {
                            $this->request->data['MonthlyOthersEnty']['rent_a_car_bill'] = $this->request->data['MonthlyOthersEnty']['amount'][$key];
                        } elseif ($this->request->data['entryType'] == 4) {
                            $this->request->data['MonthlyOthersEnty']['others'] = $this->request->data['MonthlyOthersEnty']['amount'][$key];
                        }

                                      //   pr($this->request->data);die();
                        $this->MonthlyOthersEnty->create();
                        $this->MonthlyOthersEnty->save($this->request->data);
                    endforeach;
                    $this->Session->setFlash(__('The monthly others enty has been saved'), 'flash/success');
                    $this->redirect(array('action' => 'add'));
                } else {
                    $this->Session->setFlash(__('Please Select Fiscal Year And Month'), 'flash/error');
                }
            }
        }
        $this->loadModel('MonthlyOthersEntiesSetting');
        $monthlyOthersEntiesSetting = $this->MonthlyOthersEntiesSetting->find('list');
        //pr($monthlyOthersEntiesSetting);
        $designations = $this->MonthlyOthersEnty->Designation->find('list');
        $departments = $this->MonthlyOthersEnty->Department->find('list');
        $employees = $this->MonthlyOthersEnty->Employee->find('list');
        $fiscalYears = $this->MonthlyOthersEnty->FiscalYear->find('list');
        $months = $this->MonthlyOthersEnty->Month->find('list');
        $this->set(compact('designations', 'departments', 'employees', 'fiscalYears', 'months', 'monthlyOthersEntiesSetting', 'employeeList'));
    }

    /**
     * admin_edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_edit($id = null) {
        $this->set('page_title', 'Edit Monthly others enty');
        $this->MonthlyOthersEnty->id = $id;
        if (!$this->MonthlyOthersEnty->exists($id)) {
            throw new NotFoundException(__('Invalid monthly others enty'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['MonthlyOthersEnty']['updated_by'] = $this->UserAuth->getUserId();
            if ($this->MonthlyOthersEnty->save($this->request->data)) {
                $this->Session->setFlash(__('The monthly others enty has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The monthly others enty could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('MonthlyOthersEnty.' . $this->MonthlyOthersEnty->primaryKey => $id));
            $this->request->data = $this->MonthlyOthersEnty->find('first', $options);
        }
        $designations = $this->MonthlyOthersEnty->Designation->find('list');
        $departments = $this->MonthlyOthersEnty->Department->find('list');
        $employees = $this->MonthlyOthersEnty->Employee->find('list');
        $fiscalYears = $this->MonthlyOthersEnty->FiscalYear->find('list');
        $months = $this->MonthlyOthersEnty->Month->find('list');
        $this->set(compact('designations', 'departments', 'employees', 'fiscalYears', 'months'));
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
        $this->MonthlyOthersEnty->id = $id;
        if (!$this->MonthlyOthersEnty->exists()) {
            throw new NotFoundException(__('Invalid monthly others enty'));
        }
        if ($this->MonthlyOthersEnty->delete()) {
            $this->Session->setFlash(__('Monthly others enty deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Monthly others enty was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

    public function admin_get_all_employee_list() {
        $this->LoadModel('Employee');
        $employee_list = $this->Employee->find('list');
        $this->Employee->recursive = -1;
        echo json_encode(compact('employee_list'));
        $this->autoRender = false;
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

}
