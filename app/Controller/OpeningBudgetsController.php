<?php
App::uses('AppController', 'Controller');


class OpeningBudgetsController extends AppController {

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
        $this->set('page_title', 'Opening Budget');
        $this->loadModel('FiscalYear');
        $this->loadModel('BudgetSchedule');
        $this->loadModel('BudgetType');
        $this->loadModel('BudgetDetail');

        if ($this->request->is('post')) {
            $fiscal_year_id = $this->request->data['fiscal_year_id'];
            $budget_schedule_id = $this->request->data['budget_schedule_id'];
            $budget_type_id = $this->request->data['budget_type_id'];
            $data_insert_flag = 0;

            $existing_opening_budget = $this->BudgetDetail->find('count',array(
                    'conditions'=>array(
                        'BudgetDetail.fiscal_year_id'=>$fiscal_year_id,
                        'BudgetDetail.budget_schedule_id'=>$budget_schedule_id,
                        'BudgetDetail.budget_type_id'=>$budget_type_id
                        )
                ));

            if ($existing_opening_budget == 0) {
                foreach ($this->request->data['budget_amount'] as $key => $value) {
                    $this->BudgetDetail->create();
                    $opening_budget['BudgetDetail']['fiscal_year_id'] = $fiscal_year_id;
                    $opening_budget['BudgetDetail']['budget_schedule_id'] = $budget_schedule_id;
                    $opening_budget['BudgetDetail']['budget_head_list_id'] = $key;
                    $opening_budget['BudgetDetail']['budget_category_id'] = 5;
                    $opening_budget['BudgetDetail']['budget_type_id'] = $budget_type_id;
                    $opening_budget['BudgetDetail']['budget_amount'] = $value!=''?$value:0;
                    $opening_budget['BudgetDetail']['created_by'] = $this->UserAuth->getUserId();
                    $opening_budget['BudgetDetail']['created_at'] = $this->current_datetime();
                    $this->BudgetDetail->save($opening_budget);
                    $data_insert_flag = 1;
                }
                if ($data_insert_flag == 1) {
                    $this->Session->setFlash(__('The Opening Budget has been saved'), 'flash/success');
                    $this->redirect(array('action' => 'index'));
                } else {
                    $this->Session->setFlash(__('The Opening Budget could not be saved. Please, try again.'), 'flash/error');
                }
            } else {
                $this->Session->setFlash(__('The Opening Budget already exist for this fiscal year!'), 'flash/error');
            }
        }


        $fiscalYears = $this->FiscalYear->find('list');
        $budgetSchedules = $this->BudgetSchedule->find('list',array('conditions'=>array('BudgetSchedule.status'=>'Active')));
        $budgetTypes = $this->BudgetType->find('list',array('conditions'=>array('BudgetType.status'=>'Active')));

        $this->set(compact('fiscalYears', 'budgetSchedules', 'budgetTypes'));
    }

    public function admin_get_budget_schedule_heads() {
        $this->loadModel('BudgetHeadList');
        $budget_schedule_id = $this->request->data['budget_schedule_id'];

        $budget_head_list_info = $this->BudgetHeadList->find('all',array(
                'conditions'=>array(
                    'BudgetHeadList.budget_schedule_id'=>$budget_schedule_id,
                    'BudgetHeadList.status'=>'Active'
                    ),
                'recursive'=>-1
            ));

        $this->set(compact('budget_head_list_info'));

    }

}
