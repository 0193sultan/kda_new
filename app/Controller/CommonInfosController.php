<?php

App::uses('AppController', 'Controller');
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CommonController
 *
 * @author USER-PC
 */
class CommonInfosController extends AppController {

    public $components = array('Paginator', 'Session');

    public function get_bank_name($bank_info_id) {
        $this->loadModel('BankInfo');
        $bankInfos = $this->BankInfo->find('all', array('conditions' => array(
                'BankInfo.id' => $bank_info_id
            ),
            'fields' => 'BankInfo.name,BankInfo.id',
            'order' => 'BankInfo.id DESC',
            // 'limit' => 1,
            'recursive' => -1));
        return $bankInfos[0]['BankInfo']['name'];
    }

}
