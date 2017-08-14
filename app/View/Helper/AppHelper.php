<?php

/**
 * Application level View Helper
 *
 * This file is application-wide helper file. You can put all
 * application-wide helper-related methods here.
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
 * @package       app.View.Helper
 * @since         CakePHP(tm) v 0.2.9
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */
App::uses('Helper', 'View');

/**
 * Application helper
 *
 * Add your application-wide methods in the class below, your helpers
 * will inherit them.
 *
 * @package       app.View.Helper
 */
class AppHelper extends Helper {

    var $helpers = array('Session');
    public $uses = array('Usermgmt.UserGroup');

    public function menu_permission($controller = '', $action = '') {
        App::import("Model", "Usermgmt.UserGroup");
        $UserGroup = new UserGroup();

        $group_id = $this->Session->read('UserAuth.User.user_group_id');
        $permissions = $UserGroup->getPermissions($group_id);
        $access = str_replace(' ', '', ucwords(str_replace('_', ' ', $controller))) . '/' . $action;
        if (in_array($access, $permissions)) {
            return true;
        }
        return false;
    }

    public function dateformat($date = '') {
        if ($date == '0000-00-00' OR $date == NULL)
            return '';
        else
            return date('d-M-Y', strtotime($date));
    }

    public function datetimeformat($datetime = '') {
        if ($datetime == '0000-00-00 00:00:00' OR $datetime == NULL)
            return '';
        else
            return date('d-M, Y  g:ia', strtotime($datetime));
    }

    public function expire_dateformat($date = '') {
        if ($date == '0000-00-00' OR $date == NULL)
            return '';
        else
            return date('m-y', strtotime($date));
    }

    /* public function get_scale($grade) {
      App::import("Model", "EmployeeGrade");
      $model = new EmployeeGrade();
      //$emp_loans = $model->find("all");

      $a = $model->find('all', array(
      'conditions' => array(
      'EmployeeGrade.name' => $grade),
      )
      );

      $basic_start = $a[0]['Scale'][0]['grade_basic'];
      $last_key = count($a[0]['Scale']) - 1;
      $basic_end = $a[0]['Scale'][$last_key]['grade_basic'];

      $arrange_data = $basic_start . '-' . $basic_end . '(' . $a[0]['Scale'][0]['employee_grade_id'] . ' Grade' . ')';
      // $test = $this->Scale->query('SELECT max( scales.grade_basic ) ,MIN(scales.grade_basic) FROM scales WHERE scales.employee_grade_id=5');
      //pr($arrange_data);
      // pr($a[0]['Scale']);

      return $arrange_data ;
      } */

    public function get_scale($employee_id) {
        App::import("Model", "Employee");
        App::import("Model", "Scale");
        $scale = new Scale();
        $model = new Employee();
        //$emp_loans = $model->find("all");

        $a = $model->find('all', array(
            'conditions' => array(
                'Employee.id' => $employee_id),
                )
        );
                  //  pr($a);
        if (!empty($a)) {
            $b = $scale->find('all', array(
                'fields' => array('Scale.grade_basic'),
                'conditions' => array(
                    'Scale.employee_grade_id' => $a[0]['EmployeeGrade']['id']),
                    )
            );
          //  pr($b);
            $basic_start = $b[0]['Scale']['grade_basic'];
            $last_key = count($b) - 1;
            $basic_end = $b[$last_key]['Scale']['grade_basic'];
            //$bengali_name=$a[0]['Employee']['employee_name_bengali'].'<br>'.$a[0]['Designation']['name'].'<br>' ;
            $arrange_data = $a[0]['Employee']['employee_name_bengali'] . '<br>' . $a[0]['Designation']['name'] . '<br>' . $basic_start . '-' . $basic_end . ' (' . $a[0]['EmployeeGrade']['name'] . ' Grade' . ')';

            return $arrange_data;
        }
        return '';
    }

    public function employee_code($employee_id) {
        App::import("Model", "Employee");
        $model = new Employee();
        //$emp_loans = $model->find("all");

        $a = $model->find('all', array(
            'conditions' => array(
                'Employee.id' => $employee_id),
                )
        );
       /* if(){
          return $arrange_data;
        }else{
           return '';
        }*/
     return $a[0]['Employee']['employeeID'];
    }

}
