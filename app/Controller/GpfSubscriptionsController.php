<?php

App::uses('AppController', 'Controller');

/**
 * GpfSubscriptions Controller
 *
 * @property GpfSubscription $GpfSubscription
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class GpfSubscriptionsController extends AppController {

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
        $this->set('page_title', 'Gpf subscription List');
        $this->GpfSubscription->recursive = 0;
        $this->paginate = array('order' => array('GpfSubscription.id' => 'DESC'));
        $this->set('gpfSubscriptions', $this->paginate());
    }

    public function admin_details() {
        $this->set('page_title', 'Gpf Details');
       // $this->GpfSubscription->recursive = 0;
        $gpfSubscription = $this->GpfSubscription->find('all', array(
            'conditions' => array(
                'GpfSubscription.employee_id' =>22, //$this->request->data['EmployeeLoan']['employee_id'],
                'GpfSubscription.fiscal_year_id' => 5,
               // 'GpfSubscription.month_id' => 8,
                'GpfSubscription.sub_status !=' => 0
                ),
            //'fields' => 'Post.name',
            'order' => 'GpfSubscription.id ASC',
           // 'limit' => 1,
            'recursive' => 0));
       // pr($gpfSubscription);
        $this->set('gpfSubscription', $gpfSubscription);
        $this->paginate = array('order' => array('GpfSubscription.id' => 'DESC'));
        $this->set('gpfSubscriptions', $this->paginate());
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Gpf subscription Details');
        if (!$this->GpfSubscription->exists($id)) {
            throw new NotFoundException(__('Invalid gpf subscription'));
        }
        $options = array('conditions' => array('GpfSubscription.' . $this->GpfSubscription->primaryKey => $id));
        $this->set('gpfSubscription', $this->GpfSubscription->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Gpf subscription');
        if ($this->request->is('post')) {
            $this->GpfSubscription->create();
            $this->request->data['GpfSubscription']['created_at'] = $this->current_datetime();
            $this->request->data['GpfSubscription']['created_by'] = $this->UserAuth->getUserId();
            if ($this->GpfSubscription->save($this->request->data)) {
                $this->Session->setFlash(__('The gpf subscription has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The gpf subscription could not be saved. Please, try again.'), 'flash/error');
            }
        }
        $employees = $this->GpfSubscription->Employee->find('list');
        $employeeLoans = $this->GpfSubscription->EmployeeLoan->find('list');
        $this->set(compact('employees', 'employeeLoans'));
    }

    /**
     * admin_edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_edit($id = null) {
        $this->set('page_title', 'Edit Gpf subscription');
        $this->GpfSubscription->id = $id;
        if (!$this->GpfSubscription->exists($id)) {
            throw new NotFoundException(__('Invalid gpf subscription'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['GpfSubscription']['updated_by'] = $this->UserAuth->getUserId();
            if ($this->GpfSubscription->save($this->request->data)) {
                $this->Session->setFlash(__('The gpf subscription has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The gpf subscription could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('GpfSubscription.' . $this->GpfSubscription->primaryKey => $id));
            $this->request->data = $this->GpfSubscription->find('first', $options);
        }
        $employees = $this->GpfSubscription->Employee->find('list');
        $employeeLoans = $this->GpfSubscription->EmployeeLoan->find('list');
        $this->set(compact('employees', 'employeeLoans'));
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
        $this->GpfSubscription->id = $id;
        if (!$this->GpfSubscription->exists()) {
            throw new NotFoundException(__('Invalid gpf subscription'));
        }
        if ($this->GpfSubscription->delete()) {
            $this->Session->setFlash(__('Gpf subscription deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Gpf subscription was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

}
