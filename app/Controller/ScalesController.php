<?php

App::uses('AppController', 'Controller');

/**
 * Scales Controller
 *
 * @property Scale $Scale
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ScalesController extends AppController {

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
        /* $this->set('page_title', 'Scale List');
          $this->Scale->recursive = 0;
          $this->paginate = array('group' => 'Scale.employee_grade_id');
          $grade_id = $this->paginate();
          $this->Scale->recursive = -1;
          $scales = $this->Scale->find('all', array('order' => array('Scale.id' => 'DESC')));
          //print_r($Scales);die();
          $this->set('scales', $scales);
          $this->set('grade_id', $grade_id); */

        $this->set('page_title', 'Scale List');
        $this->Scale->recursive = 0;
        $this->paginate = array('order' => array('Scale.id' => 'DESC'));
        $this->set('scales', $this->paginate());
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Scale Details');
        if (!$this->Scale->exists($id)) {
            throw new NotFoundException(__('Invalid Scale'));
        }
        $options = array('conditions' => array('Scale.' . $this->Scale->primaryKey => $id));
        $this->set('scale', $this->Scale->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Scale');
        if ($this->request->is('post')) {
            $this->Scale->create();
            $this->request->data['Scale']['created_at'] = $this->current_datetime();
            $this->request->data['Scale']['created_by'] = $this->UserAuth->getUserId();
            if ($this->Scale->save($this->request->data)) {
                $this->Session->setFlash(__('The Scale has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The Scale could not be saved. Please, try again.'), 'flash/error');
            }
        }
        $this->LoadModel('EmployeeGrade');
        $this->EmployeeGrade->recursive = -1;
        $employeeGradesYear = $this->EmployeeGrade->find('all', array('fields' => 'DISTINCT EmployeeGrade.grade_declare_year'));
        $this->set(compact('employeeGradesYear'));
    }

    /**
     * admin_edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_edit($id = null) {
        $this->set('page_title', 'Edit Scale');
        $this->Scale->id = $id;
        if (!$this->Scale->exists($id)) {
            throw new NotFoundException(__('Invalid Scale'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['Scale']['updated_by'] = $this->UserAuth->getUserId();
            if ($this->Scale->save($this->request->data)) {
                $this->Session->setFlash(__('The Scale has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The Scale could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('Scale.' . $this->Scale->primaryKey => $id));
            $this->request->data = $this->Scale->find('first', $options);
        }
        $this->LoadModel('EmployeeGrade');
        $options = array('conditions' => array('EmployeeGrade.grade_declare_year' => $this->request->data['EmployeeGrade']['grade_declare_year']));
        $employeeGrades = $this->EmployeeGrade->find('list', $options);
        $this->LoadModel('EmployeeGrade');
        $this->EmployeeGrade->recursive = -1;
        $employeeGradesYear = $this->EmployeeGrade->find('all', array('fields' => 'DISTINCT EmployeeGrade.grade_declare_year'));
        $this->set(compact('employeeGradesYear', 'employeeGrades'));
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
        $this->Scale->id = $id;
        if (!$this->Scale->exists()) {
            throw new NotFoundException(__('Invalid Scale'));
        }
        if ($this->Scale->delete()) {
            $this->Session->setFlash(__('Scale deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Scale was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

    public function admin_find_all_grade_by_year() {
        $grade_year = $this->request->data['grade_year'];
        $this->LoadModel('EmployeeGrade');
        $this->EmployeeGrade->recursive = -1;
        $conditions = array('grade_declare_year' => $grade_year);
        $employeeGrades = $this->EmployeeGrade->find('all', array('fields' => array('EmployeeGrade.id', 'EmployeeGrade.name'), 'conditions' => $conditions));
        echo json_encode($employeeGrades);
        $this->autoRender = false;
    }

    public function admin_get_grade_basic_for_indivisual_grade() {
        $employee_grade_id = $this->request->data['employee_grade_id'];
        $this->LoadModel('Scale');
        $this->Scale->recursive = -1;
        $conditions = array('employee_grade_id' => $employee_grade_id);
        $grade_basic = $this->Scale->find('all', array('fields' => array('Scale.id', 'Scale.grade_basic'), 'conditions' => $conditions));
        echo json_encode($grade_basic);
        $this->autoRender = false;
    }

    public function admin_view_Scale($grade_id) {
        $this->Scale->recursive = 0;
        $this->paginate = array('order' => array('Scale.id' => 'DESC'), 'conditions' => array('Scale.employee_grade_id' => $grade_id));
        $this->set('scales', $this->paginate());
    }

}
