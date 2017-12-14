<?php
App::uses('AppController', 'Controller');


class CreateBudgetsController extends AppController {

/**
 * Components
 *
 * @var array
 */

	public $uses = false;
	public $components = array('Paginator', 'Session');


/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
        $this->set('page_title', 'Create Budget');
        $this->loadModel('FiscalYear');
        $this->loadModel('BudgetSchedule');
        $this->loadModel('BudgetType');
        $this->loadModel('BudgetCategory');
        $this->loadModel('BudgetDetail');

        if ($this->request->is('post')) {
            $fiscal_year_id = $this->request->data['fiscal_year_id'];
            $budget_schedule_id = $this->request->data['budget_schedule_id'];
            $budget_type_id = $this->request->data['budget_type_id'];
            $budget_category_id = $this->request->data['budget_category_id'];
            $data_insert_flag = 0;

            $existing_opening_budget = $this->BudgetDetail->find('count',array(
                    'conditions'=>array(
                        'BudgetDetail.fiscal_year_id'=>$fiscal_year_id,
                        'BudgetDetail.budget_schedule_id'=>$budget_schedule_id,
                        'BudgetDetail.budget_type_id'=>$budget_type_id,
                        'BudgetDetail.budget_category_id'=>$budget_category_id
                        )
                ));

            if ($existing_opening_budget == 0) {
                foreach ($this->request->data['budget_amount'] as $key => $value) {
                    $this->BudgetDetail->create();
                    $create_budget['BudgetDetail']['fiscal_year_id'] = $fiscal_year_id;
                    $create_budget['BudgetDetail']['budget_schedule_id'] = $budget_schedule_id;
                    $create_budget['BudgetDetail']['budget_head_list_id'] = $key;
                    $create_budget['BudgetDetail']['budget_category_id'] = $budget_category_id;
                    $create_budget['BudgetDetail']['budget_type_id'] = $budget_type_id;
                    $create_budget['BudgetDetail']['budget_amount'] = $value!=''?$value:0;
                    $create_budget['BudgetDetail']['created_by'] = $this->UserAuth->getUserId();
                    $create_budget['BudgetDetail']['created_at'] = $this->current_datetime();
                    $this->BudgetDetail->save($create_budget);
                    $data_insert_flag = 1;
                }
                if ($data_insert_flag == 1) {
                    $this->Session->setFlash(__('The Budget has been saved'), 'flash/success');
                    $this->redirect(array('action' => 'index'));
                } else {
                    $this->Session->setFlash(__('The Budget could not be saved. Please, try again.'), 'flash/error');
                }
            } else {
                $this->Session->setFlash(__('The Budget already exist for this fiscal year!'), 'flash/error');
            }
        }

        $fiscalYears = $this->FiscalYear->find('list');
        $budgetSchedules = $this->BudgetSchedule->find('list',array('conditions'=>array('BudgetSchedule.status'=>'Active')));
        $budgetTypes = $this->BudgetType->find('list',array('conditions'=>array('BudgetType.status'=>'Active')));
        $budgetCategories = $this->BudgetCategory->find('list',array('conditions'=>array('BudgetCategory.status'=>'Active')));

