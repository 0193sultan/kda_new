<?php

/**
 * Application level Controller
 *
 * This file is application-wide controller file. You can put all
 * application-wide controller-related methods here.
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Controller
 * @since         CakePHP(tm) v 0.2.9
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */
App::uses('Controller', 'Controller');

/**
 * Application Controller
 *
 * Add your application-wide methods in the class below, your controllers
 * will inherit them.
 *
 * @package		app.Controller
 * @link		http://book.cakephp.org/2.0/en/controllers.html#the-app-controller
 */
class AppController extends Controller {

    public $theme = "CakeAdminLTE";
    var $helpers = array('App', 'Form', 'Html', 'Session', 'Js', 'Usermgmt.UserAuth');
    public $components = array('Session', 'RequestHandler', 'App', 'Usermgmt.UserAuth');

    function beforeFilter() {
        /* if($this->request->params['controller'] == 'products'){
          return true;
          } */

        if ($this->UserAuth->getUserId() == '' AND $this->request->params['action'] == 'login') {
            return true;
        } else if ($this->UserAuth->getUserId() == '' AND $this->request->params['action'] != 'login' AND $this->request->params['controller'] != 'api_data_retrives') {
            $this->Session->setFlash('You need to be signed in to view this page.');
            $this->redirect('/admin/login');
        }


        if ($this->RequestHandler->isAjax() OR $this->request->params['controller'] == 'api_data_retrives') {
            
        } else {
            $this->userAuth();
            $this->set('page_title', 'DashBoards');
            $side_menu = $this->side_menu();
            $this->set('menu', $side_menu);
        }
        //parent::beforeFilter();
    }

    private function userAuth() {
        $this->UserAuth->beforeFilter($this);
    }

