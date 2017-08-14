<?php
App::uses('AppController', 'Controller');
/**
 * FiscalYearSettings Controller
 *
 * @property FiscalYearSetting $FiscalYearSetting
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class FiscalYearSettingsController extends AppController {

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
		$this->set('page_title','Fiscal year setting List');
		$this->FiscalYearSetting->recursive = 0;
		$this->paginate = array('order' => array('FiscalYearSetting.id' => 'DESC'));
		$this->set('fiscalYearSettings', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->set('page_title','Fiscal year setting Details');
		if (!$this->FiscalYearSetting->exists($id)) {
			throw new NotFoundException(__('Invalid fiscal year setting'));
		}
		$options = array('conditions' => array('FiscalYearSetting.' . $this->FiscalYearSetting->primaryKey => $id));
		$this->set('fiscalYearSetting', $this->FiscalYearSetting->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		$this->set('page_title','Add Fiscal year setting');
		if ($this->request->is('post')) {
			$this->FiscalYearSetting->create();
			$this->request->data['FiscalYearSetting']['created_at'] = $this->current_datetime();
			$this->request->data['FiscalYearSetting']['created_by'] = $this->UserAuth->getUserId();	

			$data = $this->request->data; #ADD BY ARAFAT
			$length = count($data['month_id']);
			$dta = array();
			
			for($i = 0; $i<$length; $i++)
			{
				$dta['month_id'] = $data['month_id'][$i];
				$dta['working_day'] = $data['working_day'][$i];
				$dta['fiscal_year_id'] = $data['FiscalYearSetting']['fiscal_year_id'];

				$res = $this->FiscalYearSetting->saveAll($dta, array('deep' => true));
			}

			if ($res)
			{
				$this->Session->setFlash(__('The fiscal year setting has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The fiscal year setting could not be saved. Please, try again.'), 'flash/error');
			}
		}
		$fiscalYears = $this->FiscalYearSetting->FiscalYear->find('list');
		$months = $this->FiscalYearSetting->Month->find('list');
		$this->set(compact('fiscalYears', 'months'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
        $this->set('page_title','Edit Fiscal year setting');
		$this->FiscalYearSetting->id = $id;
		if (!$this->FiscalYearSetting->exists($id)) {
			throw new NotFoundException(__('Invalid fiscal year setting'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->request->data['FiscalYearSetting']['updated_by'] = $this->UserAuth->getUserId();
			if ($this->FiscalYearSetting->save($this->request->data)) {
				$this->Session->setFlash(__('The fiscal year setting has been saved'), 'flash/success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The fiscal year setting could not be saved. Please, try again.'), 'flash/error');
			}
		} else {
			$options = array('conditions' => array('FiscalYearSetting.' . $this->FiscalYearSetting->primaryKey => $id));
			$this->request->data = $this->FiscalYearSetting->find('first', $options);
		}
		$fiscalYears = $this->FiscalYearSetting->FiscalYear->find('list');
		$months = $this->FiscalYearSetting->Month->find('list');
		$this->set(compact('fiscalYears', 'months'));
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
		$this->FiscalYearSetting->id = $id;
		if (!$this->FiscalYearSetting->exists()) {
			throw new NotFoundException(__('Invalid fiscal year setting'));
		}
		if ($this->FiscalYearSetting->delete()) {
			$this->Session->setFlash(__('Fiscal year setting deleted'), 'flash/success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Fiscal year setting was not deleted'), 'flash/error');
		$this->redirect(array('action' => 'index'));
	}
}
