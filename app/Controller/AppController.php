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
            'BankInfos' => array('title' => 'Bank', 'controller' => 'BankInfos', 'action' => 'admin_index', 'icon' => '<i class="fa fa-university"></i>', 'scroll' => '0',
                'child' => array(
                    'BankInfos' => array('title' => 'Bank List', 'controller' => 'BankInfos', 'action' => 'admin_index'),
                    'BankAccounts' => array('title' => 'Bank Accounts', 'controller' => 'BankAccounts', 'action' => 'admin_index'),
                    'Branches' => array('title' => 'Branches', 'controller' => 'Branches', 'action' => 'admin_index'),
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
            'Departments' => array('title' => 'Departments', 'controller' => 'Departments', 'action' => 'admin_index', 'icon' => '<i class="fa fa-building-o"></i>', 'scroll' => '0',
                'child' => array(
                    'Departments' => array('title' => 'Departments List', 'controller' => 'Departments', 'action' => 'admin_index'),
                    'Departments/add' => array('title' => 'Departments Add', 'controller' => 'Departments', 'action' => 'admin_add')
                )),
            'Designations' => array('title' => 'Designations', 'controller' => 'Designations', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'Designations' => array('title' => 'Designations List', 'controller' => 'Designations', 'action' => 'admin_index'),
                    'Designations/add' => array('title' => 'Designations Add', 'controller' => 'Designations', 'action' => 'admin_add')
                )),
            'EduStatuses' => array('title' => 'Edu Statuses', 'controller' => 'EduStatuses', 'action' => 'admin_index', 'icon' => '<i class="fa fa-graduation-cap"></i>', 'scroll' => '0',
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
            'Employees' => array('title' => 'Employees', 'controller' => 'Employees', 'action' => 'admin_index', 'icon' => '<i class="fa fa-users"></i>', 'scroll' => '0',
                'child' => array(
                    'Employees' => array('title' => 'Employees List', 'controller' => 'Employees', 'action' => 'admin_index'),
                    'Employees/add' => array('title' => 'Employees Add', 'controller' => 'Employees', 'action' => 'admin_add')
                )),
            'EmployeeLoans' => array('title' => 'Employee Loans', 'controller' => 'EmployeeLoans', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'EmployeeLoans' => array('title' => 'Employee Loans List', 'controller' => 'EmployeeLoans', 'action' => 'admin_index'),
                    'EmployeeLoans/add' => array('title' => 'Employee Loans Add', 'controller' => 'EmployeeLoans', 'action' => 'admin_add'),
                    'loanAdjustments' => array('title' => 'loan Adjustments', 'controller' => 'loanAdjustments', 'action' => 'admin_index'),
                    'loanAdjustments/add' => array('title' => 'loan Adjustments Add', 'controller' => 'loanAdjustments', 'action' => 'admin_add'),
                    'GpfLoanTransfers' => array('title' => 'Gpf Loan Transfers', 'controller' => 'GpfLoanTransfers', 'action' => 'admin_index'),
                )),
            'Loans Recovery Register' => array('title' => 'Recovery Register', 'controller' => 'LoanRecoveries', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'LoanRecoveries' => array('title' => 'Loans Recovery List', 'controller' => 'LoanRecoveries', 'action' => 'admin_index'),
                    'OtherRegisters' => array('title' => 'Other Registers', 'controller' => 'OtherRegisters', 'action' => 'admin_index'),
                )),
            'EmployeeSalarySheets' => array('title' => 'Employee Salary', 'controller' => 'EmployeeSalarySheets', 'action' => 'admin_index', 'icon' => '<i class="fa fa-credit-card"></i>', 'scroll' => '0',
                'child' => array(
                    'SalarySheets' => array('title' => 'Generate Salary', 'controller' => 'SalarySheets', 'action' => 'admin_index'),
                    'DueSalarySheets/add' => array('title' => 'Generate Due Salary', 'controller' => 'DueSalarySheets', 'action' => 'admin_add'),
                    'EmployeeSalarySheets' => array('title' => 'Employee Salary Sheets', 'controller' => 'EmployeeSalarySheets', 'action' => 'admin_index'),
                    'MonthlySalaryNotes' => array('title' => 'Monthly Salary Notes', 'controller' => 'MonthlySalaryNotes', 'action' => 'admin_index'),
                    'MonthlySalaryNotes/add' => array('title' => 'Monthly Salary Notes Add', 'controller' => 'MonthlySalaryNotes', 'action' => 'admin_add'),
                    //'MonthlySalaryNotes/print_view' => array('title' => 'Monthly Notes View', 'controller' => 'MonthlySalaryNotes', 'action' => 'admin_print_view'),
                    'SalaryCertificates' => array('title' => 'Salary Certificates', 'controller' => 'SalaryCertificates', 'action' => 'admin_index'),
                    'SallarySummarySheets' => array('title' => 'Sallary Summary Sheet', 'controller' => 'SallarySummarySheets', 'action' => 'admin_index'),
                    'EmployeeBonuses' => array('title' => 'Generate Bonus', 'controller' => 'EmployeeBonuses', 'action' => 'admin_index'),
                    'EmployeeBonuses/show_bonus' => array('title' => 'Bonus Sheet Print', 'controller' => 'EmployeeBonuses', 'action' => 'admin_show_bonus'),
                    'IndividualSallarySummarySheets' => array('title' => 'Individual Sallary Sum.', 'controller' => 'IndividualSallarySummarySheets', 'action' => 'admin_index'),
                    'YearCloseGpsSubscriptions' => array('title' => 'Year Close for Gps.', 'controller' => 'YearCloseGpsSubscriptions', 'action' => 'admin_index')
                )
            ),
            'EmployeeTypes' => array('title' => 'Employee Types', 'controller' => 'EmployeeTypes', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'EmployeeTypes' => array('title' => 'Employee Types List', 'controller' => 'EmployeeTypes', 'action' => 'admin_index'),
                    'EmployeeTypes/add' => array('title' => 'Employee Types Add', 'controller' => 'EmployeeTypes', 'action' => 'admin_add')
                )),
            'FiscalYears' => array('title' => 'FiscalYears', 'controller' => 'FiscalYears', 'action' => 'admin_index', 'icon' => '<i class="fa fa-calendar"></i>', 'scroll' => '0',
                'child' => array(
                    'FiscalYears' => array('title' => 'Fiscal Years List', 'controller' => 'FiscalYears', 'action' => 'admin_index'),
                    'FiscalYears/add' => array('title' => 'Fiscal Years Add', 'controller' => 'FiscalYears', 'action' => 'admin_add')
                )),
            'FiscalYearSettings' => array('title' => 'Fiscal Year Settings', 'controller' => 'FiscalYearSettings', 'action' => 'admin_index', 'icon' => '<i class="fa fa-calendar-o"></i>', 'scroll' => '0',
                'child' => array(
                    'FiscalYearSettings' => array('title' => 'Fiscal Year List', 'controller' => 'FiscalYearSettings', 'action' => 'admin_index'),
                    'FiscalYearSettings/add' => array('title' => 'Fiscal Year Add', 'controller' => 'FiscalYearSettings', 'action' => 'admin_add')
                )),
            'JobStatuses' => array('title' => 'JobStatuses', 'controller' => 'JobStatuses', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'JobStatuses' => array('title' => 'Job Statuses List', 'controller' => 'JobStatuses', 'action' => 'admin_index'),
                    'JobStatuses/add' => array('title' => 'Job Statuses Add', 'controller' => 'JobStatuses', 'action' => 'admin_add')
                )),
            'LivingStatuses' => array('title' => 'Living Statuses', 'controller' => 'LivingStatuses', 'action' => 'admin_index', 'icon' => '<i class="fa fa-home" aria-hidden="true"></i>', 'scroll' => '0',
                'child' => array(
                    'LivingStatuses' => array('title' => 'Living Statuses List', 'controller' => 'LivingStatuses', 'action' => 'admin_index'),
                    'LivingStatuses/add' => array('title' => 'Living Statuses Add', 'controller' => 'LivingStatuses', 'action' => 'admin_add')
                )),
            /* 'LoanRecoveries' => array('title' => 'Loan Recoveries', 'controller' => 'LoanRecoveries', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
              'child' => array(
              'LoanRecoveries' => array('title' => 'Loan Recoveries List', 'controller' => 'LoanRecoveries', 'action' => 'admin_index')
              )), */
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
            'MonthlyAttendanceEntries' => array('title' => 'Monthly Entries', 'controller' => 'MonthlyAttendanceEntries', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'MonthlyAttendanceEntries' => array('title' => 'Monthly Attendance  List', 'controller' => 'MonthlyAttendanceEntries', 'action' => 'admin_index'),
                    'MonthlyAttendanceEntries/add' => array('title' => 'Monthly Attendance  Add', 'controller' => 'MonthlyAttendanceEntries', 'action' => 'admin_add'),
                    'MonthlyOthersEnties/add' => array('title' => 'Monthly Others Enties Add', 'controller' => 'MonthlyOthersEnties', 'action' => 'admin_add'),
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
            /* 'Scales' => array('title' => 'Scales', 'controller' => 'Scales', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
              'child' => array(
              'Scales' => array('title' => 'Scales List', 'controller' => 'Scales', 'action' => 'admin_index'),
              'Scales/add' => array('title' => 'Scales Add', 'controller' => 'Scales', 'action' => 'admin_add')
              )), */
            'Sexes' => array('title' => 'Gender List', 'controller' => 'Sexes', 'action' => 'admin_index', 'icon' => '<i class="fa fa-male"></i>', 'scroll' => '0',
                'child' => array(
                    'Sexes' => array('title' => 'Gender List', 'controller' => 'Sexes', 'action' => 'admin_index'),
                    'Sexes/add' => array('title' => 'Gender Add', 'controller' => 'Sexes', 'action' => 'admin_add')
                )),
            'ContructorNames' => array('title' => 'Contructor Management', 'controller' => 'ContructorNames', 'action' => 'admin_index', 'icon' => '<i class="fa fa-male"></i>', 'scroll' => '0',
                'child' => array(
                    'ContructorProjectNames' => array('title' => 'Project Names', 'controller' => 'ContructorProjectNames', 'action' => 'admin_index'),
                    'ContructorNames' => array('title' => 'Contructor Profile', 'controller' => 'ContructorNames', 'action' => 'admin_index'),
                    'WorkOrders' => array('title' => 'Work Orders', 'controller' => 'WorkOrders', 'action' => 'admin_index'),
                    'ContructorAdvancePayments' => array('title' => 'Advance Payments', 'controller' => 'ContructorAdvancePayments', 'action' => 'admin_index'),
                    'ContructorBillPayments' => array('title' => 'Bill Payments', 'controller' => 'ContructorBillPayments', 'action' => 'admin_index'),
                    'SecurityDepositeReturns' => array('title' => 'Security Deposite Returns', 'controller' => 'SecurityDepositeReturns', 'action' => 'admin_index'),
                    'ContructorLedgers' => array('title' => 'Contructor Ledgers', 'controller' => 'ContructorLedgers', 'action' => 'admin_index'),
                    'ContructorCertificates' => array('title' => 'Contructor Certificates', 'controller' => 'ContructorCertificates', 'action' => 'admin_index'),
                )),
            'AccHeadTypes' => array('title' => 'Accounting', 'controller' => 'AccHeadTypes', 'action' => 'admin_index', 'icon' => '<i class="fa fa-money" aria-hidden="true"></i>', 'scroll' => '0',
                'child' => array(
                    'AccHeadTypes' => array('title' => 'Accounting Head Types', 'controller' => 'AccHeadTypes', 'action' => 'admin_index'),
                    'AccHeadLists' => array('title' => 'Accounting Head Lists', 'controller' => 'AccHeadLists', 'action' => 'admin_index'),
                    'AccEffects' => array('title' => 'Accounting Effects', 'controller' => 'AccEffects', 'action' => 'admin_index'),
                    'DailyTransactions' => array('title' => 'Daily Transactions', 'controller' => 'DailyTransactions', 'action' => 'admin_index'),
                    'OpeningBalances' => array('title' => 'Opening Balances', 'controller' => 'OpeningBalances', 'action' => 'admin_index'),
                    'TrialBalances' => array('title' => 'Trail Balances', 'controller' => 'TrialBalances', 'action' => 'admin_index'),
                    'CashBookReports' => array('title' => 'Cash Book Reports', 'controller' => 'CashBookReports', 'action' => 'admin_index'),
                    'IncomeExpenseReports' => array('title' => 'Income ExpenseReports', 'controller' => 'IncomeExpenseReports', 'action' => 'admin_index'),
                    'LedgerReports' => array('title' => 'Ledger Reports', 'controller' => 'LedgerReports', 'action' => 'admin_index'),
                    'ReceiptPaymentReports' => array('title' => 'Receipt Payment Reports', 'controller' => 'ReceiptPaymentReports', 'action' => 'admin_index'),
                    'YearClosingBalanceDetails' => array('title' => 'Year Closing Balance Details', 'controller' => 'YearClosingBalanceDetails', 'action' => 'admin_index'),
                    'BalanceSheets' => array('title' => 'Balance Sheet', 'controller' => 'BalanceSheets', 'action' => 'admin_index'),
                    'AnnualDepriciations' => array('title' => 'Annual Depriciations', 'controller' => 'AnnualDepriciations', 'action' => 'admin_index'),
                )),
            'BudgetSchedules' => array('title' => 'Budget', 'controller' => 'BudgetSchedules', 'action' => 'admin_index', 'icon' => '<i class="fa fa-shopping-cart"></i>', 'scroll' => '0',
                'child' => array(
                    'BudgetSchedules' => array('title' => 'Budget Schedules', 'controller' => 'BudgetSchedules', 'action' => 'admin_index'),
                    'BudgetHeadLists' => array('title' => 'Budget Head Lists', 'controller' => 'BudgetHeadLists', 'action' => 'admin_index'),
                    'BudgetCategories' => array('title' => 'Budget Categories', 'controller' => 'BudgetCategories', 'action' => 'admin_index'),
                    'BudgetTypes' => array('title' => 'Budget Types', 'controller' => 'BudgetTypes', 'action' => 'admin_index'),
                    'OpeningBudgets' => array('title' => 'Opening Budgets', 'controller' => 'OpeningBudgets', 'action' => 'admin_index'),
                    'CreateBudgets' => array('title' => 'Create Budgets', 'controller' => 'CreateBudgets', 'action' => 'admin_index'),
                    'BudgetReports' => array('title' => 'Budget Reports', 'controller' => 'BudgetReports', 'action' => 'admin_index')
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
            'WarterSupplySettings' => array('title' => 'Warter Supply Settings', 'controller' => 'WarterSupplySettings', 'action' => 'admin_index', 'icon' => '<i class="fa fa-tint"></i>', 'scroll' => '0',
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
