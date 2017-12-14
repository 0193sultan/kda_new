<?php

App::uses('AppController', 'Controller');

/**
 * AccHeadLists Controller
 *
 * @property AccHeadList $AccHeadList
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class AccHeadListsController extends AppController {

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Paginator', 'Session', 'Filter.Filter');

    /**
     * admin_index method
     *
     * @return void
     */
    public function admin_index() {
        $this->set('page_title', 'Acc head list List');
        $this->AccHeadList->recursive = 0;
        $this->paginate = array('order' => array('AccHeadList.id' => 'DESC'));
        $this->set('accHeadLists', $this->paginate());
        $accHeadTypes = $this->AccHeadList->AccHeadType->find('list',array('fields'=>array('id','head_type_name')));
        $this->set(compact('accHeadTypes'));
    }

    /**
     * admin_view method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_view($id = null) {
        $this->set('page_title', 'Acc head list Details');
        if (!$this->AccHeadList->exists($id)) {
            throw new NotFoundException(__('Invalid acc head list'));
        }
        $options = array('conditions' => array('AccHeadList.' . $this->AccHeadList->primaryKey => $id));
        $this->set('accHeadList', $this->AccHeadList->find('first', $options));
    }

    /**
     * admin_add method
     *
     * @return void
     */
    public function admin_add() {
        $this->set('page_title', 'Add Acc head list');
        if ($this->request->is('post')) {
            // pr($this->request->data);            die();
            $this->AccHeadList->create();
            $this->request->data['AccHeadList']['created_at'] = $this->current_datetime();
            $this->request->data['AccHeadList']['created_by'] = $this->UserAuth->getUserId();
            $this->request->data['AccHeadList']['order_no']=!empty($this->request->data['AccHeadList']['order_no'])?$this->request->data['AccHeadList']['order_no']:0;
            if ($this->AccHeadList->save($this->request->data)) {
                $this->Session->setFlash(__('The acc head list has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The acc head list could not be saved. Please, try again.'), 'flash/error');
            }
        }
        $this->loadModel('AccHeadType');
        $accHeadTypes = $this->AccHeadList->AccHeadType->find('list', array('fields' => array('AccHeadType.id', 'AccHeadType.head_type_name'), 'conditions' => array('AccHeadType.status' => 'Active')));
        //$accHeadLists = $this->AccHeadList->find('list', array('fields' => array('AccHeadList.id', 'AccHeadList.head_name'), 'conditions' => array('AccHeadList.parent_id' => 0)));
        $accHeadTypes[0] = '------- Please Select ------';
        ksort($accHeadTypes);
        //  $accHeadLists[0] = '------- Please Select ------';
        //  ksort($accHeadLists);

        $this->set(compact('accHeadTypes', 'accHeadLists'));
    }

    public function get_parent_head_name($parent_id) {
        $accHeadList = $this->AccHeadList->find('all', array(
            'conditions' => array(
                'AccHeadList.id' => $parent_id
            ),
            'fields' => 'AccHeadList.id,AccHeadList.head_name',
            'recursive' => -1
        ));
        if (count($accHeadList) > 0) {
            return $accHeadList[0]['AccHeadList']['head_name'];
        } else {
            return '';
        }
    }

    public function admin_get_parent_list() {
        // $this->request->data('acc_head_type_id')=3;
        $accHeadList = $this->AccHeadList->find('all', array(
            'conditions' => array(
                'AccHeadList.acc_head_type_id' => $this->request->data('acc_head_type_id'),
                'AccHeadList.parent_id' => 0
            ),
            'fields' => 'AccHeadList.id,AccHeadList.head_name,AccHeadList.head_code',
            'recursive' => -1
        ));
        foreach ($accHeadList as $key => $value) {
            $result[$key]['AccHeadList']['id'] = $value['AccHeadList']['id'];
            $result[$key]['AccHeadList']['head_name'] = !empty($value['AccHeadList']['head_code'])?'('.$value['AccHeadList']['head_code'].')'.$value['AccHeadList']['head_name']:$value['AccHeadList']['head_name'];
        }
        echo json_encode($result);

        $this->autoRender = false;
    }

    /**
     * admin_edit method
     *
     * @throws NotFoundException
     * @param string $id
     * @return void
     */
    public function admin_edit($id = null) {
        $this->set('page_title', 'Edit Acc head list');
        $this->AccHeadList->id = $id;
        if (!$this->AccHeadList->exists($id)) {
            throw new NotFoundException(__('Invalid acc head list'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            //pr($this->request->data);die();
            $this->request->data['AccHeadList']['updated_by'] = $this->UserAuth->getUserId();
            if ($this->AccHeadList->save($this->request->data)) {
                $this->Session->setFlash(__('The acc head list has been saved'), 'flash/success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The acc head list could not be saved. Please, try again.'), 'flash/error');
            }
        } else {
            $options = array('conditions' => array('AccHeadList.' . $this->AccHeadList->primaryKey => $id));
            $this->request->data = $this->AccHeadList->find('first', $options);
            $parent_id = $this->request->data['AccHeadList']['parent_id'];
        }
        $this->loadModel('AccHeadType');
        $accHeadTypes = $this->AccHeadList->AccHeadType->find('list', array('fields' => array('AccHeadType.id', 'AccHeadType.head_type_name'), 'conditions' => array('AccHeadType.status' => 'Active')));
        // $accHeadLists = $this->AccHeadList->find('list', array('fields' => array('AccHeadList.id', 'AccHeadList.head_name'), 'conditions' => array('AccHeadList.parent_id' => 0)));
        $accHeadTypes[0] = '------- Please Select ------';
        ksort($accHeadTypes);
        $this->set(compact('accHeadTypes', 'accHeadLists', 'parent_id'));
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
        $this->AccHeadList->id = $id;
        if (!$this->AccHeadList->exists()) {
            throw new NotFoundException(__('Invalid acc head list'));
        }
        if ($this->AccHeadList->delete()) {
            $this->Session->setFlash(__('Acc head list deleted'), 'flash/success');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Acc head list was not deleted'), 'flash/error');
        $this->redirect(array('action' => 'index'));
    }

}
