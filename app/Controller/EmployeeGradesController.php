<?php

App::uses('AppController', 'Controller');

/**
 * EmployeeGrades Controller
 *
 * @property EmployeeGrade $EmployeeGrade
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class EmployeeGradesController extends AppController {

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Paginator', 'Session');

    /**
     * index method
     *
     * @return void

      /**
     * admin_index method
     *
     * @return void
     */
    public function admin_index() {
        $this->set('page_title', 'Employee grade List');
        $this->EmployeeGrade->recursive = 0;
        $this->paginate = array('order' => array('EmployeeGrade.id' => 'DESC'));
        $this->set('employeeGrades', $this->paginate());
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Employee grade Details');
        if (!$this->EmployeeGrade->exists($id)) {
            throw new NotFoundException(__('Invalid employee grade'));
        }
        $options = array('conditions' => array('EmployeeGrade.' . $this->EmployeeGrade->primaryKey => $id));
        $this->set('employeeGrade', $this->EmployeeGrade->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Employee grade');

        //pr($checkDataHas);
        if ($this->request->is('post')) {
            $options = array('conditions' => array('EmployeeGrade.name' => $this->request->data['EmployeeGrade']['name']),
                array('EmployeeGrade.grade_declare_year' => $this->request->data['EmployeeGrade']['grade_declare_year']));
            $checkDataHas = $this->EmployeeGrade->find('first', $options);
            //echo count($checkDataHas);
            if (count($checkDataHas) == 0) {
                $this->EmployeeGrade->create();
                $this->request->data['EmployeeGrade']['created_at'] = $this->current_datetime();
                $this->request->data['EmployeeGrade']['created_by'] = $this->UserAuth->getUserId();
                if ($this->EmployeeGrade->save($this->request->data)) {
                    $this->Session->setFlash(__('The employee grade has been saved'), 'flash/success');
                    $this->redirect(array('action' => 'index'));
                } else {
                    $this->Session->setFlash(__('The employee grade could not be saved. Please, try again.'), 'flash/error');
                }
            } else {
                $this->Session->setFlash(__('Grade already exist'), 'flash/error');
                $this->redirect(array('action' => 'index'));
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
        $this->set('page_title', 'Edit Employee grade');
        $this->EmployeeGrade->id = $id;
        if (!$this->EmployeeGrade->exists($id)) {
            throw new NotFoundException(__('Invalid employee grade'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['EmployeeGrade']['updated_by'] = $this->UserAuth->getUserId();
            if ($this->EmployeeGrade->save($this->request->data)) {
                $this->Session->setFlash(__('The employee grade has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The employee grade could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('EmployeeGrade.' . $this->EmployeeGrade->primaryKey => $id));
            $this->request->data = $this->EmployeeGrade->find('first', $options);
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
        $this->EmployeeGrade->id = $id;
        if (!$this->EmployeeGrade->exists()) {
            throw new NotFoundException(__('Invalid employee grade'));
        }
        if ($this->EmployeeGrade->delete()) {
            $this->Session->setFlash(__('Employee grade deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Employee grade was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

}