    private function side_menu() {
        $menu = array(
            'allUsers' => array('title' => 'WarterSupplySettings', 'controller' => 'WarterSupplySettings', 'action' => 'index', 'icon' => '<i class="fa fa-user"></i>', 'scroll' => '0',
                'child' => array(
                    'allUsers' => array('title' => 'Index', 'controller' => 'WarterSupplySettings', 'action' => 'index'),
                    'allGroups' => array('title' => 'User Groups', 'controller' => 'WarterSupplySettings', 'action' => 'index'),
                    'permissions' => array('title' => 'Group Permissions', 'controller' => 'WarterSupplySettings', 'action' => 'index'),
                )),
            'BankInfos' => array('title' => 'Bank Infos', 'controller' => 'BankInfos', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'BankInfos' => array('title' => 'BankInfo List', 'controller' => 'BankInfos', 'action' => 'admin_index'),
                    'BankInfos/add' => array('title' => 'BankInfo Add', 'controller' => 'BankInfos', 'action' => 'admin_add')
                )),
            /* 'Banks' => array('title' => 'Banks', 'controller' => 'Banks', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
              'child' => array(
              'Banks' => array('title' => 'Banks List', 'controller' => 'Banks', 'action' => 'admin_index'),
              'Banks/add' => array('title' => 'Banks Add', 'controller' => 'Banks', 'action' => 'admin_add')
              )),
              'Basics' => array('title' => 'Basics', 'controller' => 'Basics', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
              'child' => array(
              'Basics' => array('title' => 'Basics List', 'controller' => 'Basics', 'action' => 'admin_index'),
              'Basics/add' => array('title' => 'Basics Add', 'controller' => 'Basics', 'action' => 'admin_add')
              )), */
            'Departments' => array('title' => 'Departments', 'controller' => 'Departments', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'Departments' => array('title' => 'Departments List', 'controller' => 'Departments', 'action' => 'admin_index'),
                    'Departments/add' => array('title' => 'Departments Add', 'controller' => 'Departments', 'action' => 'admin_add')
                )),
            'Designations' => array('title' => 'Designations', 'controller' => 'Designations', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'Designations' => array('title' => 'Designations List', 'controller' => 'Designations', 'action' => 'admin_index'),
                    'Designations/add' => array('title' => 'Designations Add', 'controller' => 'Designations', 'action' => 'admin_add')
                )),
            'EduStatuses' => array('title' => 'Edu Statuses', 'controller' => 'EduStatuses', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'EduStatuses' => array('title' => 'Edu. Statuses List', 'controller' => 'EduStatuses', 'action' => 'admin_index'),
                    'EduStatuses/add' => array('title' => 'Designations Add', 'controller' => 'EduStatuses', 'action' => 'admin_add')
                )),
            'EmployeeGrades' => array('title' => 'Employee Grades', 'controller' => 'EmployeeGrades', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'EmployeeGrades' => array('title' => 'Grades List', 'controller' => 'EmployeeGrades', 'action' => 'admin_index'),
                    'EmployeeGrades/add' => array('title' => 'Grades Add', 'controller' => 'EmployeeGrades', 'action' => 'admin_add'),
                    'Scales' => array('title' => 'Scales List', 'controller' => 'Scales', 'action' => 'admin_index'),
                    'Scales/add' => array('title' => 'Scales Add', 'controller' => 'Scales', 'action' => 'admin_add')
                )),
            'EmployeeHouseRentSettings' => array('title' => 'House Rent Settings', 'controller' => 'EmployeeHouseRentSettings', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'EmployeeHouseRentSettings' => array('title' => 'House Rent List', 'controller' => 'EmployeeHouseRentSettings', 'action' => 'admin_index'),
                    'EmployeeHouseRentSettings/add' => array('title' => 'House Rent Add', 'controller' => 'EmployeeHouseRentSettings', 'action' => 'admin_add')
                )),
            'Employees' => array('title' => 'Employees', 'controller' => 'Employees', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'Employees' => array('title' => 'Employees List', 'controller' => 'Employees', 'action' => 'admin_index'),
                    'Employees/add' => array('title' => 'Employees Add', 'controller' => 'Employees', 'action' => 'admin_add')
                )),
            'EmployeeLoans' => array('title' => 'Employee Loans', 'controller' => 'EmployeeLoans', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'EmployeeLoans' => array('title' => 'Employee Loans List', 'controller' => 'EmployeeLoans', 'action' => 'admin_index'),
                    'EmployeeLoans/add' => array('title' => 'Employee Loans Add', 'controller' => 'EmployeeLoans', 'action' => 'admin_add')
                )),
            'Loans Recovery Register' => array('title' => 'Recovery Register', 'controller' => 'LoanRecoveries', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'LoanRecoveries' => array('title' => 'Loans Recovery List', 'controller' => 'LoanRecoveries', 'action' => 'admin_index'),
                    'OtherRegisters' => array('title' => 'Other Registers', 'controller' => 'OtherRegisters', 'action' => 'admin_index'),
                )),
            'EmployeeSalarySheets' => array('title' => 'Employee Salary', 'controller' => 'EmployeeSalarySheets', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'EmployeeSalarySheets' => array('title' => 'Employee Salary Sheets', 'controller' => 'EmployeeSalarySheets', 'action' => 'admin_index'),
                    'MonthlySalaryNotes' => array('title' => 'Monthly Salary Notes', 'controller' => 'MonthlySalaryNotes', 'action' => 'admin_index'),
                    'MonthlySalaryNotes/add' => array('title' => 'Monthly Salary Notes Add', 'controller' => 'MonthlySalaryNotes', 'action' => 'admin_add'),
                    //'MonthlySalaryNotes/print_view' => array('title' => 'Monthly Notes View', 'controller' => 'MonthlySalaryNotes', 'action' => 'admin_print_view'),
                    'SalaryCertificates' => array('title' => 'Salary Certificates', 'controller' => 'SalaryCertificates', 'action' => 'admin_index'),
                    'SallarySummarySheets' => array('title' => 'Sallary Summary Sheets', 'controller' => 'SallarySummarySheets', 'action' => 'admin_index')
                )
            ),
            'SalarySheets' => array('title' => 'Salary Sheets', 'controller' => 'Employees', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'SalarySheets' => array('title' => 'Salary Sheets', 'controller' => 'Employees', 'action' => 'admin_index'),
                    'SalarySheets/add' => array('title' => 'Salary Sheets Add', 'controller' => 'Employees', 'action' => 'admin_add')
                )),
            'EmployeeTypes' => array('title' => 'Employee Types', 'controller' => 'EmployeeTypes', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'EmployeeTypes' => array('title' => 'Employee Types List', 'controller' => 'EmployeeTypes', 'action' => 'admin_index'),
                    'EmployeeTypes/add' => array('title' => 'Employee Types Add', 'controller' => 'EmployeeTypes', 'action' => 'admin_add')
                )),
            'FiscalYears' => array('title' => 'FiscalYears', 'controller' => 'FiscalYears', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'FiscalYears' => array('title' => 'Fiscal Years List', 'controller' => 'FiscalYears', 'action' => 'admin_index'),
                    'FiscalYears/add' => array('title' => 'Fiscal Years Add', 'controller' => 'FiscalYears', 'action' => 'admin_add')
                )),
            'FiscalYearSettings' => array('title' => 'Fiscal Year Settings', 'controller' => 'FiscalYearSettings', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'FiscalYearSettings' => array('title' => 'Fiscal Year List', 'controller' => 'FiscalYearSettings', 'action' => 'admin_index'),
                    'FiscalYearSettings/add' => array('title' => 'Fiscal Year Add', 'controller' => 'FiscalYearSettings', 'action' => 'admin_add')
                )),
            'JobStatuses' => array('title' => 'JobStatuses', 'controller' => 'JobStatuses', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'JobStatuses' => array('title' => 'Job Statuses List', 'controller' => 'JobStatuses', 'action' => 'admin_index'),
                    'JobStatuses/add' => array('title' => 'Job Statuses Add', 'controller' => 'JobStatuses', 'action' => 'admin_add')
                )),
            'LivingStatuses' => array('title' => 'LivingStatuses', 'controller' => 'LivingStatuses', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'LivingStatuses' => array('title' => 'Living Statuses List', 'controller' => 'LivingStatuses', 'action' => 'admin_index'),
                    'LivingStatuses/add' => array('title' => 'Living Statuses Add', 'controller' => 'LivingStatuses', 'action' => 'admin_add')
                )),
            'LoanRecoveries' => array('title' => 'Loan Recoveries', 'controller' => 'LoanRecoveries', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'LoanRecoveries' => array('title' => 'Loan Recoveries List', 'controller' => 'LoanRecoveries', 'action' => 'admin_index')
                )),
            'Loans' => array('title' => 'Loans', 'controller' => 'Loans', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'Loans' => array('title' => 'Loans List', 'controller' => 'Loans', 'action' => 'admin_index'),
                    'Loans/add' => array('title' => 'Loans Add', 'controller' => 'Loans', 'action' => 'admin_add')
                )),
            'LoanTypes' => array('title' => 'LoanTypes', 'controller' => 'LoanTypes', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'LoanTypes' => array('title' => 'Loan Types List', 'controller' => 'LoanTypes', 'action' => 'admin_index'),
                    'LoanTypes/add' => array('title' => 'Loan Types Add', 'controller' => 'LoanTypes', 'action' => 'admin_add')
                )),
            'MaritalStatuses' => array('title' => 'MaritalStatuses', 'controller' => 'MaritalStatuses', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'MaritalStatuses' => array('title' => 'Marital Statuses List', 'controller' => 'MaritalStatuses', 'action' => 'admin_index'),
                    'MaritalStatuses/add' => array('title' => 'Marital Statuses Add', 'controller' => 'MaritalStatuses', 'action' => 'admin_add')
                )),
            'MonthlyAttendanceEntries' => array('title' => 'Monthly Attendance Entries', 'controller' => 'MonthlyAttendanceEntries', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'MonthlyAttendanceEntries' => array('title' => 'Monthly Attendance  List', 'controller' => 'MonthlyAttendanceEntries', 'action' => 'admin_index'),
                    'MonthlyAttendanceEntries/add' => array('title' => 'Monthly Attendance  Add', 'controller' => 'MonthlyAttendanceEntries', 'action' => 'admin_add')
                )),
            'NewBasics' => array('title' => 'New Basics', 'controller' => 'NewBasics', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'NewBasics' => array('title' => 'New Basics List', 'controller' => 'NewBasics', 'action' => 'admin_index'),
                    'NewBasics/add' => array('title' => 'New Basics Add', 'controller' => 'NewBasics', 'action' => 'admin_add')
                )),
            'Quotas' => array('title' => 'Quotas', 'controller' => 'Quotas', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'Quotas' => array('title' => 'Quotas List', 'controller' => 'Quotas', 'action' => 'admin_index'),
                    'Quotas/add' => array('title' => 'Quotas Add', 'controller' => 'Quotas', 'action' => 'admin_add')
                )),
            'Religions' => array('title' => 'Religions', 'controller' => 'Religions', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'Religions' => array('title' => 'Religions List', 'controller' => 'Religions', 'action' => 'admin_index'),
                    'Religions/add' => array('title' => 'Religions Add', 'controller' => 'Religions', 'action' => 'admin_add')
                )),
            'SalarySheets' => array('title' => 'Salary Sheets', 'controller' => 'SalarySheets', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'SalarySheets' => array('title' => 'Salary Sheets List', 'controller' => 'SalarySheets', 'action' => 'admin_index'),
                    'SalarySheets/add' => array('title' => 'Salary Sheets Add', 'controller' => 'SalarySheets', 'action' => 'admin_add')
                )),
            /* 'Scales' => array('title' => 'Scales', 'controller' => 'Scales', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
              'child' => array(
              'Scales' => array('title' => 'Scales List', 'controller' => 'Scales', 'action' => 'admin_index'),
              'Scales/add' => array('title' => 'Scales Add', 'controller' => 'Scales', 'action' => 'admin_add')
              )), */
            'Sexes' => array('title' => 'Sexes', 'controller' => 'Sexes', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'Sexes' => array('title' => 'Sexes List', 'controller' => 'Sexes', 'action' => 'admin_index'),
                    'Sexes/add' => array('title' => 'Sexes Add', 'controller' => 'Sexes', 'action' => 'admin_add')
                )),
            'TaxSettings' => array('title' => 'Tax Settings', 'controller' => 'Tax Settings', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'TaxSettings' => array('title' => 'Tax List', 'controller' => 'TaxSettings', 'action' => 'admin_index'),
                    'TaxSettings/add' => array('title' => 'Tax Add', 'controller' => 'TaxSettings', 'action' => 'admin_add')
                )),
            'EmployeeTaxes' => array('title' => 'Employee Taxes', 'controller' => 'Tax Settings', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'EmployeeTaxes' => array('title' => 'Employee Taxes', 'controller' => 'EmployeeTaxes', 'action' => 'admin_index'),
                    'EmployeeTaxes/emp_tax_details' => array('title' => 'Emp Tax Details', 'controller' => 'EmployeeTaxes', 'action' => 'admin_emp_tax_details')
                )),
            'WarterSupplySettings' => array('title' => 'Warter Supply Settings', 'controller' => 'WarterSupplySettings', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'WarterSupplySettings' => array('title' => 'Warter Supply  List', 'controller' => 'WarterSupplySettings', 'action' => 'admin_index'),
                    'WarterSupplySettings/add' => array('title' => 'Warter Supply  Add', 'controller' => 'WarterSupplySettings', 'action' => 'admin_add')
                )),
            'WarterSupplySettings' => array('title' => 'Warter Supply Settings', 'controller' => 'WarterSupplySettings', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'WarterSupplySettings' => array('title' => 'Warter Supply  List', 'controller' => 'WarterSupplySettings', 'action' => 'admin_index'),
                    'WarterSupplySettings/add' => array('title' => 'Warter Supply  Add', 'controller' => 'WarterSupplySettings', 'action' => 'admin_add')
                ))
        );


        return $menu;
    }

    public function current_datetime() {
        date_default_timezone_set('Asia/Dhaka');
        return date('Y-m-d H:i:s');
    }

    public function current_date() {
        date_default_timezone_set('Asia/Dhaka');
        return date('Y-m-d');
    }

    public function to_expire_date($date) {
        date_default_timezone_set('Asia/Dhaka');
        $date = explode("-", $date);
        $new_date = "01-" . $date[0] . "-20" . $date[1];
        return Date("Y-m-t", strtotime($new_date));
    }

    public function from_expire_date($date) {
        date_default_timezone_set('Asia/Dhaka');
        return Date("m-y", strtotime($date));
    }

    // unit convert to base unit
    public function unit_convert($product_id = '', $measurement_unit_id = '', $qty = '') {
        $this->loadModel('ProductMeasurement');
        $unit_info = $this->ProductMeasurement->find('first', array(
            'conditions' => array(
                'ProductMeasurement.product_id' => $product_id,
                'ProductMeasurement.measurement_unit_id' => $measurement_unit_id
            )
        ));
        if (!empty($unit_info)) {
            return sprintf('%.2f', ($unit_info['ProductMeasurement']['qty_in_base'] * $qty));
        } else {
            return sprintf('%.2f', $qty);
        }
    }

    // unit convert to other unit
    public function unit_convertfrombase($product_id = '', $measurement_unit_id = '', $qty = '') {
        $this->loadModel('ProductMeasurement');
        $unit_info = $this->ProductMeasurement->find('first', array(
            'conditions' => array(
                'ProductMeasurement.product_id' => $product_id,
                'ProductMeasurement.measurement_unit_id' => $measurement_unit_id
            )
        ));
        if (!empty($unit_info)) {
            $qty = floor($qty / $unit_info['ProductMeasurement']['qty_in_base']);
            return sprintf('%.2f', $qty);
        } else {
            return sprintf('%.2f', $qty);
        }
    }

    // convert unit to unit
    public function convert_unit_to_unit($product_id = '', $from_unit_id = '', $to_unit_id = '', $qty = '') {
        $this->loadModel('ProductMeasurement');
        $from_unit_info = $this->ProductMeasurement->find('first', array(
            'conditions' => array(
                'ProductMeasurement.product_id' => $product_id,
                'ProductMeasurement.measurement_unit_id' => $from_unit_id
            ),
            'recursive' => -1
        ));

        if (!empty($from_unit_info)) {
            $from_quantity = $qty * $from_unit_info['ProductMeasurement']['qty_in_base'];
        } else {
            $from_quantity = $qty;
        }

        $to_unit_info = $this->ProductMeasurement->find('first', array(
            'conditions' => array(
                'ProductMeasurement.product_id' => $product_id,
                'ProductMeasurement.measurement_unit_id' => $to_unit_id
            )
        ));
        if (!empty($to_unit_info)) {
            $to_quantity = $to_unit_info['ProductMeasurement']['qty_in_base'];
        } else {
            $to_quantity = 1;
        }

        return sprintf('%.2f', ($from_quantity / $to_quantity));
    }

    function buildTree(array $elements, $parentId = 0) {
        $branch = array();

        foreach ($elements as $element) {
            if ($element['parent_id'] == $parentId) {
                $children = $this->buildTree($elements, $element['id']);
                if ($children) {
                    $element['children'] = $children;
                }
                $branch[] = $element;
            }
        }

        return $branch;
    }

    function array_flatten(array $array) {
        $flat = array(); // initialize return array
        $stack = array_values($array); // initialize stack
        while ($stack) { // process stack until done
            $value = array_shift($stack);
            if (is_array($value)) { // a value to further process
                $stack = array_merge(array_values($value), $stack);
            } else { // a value to take
                $flat[] = $value;
            }
        }
        return $flat;
    }

    public function p($data) {
        echo '<pre>';
        print_r($data);
        echo '</pre>';
    }

    public function page_limit() {
        if (isset($this->request->data['page_limit']) == '') {
            $this->request->data['page_limit'] = 20;
            return 20;
        } else {
            return $this->request->data['page_limit'];
        }
    }

    /* public function buildTree(Array $data, $parent_id = 0) {
      $tree = array();
      foreach ($data as $key => $val) {
      if ($val['parent_id'] == $parent_id) {
      $children = $this->buildTree($data, $val['id']);
      // set a trivial key
      if (!empty($children)) {
      $d['_children'] = $children;
      }
      $tree[] = $d;
      }
      }
      return $tree;
      } */

    public function get_store_list($store_type_id = '') {
        $this->loadModel('Store');

        if ($store_type_id == 1 OR $store_type_id == 2) {
            $virtualFields = array(
                'name' => "CONCAT(Store.name, ' (', SalesPerson.name,')')"
            );

            $receiver_store = $this->Store->find('all', array(
                'joins' => array(
                    array(
                        'table' => 'sales_people',
                        'alias' => 'SalesPerson',
                        'type' => 'left',
                        'conditions' => array(
                            'SalesPerson.office_id = Store.office_id AND SalesPerson.designation_id <= 2'
                        )
                    )
                ),
                'conditions' => array('store_type_id' => $store_type_id),
                'fields' => array('Store.name', 'SalesPerson.name'),
                'order' => array('Store.name' => 'asc'),
                'recursive' => -1
            ));

            return $receiver_store;
        } else if ($store_type_id == 3) {

        }
    }

}
