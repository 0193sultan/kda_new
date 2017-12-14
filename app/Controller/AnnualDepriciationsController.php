<?php

App::uses('AppController', 'Controller');
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of OpeningBalances
 *
 * @author USER-PC
 */
class AnnualDepriciationsController extends AppController {

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Paginator', 'Session');

    public function admin_index() {
        $this->loadModel('AccHeadList');
        $this->loadModel('FiscalYear');

        if ($this->request->is('post')) {
        	$fiscal_year_id = $this->request->data['fiscal_year_id'];
        	$annual_depriciations = $this->AnnualDepriciation->find('all', array('conditions'=>array('AnnualDepriciation.fiscal_year_id'=>$fiscal_year_id),'recursive'=>-1));

        	$all_fixed_asset_head = $this->AccHeadList->find('list', array(
        			'conditions'=>array(
        				'AccHeadList.acc_head_type_id'=>3
        				),
        			'fields'=>array('AccHeadList.id', 'AccHeadList.head_name'),
        			'recursive'=>-1
        		));
        	$this->set(compact('annual_depriciations', 'all_fixed_asset_head', 'fiscal_year_id'));
        }

        $fiscalYears = $this->FiscalYear->find('list');
        $this->set(compact('fiscalYears'));
    }

    public function admin_add() {
        $this->loadModel('AccHeadList');
        $this->loadModel('FiscalYear');

        if ($this->request->is('post')) {
        	$insert_flag = 0;
   			$fiscal_year_id = $this->request->data['AnnualDepriciation']['fiscal_year_id'];

   			$existing_count = $this->AnnualDepriciation->find('count', array('conditions'=>array('AnnualDepriciation.fiscal_year_id'=>$fiscal_year_id)));
   			if ($existing_count == 0) {
	        	foreach ($this->request->data['AnnualDepriciation']['acc_head_list_id'] as $key => $value) {
	        		$this->AnnualDepriciation->create();
	        		$annual_depriciation['AnnualDepriciation']['created_at'] = $this->current_datetime();
	        		$annual_depriciation['AnnualDepriciation']['user_id'] = $this->UserAuth->getUserId();
	        		$annual_depriciation['AnnualDepriciation']['fiscal_year_id'] = $this->request->data['AnnualDepriciation']['fiscal_year_id'];
	        		$annual_depriciation['AnnualDepriciation']['acc_head_list_id'] = $this->request->data['AnnualDepriciation']['acc_head_list_id'][$key];
	        		$annual_depriciation['AnnualDepriciation']['parent_id'] = $this->request->data['AnnualDepriciation']['parent_id'][$key];
	        		$annual_depriciation['AnnualDepriciation']['depriciation_value'] = $this->request->data['AnnualDepriciation']['depriciation_value'][$key]!=''?$this->request->data['AnnualDepriciation']['depriciation_value'][$key]:0;

	        		if ($this->AnnualDepriciation->save($annual_depriciation)) {
	        			$insert_flag = 1;
	        		}
	        	}
	        	if ($insert_flag == 1) {
					$this->Session->setFlash(__('The Annual Depriciation has been saved'), 'flash/success');
					$this->redirect(array('action' => 'index'));
				} else {
					$this->Session->setFlash(__('The Annual Depriciation could not be saved. Please, try again.'), 'flash/error');
				}
   			} else {
   				$this->Session->setFlash(__('The Annual Depriciation for this fiscal year already exist!'), 'flash/error');
   			}

        }

        $data = $this->AccHeadList->query("SELECT a.`id` a_id,a.`head_name`, b.`head_name` AS `sub_head_name`, b.id AS b_id FROM acc_head_lists a LEFT JOIN acc_head_lists b ON b.`parent_id` = a.`id` WHERE a.acc_head_type_id=3 AND a.parent_id=0 ORDER BY a.`id`");
        $fiscalYears = $this->FiscalYear->find('list');
        $this->set(compact('data', 'fiscalYears'));
    }

    public function admin_edit($fiscal_year_id=null) {
        $this->loadModel('AccHeadList');
        $this->loadModel('FiscalYear');

        if ($this->request->is('post')) {
        	$update_flag = 0;
        	foreach ($this->request->data['AnnualDepriciation']['id'] as $key => $value) {
        		$annual_depriciation['AnnualDepriciation']['id'] = $this->request->data['AnnualDepriciation']['id'][$key];
        		$annual_depriciation['AnnualDepriciation']['updated_at'] = $this->current_datetime();
        		$annual_depriciation['AnnualDepriciation']['user_id'] = $this->UserAuth->getUserId();
        		$annual_depriciation['AnnualDepriciation']['depriciation_value'] = $this->request->data['AnnualDepriciation']['depriciation_value'][$key]!=''?$this->request->data['AnnualDepriciation']['depriciation_value'][$key]:0;

        		if ($this->AnnualDepriciation->save($annual_depriciation)) {
        			$update_flag = 1;
        		}
        	}
        	if ($update_flag == 1) {
				$this->Session->setFlash(__('The Annual Depriciation has been updated'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The Annual Depriciation could not be updated. Please, try again.'), 'flash/error');
			}
        }

        $data = $this->AnnualDepriciation->find('all',array('conditions'=>array('AnnualDepriciation.fiscal_year_id'=>$fiscal_year_id)));

        $all_fixed_asset_head = $this->AccHeadList->find('list', array(
        		'conditions'=>array(
        			'AccHeadList.acc_head_type_id'=>3
        			),
        		'fields'=>array('AccHeadList.id', 'AccHeadList.head_name'),
        		'recursive'=>-1
        	));

        $fiscalYears = $this->FiscalYear->find('list');
        $this->set(compact('data', 'fiscalYears', 'all_fixed_asset_head', 'fiscal_year_id'));
    }

}
