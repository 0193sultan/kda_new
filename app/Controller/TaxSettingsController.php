<?php

App::uses('AppController', 'Controller');

/**
 * TaxSettings Controller
 *
 * @property TaxSetting $TaxSetting
 * @property PaginatorComponent $Paginator
 */
class TaxSettingsController extends AppController {

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Paginator');

    /**
     * admin_index method
     *
     * @return void
     */
    public function admin_index() {
        $this->set('page_title', 'Tax setting List');
        $this->TaxSetting->recursive = 1;
        //$conditions = array('employee_grade_id' => $grade_id);
        // $increment_list = $this->TaxSetting->find('all', array('fields' => array('Scale.id', 'Scale.grade_basic'), 'conditions' => $conditions));
        $taxSetting = $this->TaxSetting->find('all');
        // pr($taxSetting);
        $this->paginate = array('order' => array('TaxSetting.id' => 'DESC'));
        $this->set('taxSettings', $this->paginate());
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Tax setting Details');
        if (!$this->TaxSetting->exists($id)) {
            throw new NotFoundException(__('Invalid tax setting'));
        }
        $options = array('conditions' => array('TaxSetting.' . $this->TaxSetting->primaryKey => $id));
        $this->set('taxSetting', $this->TaxSetting->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Tax setting');
        $type = $this->TaxSetting->getColumnType('applied_place_for');
        preg_match_all("/'(.*?)'/", $type, $enums);
        $applied_place_fo = $enums[1];
        $this->set('applied_place_for', $applied_place_fo);

        $type = $this->TaxSetting->getColumnType('add_sub');
        preg_match_all("/'(.*?)'/", $type, $enums);
        $applied_place_fo = $enums[1];
        $this->set('add_sub', $applied_place_fo);
        $this->loadModel('Location');
        $this->Location->reqursive = 1;
        $locations = $this->Location->find('list');
        $this->set('locations', $locations);
        // pr($location);

        if ($this->request->is('post')) {
            $this->TaxSetting->create();
            $this->request->data['TaxSetting']['updated_at'] = $this->current_datetime();
            $this->request->data['TaxSetting']['created_at'] = $this->current_datetime();
            $this->request->data['TaxSetting']['tax_applied_year'] = date("Y-m-d", strtotime($this->request->data['TaxSetting']['tax_applied_year']));
            //pr($this->request->data);            die();
            $this->request->data['TaxSetting']['created_by'] = $this->UserAuth->getUserId();
            if ($this->TaxSetting->save($this->request->data)) {
                $this->Session->setFlash(__('The tax setting has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The tax setting could not be saved. Please, try again.'), 'flash/error');
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
        $this->set('page_title', 'Edit Tax setting');
        $this->TaxSetting->id = $id;
        if (!$this->TaxSetting->exists($id)) {
            throw new NotFoundException(__('Invalid tax setting'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['TaxSetting']['updated_by'] = $this->UserAuth->getUserId();
            if ($this->TaxSetting->save($this->request->data)) {
                $this->Session->setFlash(__('The tax setting has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The tax setting could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $this->loadModel('Location');
            $this->Location->reqursive = 1;
            $locations = $this->Location->find('list');
            $this->set('locations', $locations);
            $type = $this->TaxSetting->getColumnType('add_sub');
            preg_match_all("/'(.*?)'/", $type, $enums);
            $applied_place_fo = $enums[1];
            $this->set('add_sub', $applied_place_fo);
            $options = array('conditions' => array('TaxSetting.' . $this->TaxSetting->primaryKey => $id));
            $this->request->data = $this->TaxSetting->find('first', $options);
            //pr($this->request->data);
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
        $this->TaxSetting->id = $id;
        if (!$this->TaxSetting->exists()) {
            throw new NotFoundException(__('Invalid tax setting'));
        }
        if ($this->TaxSetting->delete()) {
            $this->Session->setFlash(__('Tax setting deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Tax setting was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

}