        $this->set(compact('fiscalYears', 'budgetSchedules', 'budgetTypes', 'budgetCategories'));
    }

    public function admin_get_proposed_budget() {
        $this->loadModel('BudgetHeadList');
        $this->loadModel('FiscalYear');
        $this->loadModel('BudgetDetail');
        $budget_schedule_id = $this->request->data['budget_schedule_id'];
        $fiscal_year_id = $this->request->data['fiscal_year_id'];
        $budget_type_id = $this->request->data['budget_type_id'];

        $budget_head_list_info = $this->BudgetHeadList->find('all',array(
                'conditions'=>array(
                    'BudgetHeadList.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetHeadList.status'=>'Active'
                    ),
                'recursive'=>-1
            ));

        $prev_approved_budget_detail_info = $this->BudgetDetail->find('all',array(
                'conditions'=>array(
                    'BudgetDetail.fiscal_year_id'=>$fiscal_year_id-1,
                    'BudgetDetail.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetDetail.budget_type_id'=>$budget_type_id,
                    'BudgetDetail.budget_category_id'=>2
                    ),
                'recursive'=>-1
            ));

        foreach ($prev_approved_budget_detail_info as $key => $value) {
            $budget_head_list_info[$key]['PrevApprovedBudget'] = $value['BudgetDetail'];
        }

        $fiscal_year_list = $this->FiscalYear->find('list');
        $this->set(compact('budget_head_list_info', 'fiscal_year_id', 'fiscal_year_list'));
    }


    public function admin_get_approved_budget() {
        $this->loadModel('BudgetHeadList');
        $this->loadModel('FiscalYear');
        $this->loadModel('BudgetDetail');
        $budget_schedule_id = $this->request->data['budget_schedule_id'];
        $fiscal_year_id = $this->request->data['fiscal_year_id'];
        $budget_type_id = $this->request->data['budget_type_id'];

        $budget_head_list_info = $this->BudgetHeadList->find('all',array(
                'conditions'=>array(
                    'BudgetHeadList.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetHeadList.status'=>'Active'
                    ),
                'recursive'=>-1
            ));

        $prev_approved_budget_detail_info = $this->BudgetDetail->find('all',array(
                'conditions'=>array(
                    'BudgetDetail.fiscal_year_id'=>$fiscal_year_id-1,
                    'BudgetDetail.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetDetail.budget_type_id'=>$budget_type_id,
                    'BudgetDetail.budget_category_id'=>2
                    ),
                'recursive'=>-1
            ));

        $proposed_budget_detail_info = $this->BudgetDetail->find('all',array(
                'conditions'=>array(
                    'BudgetDetail.fiscal_year_id'=>$fiscal_year_id,
                    'BudgetDetail.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetDetail.budget_type_id'=>$budget_type_id,
                    'BudgetDetail.budget_category_id'=>1
                    ),
                'recursive'=>-1
            ));

        foreach ($prev_approved_budget_detail_info as $key => $value) {
            $budget_head_list_info[$key]['PrevApprovedBudget'] = $value['BudgetDetail'];
        }
        foreach ($proposed_budget_detail_info as $key => $value) {
            $budget_head_list_info[$key]['ProposedBudget'] = $value['BudgetDetail'];
        }

        $fiscal_year_list = $this->FiscalYear->find('list');
        $this->set(compact('budget_head_list_info', 'fiscal_year_id', 'fiscal_year_list'));
    }


    public function admin_get_propose_revised_budget() {
        $this->loadModel('BudgetHeadList');
        $this->loadModel('FiscalYear');
        $this->loadModel('BudgetDetail');
        $budget_schedule_id = $this->request->data['budget_schedule_id'];
        $fiscal_year_id = $this->request->data['fiscal_year_id'];
        $budget_type_id = $this->request->data['budget_type_id'];

        $budget_head_list_info = $this->BudgetHeadList->find('all',array(
                'conditions'=>array(
                    'BudgetHeadList.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetHeadList.status'=>'Active'
                    ),
                'recursive'=>-1
            ));

        $prev_approved_budget_detail_info = $this->BudgetDetail->find('all',array(
                'conditions'=>array(
                    'BudgetDetail.fiscal_year_id'=>$fiscal_year_id-1,
                    'BudgetDetail.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetDetail.budget_type_id'=>$budget_type_id,
                    'BudgetDetail.budget_category_id'=>2
                    ),
                'recursive'=>-1
            ));

        $proposed_budget_detail_info = $this->BudgetDetail->find('all',array(
                'conditions'=>array(
                    'BudgetDetail.fiscal_year_id'=>$fiscal_year_id,
                    'BudgetDetail.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetDetail.budget_type_id'=>$budget_type_id,
                    'BudgetDetail.budget_category_id'=>1
                    ),
                'recursive'=>-1
            ));

        $approved_budget_detail_info = $this->BudgetDetail->find('all',array(
                'conditions'=>array(
                    'BudgetDetail.fiscal_year_id'=>$fiscal_year_id,
                    'BudgetDetail.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetDetail.budget_type_id'=>$budget_type_id,
                    'BudgetDetail.budget_category_id'=>2
                    ),
                'recursive'=>-1
            ));

        foreach ($prev_approved_budget_detail_info as $key => $value) {
            $budget_head_list_info[$key]['PrevApprovedBudget'] = $value['BudgetDetail'];
        }
        foreach ($proposed_budget_detail_info as $key => $value) {
            $budget_head_list_info[$key]['ProposedBudget'] = $value['BudgetDetail'];
        }
        foreach ($approved_budget_detail_info as $key => $value) {
            $budget_head_list_info[$key]['ApprovedBudget'] = $value['BudgetDetail'];
        }

        $fiscal_year_list = $this->FiscalYear->find('list');
        $this->set(compact('budget_head_list_info', 'fiscal_year_id', 'fiscal_year_list'));
    }


    public function admin_get_actual_six_month_budget() {
        $this->loadModel('BudgetHeadList');
        $this->loadModel('FiscalYear');
        $this->loadModel('BudgetDetail');
        $budget_schedule_id = $this->request->data['budget_schedule_id'];
        $fiscal_year_id = $this->request->data['fiscal_year_id'];
        $budget_type_id = $this->request->data['budget_type_id'];

        $budget_head_list_info = $this->BudgetHeadList->find('all',array(
                'conditions'=>array(
                    'BudgetHeadList.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetHeadList.status'=>'Active'
                    ),
                'recursive'=>-1
            ));

        $proposed_budget_detail_info = $this->BudgetDetail->find('all',array(
                'conditions'=>array(
                    'BudgetDetail.fiscal_year_id'=>$fiscal_year_id,
                    'BudgetDetail.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetDetail.budget_type_id'=>$budget_type_id,
                    'BudgetDetail.budget_category_id'=>1
                    ),
                'recursive'=>-1
            ));

        foreach ($proposed_budget_detail_info as $key => $value) {
            $budget_head_list_info[$key]['ProposedBudget'] = $value['BudgetDetail'];
        }

        $fiscal_year_list = $this->FiscalYear->find('list');
        $this->set(compact('budget_head_list_info', 'fiscal_year_id', 'fiscal_year_list'));
    }


    public function admin_get_actual_budget() {
        $this->loadModel('BudgetHeadList');
        $this->loadModel('FiscalYear');
        $this->loadModel('BudgetDetail');
        $budget_schedule_id = $this->request->data['budget_schedule_id'];
        $fiscal_year_id = $this->request->data['fiscal_year_id'];
        $budget_type_id = $this->request->data['budget_type_id'];

        $budget_head_list_info = $this->BudgetHeadList->find('all',array(
                'conditions'=>array(
                    'BudgetHeadList.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetHeadList.status'=>'Active'
                    ),
                'recursive'=>-1
            ));

        $proposed_budget_detail_info = $this->BudgetDetail->find('all',array(
                'conditions'=>array(
                    'BudgetDetail.fiscal_year_id'=>$fiscal_year_id,
                    'BudgetDetail.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetDetail.budget_type_id'=>$budget_type_id,
                    'BudgetDetail.budget_category_id'=>1
                    ),
                'recursive'=>-1
            ));

        $approved_budget_detail_info = $this->BudgetDetail->find('all',array(
                'conditions'=>array(
                    'BudgetDetail.fiscal_year_id'=>$fiscal_year_id,
                    'BudgetDetail.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetDetail.budget_type_id'=>$budget_type_id,
                    'BudgetDetail.budget_category_id'=>2
                    ),
                'recursive'=>-1
            ));

        $propose_revised_budget_detail_info = $this->BudgetDetail->find('all',array(
                'conditions'=>array(
                    'BudgetDetail.fiscal_year_id'=>$fiscal_year_id,
                    'BudgetDetail.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetDetail.budget_type_id'=>$budget_type_id,
                    'BudgetDetail.budget_category_id'=>3
                    ),
                'recursive'=>-1
            ));

        foreach ($proposed_budget_detail_info as $key => $value) {
            $budget_head_list_info[$key]['ProposedBudget'] = $value['BudgetDetail'];
        }
        foreach ($approved_budget_detail_info as $key => $value) {
            $budget_head_list_info[$key]['ApprovedBudget'] = $value['BudgetDetail'];
        }
        foreach ($propose_revised_budget_detail_info as $key => $value) {
            $budget_head_list_info[$key]['ProposeRevisedBudget'] = $value['BudgetDetail'];
        }

        $fiscal_year_list = $this->FiscalYear->find('list');
        $this->set(compact('budget_head_list_info', 'fiscal_year_id', 'fiscal_year_list'));
    }

}