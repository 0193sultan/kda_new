<?php

class ApisController extends AppController {

//comment by shahed
    /**
     * Components
     *
     * @var array
     */
    // public $uses = array('ConfigMeta', 'EmployeeHouseRentSetting');
    public $components = array('Paginator', 'Session');

    public function admin_getmeta($key = '') {
        $this->LoadModel('ConfigMeta');
        $meta = $this->ConfigMeta->find('all', array('conditions' => array('ConfigMeta.key' => $key)));
        $this->ConfigMeta->recusive = 0;
        if (empty($meta)) {
            
        } else {
            echo $meta[0]['ConfigMeta']['value'];
        }
        //pr($meta[0]['ConfigMeta']['value']);
        $this->autoRender = false;
    }

    public function admin_get_house_rent($basic = '', $location = '', $year = '') {

        if ($basic == '' || $basic == 0 || $location == '' || $year == '') {
            echo -200;
            $this->autoRender = false;
            return FALSE;
        }

        $this->LoadModel('EmployeeHouseRentSetting');

        $conditions = array(
            'conditions' => array(
                '? BETWEEN min_basic AND max_basic AND 	location_id=? AND gazette_year=?' => array($basic, $location, $year)
        ));

        $employeeHouseRent = $this->EmployeeHouseRentSetting->find('all', $conditions);

        if (count($employeeHouseRent) < 1) {
            echo 0;
            $this->autoRender = false;
            return false;
        }
        $empInfo = $employeeHouseRent[0]['EmployeeHouseRentSetting'];
        $rent = ($basic * $empInfo['house_rent_percent']) / 100;

        if ($rent >= $empInfo['house_rent_min']) {
            echo $rent;
        } else {
            echo $empInfo['house_rent_min'];
        }
        $this->autoRender = false;
    }

    public function admin_get_tax($basic_salary = '', $locations = '') {
        if ($basic_salary == '' || $basic_salary == 0 || $locations == '') {
            echo -200;
            $this->autoRender = false;
            return FALSE;
        }
        $year_salary = $basic_salary * 12;

        $this->LoadModel('TaxSetting');
        $conditions = array(
            'conditions' => array(
                'TaxSetting.tax_executable_amount <=? AND TaxSetting.location_id=?' => array($year_salary, $locations)
        ));
        $meta = $this->TaxSetting->find('all', $conditions);
//echo count($meta);
        if (count($meta) < 1) {
            echo 0;
            $this->autoRender = false;
            return false;
        }
        echo $meta[0]['TaxSetting']['monthly_recovery'];
        // pr($meta);
        $this->autoRender = false;
    }

    public function admin_get_water_bills($grade = '', $living_status = '') {
        if ($grade == '' || $grade == 0 || $living_status == '') {
            echo -200;
            $this->autoRender = false;
            return FALSE;
        }
        $this->LoadModel('WarterSupplySetting');
        $conditions = array(
            'conditions' => array(
                '? BETWEEN grade_start AND grade_end AND living_status_id=?' => array($grade, $living_status)
        ));
        $meta = $this->WarterSupplySetting->find('all', $conditions);
        if (count($meta) < 1) {
            echo 0;
            $this->autoRender = false;
            return false;
        }
        echo $meta[0]['WarterSupplySetting']['water_bill'];
        // pr($meta);
        $this->autoRender = false;
    }

    public function admin_get_months() {
        $grade_id = $this->request->data('yearId');
        $this->LoadModel('FiscalYearSetting');
        $conditions = array('FiscalYearSetting.fiscal_year_id' => $grade_id);
        $months = $this->FiscalYearSetting->find('all', array('conditions' => $conditions));
        $array = [];
        foreach ($months as $key => $value) {
            $array[$value['Month']['id']] = $value['Month']['name'];
        }
        //  pr($array);
        // $increment_list = $this->Scale->find('all', array('fields' => array('Scale.id', 'Scale.employee_grade_id', 'Scale.grade_basic'), array('conditions' => array('Scale.employee_grade_id' => $grade_id))));
        $this->FiscalYearSetting->recursive = 1;

        //$increment_range = $this->Employee->Scale->find('first', array('conditions' => array('Scale.employee_grade_id' => $grade_id), 'fields' => array('MIN(Scale.name) as min', 'MAX(Scale.name) as max')));
        echo json_encode($array);
        $this->autoRender = false;
    }

}
