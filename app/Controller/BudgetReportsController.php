<?php
App::uses('AppController', 'Controller');


class BudgetReportsController extends AppController {

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
        $this->set('page_title', 'Budget Report');
        $this->loadModel('FiscalYear');
        $this->loadModel('BudgetType');

        $fiscalYears = $this->FiscalYear->find('list');
        $budgetTypes = $this->BudgetType->find('list',array('conditions'=>array('BudgetType.status'=>'Active')));

        $this->set(compact('fiscalYears', 'budgetTypes'));
    }

    public function admin_get_budget_report() {
        $this->loadModel('FiscalYear');
        $this->loadModel('BudgetSchedule');
        $this->loadModel('BudgetDetail');
        $this->loadModel('BudgetHeadList');
        $budget_type_id = $this->request->data['budget_type_id'];
        $fiscal_year_id = $this->request->data['fiscal_year_id'];

        $all_schedule = $this->BudgetSchedule->find('all',array(
                'conditions'=>array('BudgetSchedule.status'=>'Active'),
                'recursive'=>-1
            ));

        foreach ($all_schedule as $key => $schedule) {
            $proposed_budget_report = $this->BudgetDetail->find('all',array(
                    'conditions'=>array(
                        'BudgetDetail.fiscal_year_id'=>$fiscal_year_id,
                        'BudgetDetail.budget_type_id'=>$budget_type_id,
                        'BudgetDetail.budget_category_id'=>1,
                        'BudgetDetail.budget_schedule_id'=>$schedule['BudgetSchedule']['id']
                        ),
                    'recursive'=>-1
                ));
            $propose_revised_budget_report = $this->BudgetDetail->find('all',array(
                    'conditions'=>array(
                        'BudgetDetail.fiscal_year_id'=>$fiscal_year_id-1,
                        'BudgetDetail.budget_type_id'=>$budget_type_id,
                        'BudgetDetail.budget_category_id'=>3,
                        'BudgetDetail.budget_schedule_id'=>$schedule['BudgetSchedule']['id']
                        ),
                    'recursive'=>-1
                ));
            $approved_budget_report = $this->BudgetDetail->find('all',array(
                    'conditions'=>array(
                        'BudgetDetail.fiscal_year_id'=>$fiscal_year_id-1,
                        'BudgetDetail.budget_type_id'=>$budget_type_id,
                        'BudgetDetail.budget_category_id'=>2,
                        'BudgetDetail.budget_schedule_id'=>$schedule['BudgetSchedule']['id']
                        ),
                    'recursive'=>-1
                ));
            $actual_budget_six_month_report = $this->BudgetDetail->find('all',array(
                    'conditions'=>array(
                        'BudgetDetail.fiscal_year_id'=>$fiscal_year_id-1,
                        'BudgetDetail.budget_type_id'=>$budget_type_id,
                        'BudgetDetail.budget_category_id'=>4,
                        'BudgetDetail.budget_schedule_id'=>$schedule['BudgetSchedule']['id']
                        ),
                    'recursive'=>-1
                ));
            $actual_budget_report = $this->BudgetDetail->find('all',array(
                    'conditions'=>array(
                        'BudgetDetail.fiscal_year_id'=>$fiscal_year_id-2,
                        'BudgetDetail.budget_type_id'=>$budget_type_id,
                        'BudgetDetail.budget_category_id'=>5,
                        'BudgetDetail.budget_schedule_id'=>$schedule['BudgetSchedule']['id']
                        ),
                    'recursive'=>-1
                ));
            foreach ($proposed_budget_report as $key => $value) {
                $budget_report[$schedule['BudgetSchedule']['id']]['proposed'][$key]=$value['BudgetDetail']['budget_amount'];
                $budget_report[$schedule['BudgetSchedule']['id']]['head_id'][$key]=$value['BudgetDetail']['budget_head_list_id'];
            }
            foreach ($approved_budget_report as $key => $value) {
                $budget_report[$schedule['BudgetSchedule']['id']]['approved'][$key]=$value['BudgetDetail']['budget_amount'];
            }
            foreach ($propose_revised_budget_report as $key => $value) {
                $budget_report[$schedule['BudgetSchedule']['id']]['revised'][$key]=$value['BudgetDetail']['budget_amount'];
            }
            foreach ($actual_budget_six_month_report as $key => $value) {
                $budget_report[$schedule['BudgetSchedule']['id']]['actual_six'][$key]=$value['BudgetDetail']['budget_amount'];
            }
            foreach ($actual_budget_report as $key => $value) {
                $budget_report[$schedule['BudgetSchedule']['id']]['actual'][$key]=$value['BudgetDetail']['budget_amount'];
            }
            //$budget_report[$schedule['BudgetSchedule']['id']]['a']=$proposed_budget_report;
            //$budget_report[$schedule['BudgetSchedule']['id']]['b']=$approved_budget_report;
            //$budget_report[$schedule['BudgetSchedule']['id']]['c']=$propose_revised_budget_report;
            //$budget_report[$schedule['BudgetSchedule']['id']]['d']=$actual_budget_six_month_report;
            //$budget_report[$schedule['BudgetSchedule']['id']]['e']=$actual_budget_report;
        }
        //pr($budget_report);die();
        $fiscal_year_list = $this->FiscalYear->find('list');
        $budget_head_list = $this->BudgetHeadList->find('list');
        $this->set(compact('budget_head_list_info', 'fiscal_year_list', 'fiscal_year_id', 'budget_head_list', 'all_schedule', 'budget_report'));

    }

}
