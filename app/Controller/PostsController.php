<?php

App::uses('AppController', 'Controller');

/**
 * Sallery Shit
 *
 * @property Employee $Employee
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class PostsController extends AppController {

    public $uses = array();

    /**
     * Components
     *
     * @var array
     */
    public $components = array('Session');

    public function create_pdf() {

        //$users = $this->User->find('all');

        $this->set(compact('users'));

        $this->layout = '/pdf/default';

        $this->render('/Pdf/my_pdf_view');
    }

}
