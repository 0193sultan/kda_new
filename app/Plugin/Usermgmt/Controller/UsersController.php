<?php
//ini_set('memory_limit', '-1');
/*
	This file is part of UserMgmt.

	Author: Chetan Varshney (http://ektasoftwares.com)

	UserMgmt is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	UserMgmt is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
*/

App::uses('UserMgmtAppController', 'Usermgmt.Controller');

class UsersController extends UserMgmtAppController {
	/**
	 * Components
	 *
	 * @var array
	 */
	public $components = array('Paginator');
	var $is_menu;
	/**
	 * This controller uses following models
	 *
	 * @var array
	 */
	public $uses = array('Usermgmt.User', 'Usermgmt.UserGroup','Filter.Filter');
	/**
	 * Called before the controller action.  You can use this method to configure and customize components
	 * or perform logic that needs to happen before each controller action.
	 *
	 * @return void
	 */
	public function beforeFilter() {
		parent::beforeFilter();
	}
	/**
	 * Used to display all users by Admin
	 *
	 * @access public
	 * @return array
	 */
	public function index() {
		$this->set('page_title', 'User List');
		$this->User->unbindModel(array('hasMany' => array('LoginToken')));
		//$this->User->UserGroup->unbindModel(array('hasMany' => array('UserGroupPermission')));
		
		// Custome Search  		
		$conditions = array();		
		$office_conditions = array();		
		if(($this->request->is('post') || $this->request->is('put'))){
			if($this->request->data['username'] != '')
			{
				$conditions[] = array('User.username' => $this->request->data['username']); 
			}
			if($this->request->data['user_group_id'] != '')
			{
				$conditions[] = array('User.user_group_id' => $this->request->data['user_group_id']); 
			}
			if($this->request->data['office_id'] != '')
			{
				$conditions[] = array('SalesPerson.office_id' => $this->request->data['office_id']); 
			}
		}
		// End Search
		
		if($this->UserAuth->getOfficeParentId() != 0)
		{
			$conditions[] = array('SalesPerson.office_id' => $this->UserAuth->getOfficeId());
			$office_conditions = array('Office.id' => $this->UserAuth->getOfficeId());
		}
		$this->User->recursive = 2;
		$this->paginate = array(			
			'conditions' => $conditions,
			'order' => array('User.id' => 'DESC'),
			'limit' => $this->page_limit()
		);
		$this->set('users', $this->paginate());	
		//$this->loadModel('SalesPerson');
		//$offices = $this->SalesPerson->Office->find('list',array('fields'=>array('Office.id','Office.office_name'),'conditions'=> $office_conditions,'order' => array('Office.office_name'=>'ASC')));
		$userGroups = $this->UserGroup->find('list',array('order'=>array('id'=>'ASC')));
		$this->set(compact('userGroups'));	
	}
	
	
	public function territory_tag($sales_person_id=null)
	{
		$this->loadModel('SalesPerson');
		$this->loadModel('Territory');
		$this->loadModel('TerritoryAssignHistory');
		$message = '';
		if ($this->request -> isPut()) {					
			
			$count_territory = $this->SalesPerson->find('count', array(
				'conditions' => array(
					'SalesPerson.office_id' => $this->request->data['SalesPerson']['office_id'],
					'SalesPerson.territory_id' => $this->request->data['SalesPerson']['territory_id'],
					'User.user_group_id' => 4,
					'User.active' => 1,
					'SalesPerson.id !=' => $this->request->data['SalesPerson']['id']
				),
				'recursive' => 0
			));
			
			if($count_territory > 0)
			{
				$message = '<div class="alert alert-danger">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								This Territory already assigned.
							</div>';
			}else{			
				// set territory to SO
				$SalesPerson['id'] = $this->request->data['SalesPerson']['id'];
				$SalesPerson['territory_id'] = $this->request->data['SalesPerson']['territory_id'];						
				$this->SalesPerson->save($SalesPerson);	
				
				// update territory assign status
				$Territory['id'] = $this->request->data['SalesPerson']['territory_id'];						
				$Territory['is_assigned'] = 1;						
				$this->Territory->save($Territory);	
				
				// add territory assign history
				$TerritoryAssignHistory['so_id'] = $this->request->data['SalesPerson']['id'];						
				$TerritoryAssignHistory['territory_id'] = $this->request->data['SalesPerson']['territory_id'];						
				$TerritoryAssignHistory['assign_type'] = 1;						
				$TerritoryAssignHistory['date'] = $this->current_date();
				$TerritoryAssignHistory['created_at'] = $this->current_datetime();				
				$TerritoryAssignHistory['created_by'] = $this->UserAuth->getUserId();						
				$this->TerritoryAssignHistory->save($TerritoryAssignHistory);	
				
				$this->Session->setFlash(__('The user is successfully updated'), 'flash/success');
				$this->redirect('/admin/allUsers');
			}
			
		} else {
			$options = array('fields'=>array('SalesPerson.*','User.*'),'conditions' => array('SalesPerson.' . $this->SalesPerson->primaryKey => $sales_person_id),'recursive'=>0);
			$this->request->data = $this->SalesPerson->find('first', $options);		
			if($this->request->data['User']['user_group_id'] != 4){
				$this->Session->setFlash(__('You can not assign Territory without SO group.'), 'flash/error');
				$this->redirect('/admin/allUsers');
			}	
		}
		
		$this->Territory->unbindModel(array('belongsTo'=>array('Office')));
		$territorys = $this->Territory->find('list',array(
			'fields'=>array('Territory.id','Territory.name'),
			'conditions' => array(
				'Territory.office_id' => $this->UserAuth->getOfficeId(),
				'OR' => array(
					'Territory.is_assigned' => 0,
					'Territory.id' => $this->request->data['SalesPerson']['territory_id']
				)
			),
			'order' => array('Territory.name'=>'ASC'),
			'recursive' => -1
		));		
		$this->set(compact('territorys','message'));
	}
	
	
	/**
	 * Territory deassigned by Admin
	 * 
	 */
	
	public function territory_deassigned($sales_person_id=null)
	{
		$this->loadModel('SalesPerson');
		$this->loadModel('Territory');
		$this->loadModel('TerritoryAssignHistory');
		$message = '';
		if ($this->request -> isPut()) {					
			
			$count_territory = $this->SalesPerson->find('count', array(
				'conditions' => array(
					'SalesPerson.office_id' => $this->request->data['SalesPerson']['office_id'],
					'SalesPerson.territory_id' => $this->request->data['SalesPerson']['territory_id'],
					'User.user_group_id' => 4,
					'User.active' => 1,
					'SalesPerson.id' => $this->request->data['SalesPerson']['id']
				),
				'recursive' => 0
			));
			
			if($count_territory == 0)
			{
				$message = '<div class="alert alert-danger">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								Territory not available.
							</div>';
			}else{			
				// remove territory from SO
				$SalesPerson['id'] = $this->request->data['SalesPerson']['id'];
				$SalesPerson['territory_id'] = 0;						
				$this->SalesPerson->save($SalesPerson);	
				
				// update territory assign status
				$Territory['id'] = $this->request->data['SalesPerson']['territory_id'];						
				$Territory['is_assigned'] = 0;						
				$this->Territory->save($Territory);	
				
				// add territory assign history
				$TerritoryAssignHistory['so_id'] = $this->request->data['SalesPerson']['id'];						
				$TerritoryAssignHistory['territory_id'] = $this->request->data['SalesPerson']['territory_id'];						
				$TerritoryAssignHistory['assign_type'] = 2;						
				$TerritoryAssignHistory['date'] = date('Y-m-d',strtotime($this->request->data['SalesPerson']['date']));						
				$TerritoryAssignHistory['created_at'] = $this->current_datetime();						
				$TerritoryAssignHistory['created_by'] = $this->UserAuth->getUserId();						
				$this->TerritoryAssignHistory->save($TerritoryAssignHistory);	
				
				$this->Session->setFlash(__('Territory de-assigned has been successfully completed.'), 'flash/success');
				$this->redirect('/admin/allUsers');
			}
			
		} else {
			$options = array('fields'=>array('SalesPerson.*','User.*'),'conditions' => array('SalesPerson.' . $this->SalesPerson->primaryKey => $sales_person_id),'recursive'=>0);
			$this->request->data = $this->SalesPerson->find('first', $options);		
			if($this->request->data['User']['user_group_id'] != 4){
				$this->Session->setFlash(__('You can not de-assign Territory without SO group.'), 'flash/error');
				$this->redirect('/admin/allUsers');
			}
			
			if($this->request->data['SalesPerson']['territory_id'] == 0)
			{
				$this->Session->setFlash(__('Territory not available.'), 'flash/error');
				$this->redirect('/admin/allUsers');			
			}
		}			
		$this->set(compact('message'));	
	}
	
	/**
	 * Used to display detail of user by Admin
	 *
	 * @access public
	 * @param integer $userId user id of user
	 * @return array
	 */
	public function viewUser($userId=null) {
		
		if (!empty($userId)) {
			$this->User->unbindModel(array('hasMany' => array('LoginToken')));
			$this->User->UserGroup->unbindModel(array('hasMany' => array('UserGroupPermission')));
			$this->User->recursive = 2;			
			$user = $this->User->read(null, $userId);
			$this->set('user', $user);
		} else {
			$this->redirect('/allUsers');
		}
	}
	
	
	public function duplicate_user_check()
	{
		$user_id = $this->request->data['user_id'];
		$username = $this->request->data['username'];
		
		if($user_id!='')
		{
			$conditions = array('id !=' => $user_id,'username'=>$username);
		}else{
			$conditions = array('username' => $username);
		}
		
		$user = $this->User->find('first',array(
			'conditions' => $conditions,
			'recursive' => -1
		));
		if(empty($user))
		{
			//if (preg_match('#[0-9]#', $username) OR preg_match('#[a-zA-Z]#', $username)) 
			if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $username))
			{
				echo '<span style="color:red"> Special character not allowed.</span>';
			}else{
				echo '<span style="color:green"> Available</span>';				
			}			
		}else{
			echo '<span style="color:red"> Sorry Username already taken !!!</span>';
		}
		$this->autoRender = false;
	}
	
	public function duplicate_usercode_check()
	{
		$this->loadModel('SalesPerson');
		$id = $this->request->data['id'];
		$code = $this->request->data['code'];
		if($id!='')
		{
			$conditions = array('id !=' => $id,'code'=>$code);
		}else{
			$conditions = array('code'=>$code);
		}
		$user = $this->SalesPerson->find('first',array(
			'conditions' => $conditions,
			'recursive' => -1
		));
		
		if(empty($user))
		{
			echo '<span style="color:green"> Available</span>';
		}else{
			echo '<span style="color:red"> Sorry Code already taken !!!</span>';
		}
		$this->autoRender = false;
	}
	
	
	/**
	 * Used to display detail of user by user
	 *
	 * @access public
	 * @return array
	 */
	public function myprofile() {
		$userId = $this->UserAuth->getUserId();
		$user = $this->User->read(null, $userId);
		$this->set('user', $user);
	}
	/**
	 * Used to logged in the site
	 *
	 * @access public
	 * @return void
	 */
	public function login() {
		$this->layout = 'login';
		$this->set('page_title', 'Admin Login');
		if ($this->request -> isPost()) { 

			$this->User->set($this->data);
			if($this->User->LoginValidate()) {
				$userId  = $this->data['User']['username'];
				$password = $this->data['User']['password'];

				
				if (!empty($userId)) {
					$user = $this->User->findByUsername($userId);
					//$user = $this->User->findByEmail($email);
					if (empty($user)) {
						$this->Session->setFlash(__('<div class="alert alert-danger">Incorrect Email/Username or Password</div>'));
						return;
					}
				}
				if ($user['User']['id'] != 1 and $user['User']['active']==0) {
					$this->Session->setFlash(__('Your registration has not been confirmed please verify your email or contact to Administrator'));
					return;
				}
				$hashed = md5($password);
				if ($user['User']['password'] === $hashed) {
					$this->UserAuth->login($user);
					$remember = (!empty($this->data['User']['remember']));
					if ($remember) {
						$this->UserAuth->persist('2 weeks');
					}
					//$OriginAfterLogin=$this->Session->read('Usermgmt.OriginAfterLogin');
					//$this->Session->delete('Usermgmt.OriginAfterLogin');
					//$redirect = (!empty($OriginAfterLogin)) ? $OriginAfterLogin : loginRedirectUrl;
					//$this->redirect($redirect);					
					
//					$this->loadModel('Office');
//					$this->loadModel('Store');
//					
//					$office_info = $this->Office->find('first',array(
//						'conditions'=>array('Office.id' => $this->UserAuth->getOfficeId()),
//						'fields' => 'Office.id,Office.parent_office_id',
//						'recursive' => -1
//					));
//					$store_info = $this->Store->find('first',array(
//						'conditions'=>array('Store.office_id' => $this->UserAuth->getOfficeId(),'Store.territory_id' => NULL),
//						'fields' => 'Store.id',
//						'recursive' => -1
//					));
//					$sdata['id'] = $office_info['Office']['id'];
//					$sdata['parent_office_id'] = $office_info['Office']['parent_office_id'];
//						
//					if(!empty($store_info)){
//						$sdata['store_id'] = $store_info['Store']['id'];
//					}else{
//						$sdata['store_id'] = 0;
//					}
//					$this->Session->write('Office',$sdata);		
					$this->redirect('/admin/dashboards');
				} else {
					$this->Session->setFlash(__('<div class="alert alert-danger">Incorrect Email/Username or Password</div>'));
					return;
				}
			}
		}
	}
		
	/**
	 * Used to logged out from the site
	 *
	 * @access public
	 * @return void
	 */
	public function logout() {
		$this->UserAuth->logout();
		$this->Session->setFlash(__('<div class="alert alert-success">You are successfully signed out</div>'));
		$this->redirect('/login');
	}
	/**
	 * Used to register on the site
	 *
	 * @access public
	 * @return void
	 */
	public function register() {
		$userId = $this->UserAuth->getUserId();
		if ($userId) {
			$this->redirect("/user_dashboard");
		}
		if (siteRegistration) {
			$userGroups=$this->UserGroup->getGroupsForRegistration();
			$this->set('userGroups', $userGroups);
			if ($this->request -> isPost()) {
				$this->User->set($this->data);
				if ($this->User->RegisterValidate()) {
					if (!isset($this->data['User']['user_group_id'])) {
						$this->request->data['User']['user_group_id']=defaultGroupId;
					} elseif (!$this->UserGroup->isAllowedForRegistration($this->data['User']['user_group_id'])) {
						$this->Session->setFlash(__('Please select correct register as'));
						return;
					}
					if (!emailVerification) {
						$this->request->data['User']['active']=1;
					}
					$this->request->data['User']['password'] = $this->UserAuth->makePassword($this->request->data['User']['password']);
					$this->User->save($this->request->data,false);
					$userId=$this->User->getLastInsertID();
					$user = $this->User->findById($userId);
					if (sendRegistrationMail && !emailVerification) {
						$this->User->sendRegistrationMail($user);
					}
					if (emailVerification) {
						$this->User->sendVerificationMail($user);
					}
					if (isset($this->request->data['User']['active']) && $this->request->data['User']['active']) {
						$this->UserAuth->login($user);
						$this->redirect('/');
					} else {
						$this->Session->setFlash(__('Please check your mail and confirm your registration'), 'flash/success');
						$this->redirect('/register');
					}
				}
			}
		} else {
			$this->Session->setFlash(__('Sorry new registration is currently disabled, please try again later'));
			$this->redirect('/login');
		}
	}
	/**
	 * Used to change the password by user
	 *
	 * @access public
	 * @return void
	 */
	public function changePassword() {
		$userId = $this->UserAuth->getUserId();
		if ($this->request -> isPost()) {
			$this->User->set($this->data);
			if ($this->User->RegisterValidate()) {
				$this->User->id=$userId;
				$this->request->data['User']['password'] = $this->UserAuth->makePassword($this->request->data['User']['password']);
				$this->User->save($this->request->data,false);
				$this->Session->setFlash(__('Password changed successfully'), 'flash/success');
				$this->redirect('/user_dashboard');
			}
		}
	}
	/**
	 * Used to change the user password by Admin
	 *
	 * @access public
	 * @param integer $userId user id of user
	 * @return void
	 */
	public function changeUserPassword($userId=null) {
		if (!empty($userId)) {
			$name=$this->User->getNameById($userId);
			$this->set('name', $name);
			if ($this->request -> isPost()) {
				$this->User->set($this->data);
				if($this->User->RegisterValidate()) {
					$this->User->id=$userId;
					$this->request->data['User']['password'] = $this->UserAuth->makePassword($this->request->data['User']['password']);
					$this->User->save($this->request->data,false);
					$this->Session->setFlash(__('Password for %s changed successfully', $name));
					$this->redirect('/admin/allUsers');
				}
			}
		} else {
			$this->redirect('/admin/allUsers');
		}
	}
	/**
	 * Used to add user on the site by Admin
	 *
	 * @access public
	 * @return void
	 */
	public function addUser() {
		$this->loadModel('SalesPerson');
		
		if ($this->request -> isPost()) {
			$this->User->create();
			$this->request->data['SalesPerson']['user_group_id'] = $this->request->data['User']['user_group_id'];
			$this->request->data['SalesPerson']['created_at'] = $this->current_datetime();
			$this->request->data['SalesPerson']['updated_at'] = $this->current_datetime();
			$this->request->data['SalesPerson']['created_by'] = $this->UserAuth->getUserId();
			if($this->User->saveAll($this->request->data)) {
				
				$this->request->data['User']['id'] = $this->User->id;
				$this->request->data['User']['password'] = $this->UserAuth->makePassword($this->request->data['User']['password']);
				$this->User->save($this->request->data);
				
				$this->Session->setFlash(__('The user is successfully added'), 'flash/success');
				$this->redirect('/admin/allUsers');							
			}
		}		
		$designations = $this->SalesPerson->Designation->find('list',array('fields'=>array('Designation.id','Designation.designation_name'),'order' => array('Designation.designation_name'=>'ASC')));
		$offices = $this->SalesPerson->Office->find('list',array('fields'=>array('Office.id','Office.office_name'),'order' => array('Office.office_name'=>'ASC')));
		$userGroups = $this->UserGroup->find('list',array('order'=>array('id'=>'ASC')));
		$this->set(compact('designations','offices','userGroups'));
	}
	/**
	 * Used to edit user on the site by Admin
	 *
	 * @access public
	 * @param integer $userId user id of user
	 * @return void
	 */
	public function editUser($userId=null) {
		$this->loadModel('SalesPerson');
		
		if ($this->request -> isPut()) {
			
			$this->request->data['SalesPerson']['id'] = $this->request->data['User']['sales_person_id'];
			$this->request->data['SalesPerson']['updated_at'] = $this->current_datetime();
			$this->request->data['SalesPerson']['updated_by'] = $this->UserAuth->getUserId();				
			$this->request->data['SalesPerson']['user_group_id'] = $this->request->data['User']['user_group_id'];		
				
			if($this->User->saveAll($this->request->data)) {				
				
				$this->request->data['User']['id'] = $userId;
				if (empty($this->request->data['User']['password'])) {
					unset($this->request->data['User']['password']);
				} else {
					$this->request->data['User']['password'] = $this->UserAuth->makePassword($this->request->data['User']['password']);
				}
				$this->User->save($this->request->data);				
				$this->Session->setFlash(__('The user is successfully updated'), 'flash/success');
				$this->redirect('/admin/allUsers');
			}
		} else {
			$user = $this->User->read(null, $userId);
			$this->request->data=null;
			if (!empty($user)) {
				$user['User']['password']='';
				$this->request->data = $user;
			}
		}
		$designations = $this->SalesPerson->Designation->find('list',array('fields'=>array('Designation.id','Designation.designation_name'),'order' => array('Designation.designation_name'=>'ASC')));
		$offices = $this->SalesPerson->Office->find('list',array('fields'=>array('Office.id','Office.office_name'),'order' => array('Office.office_name'=>'ASC')));
		$userGroups = $this->UserGroup->find('list',array('order'=>array('id'=>'ASC')));
		$this->set(compact('designations','offices','userGroups'));
	}
	/**
	 * Used to delete the user by Admin
	 *
	 * @access public
	 * @param integer $userId user id of user
	 * @return void
	 */
	public function deleteUser($userId = null) {
		if (!empty($userId)) {
			if ($this->request -> isPost()) {
				if ($this->User->delete($userId)) {
					$this->Session->setFlash(__('User has been deleted successfully.'), 'flash/success');					
				}
			}
			$this->redirect('/admin/allUsers');
		} else {
			$this->redirect('/admin/allUsers');
		}
	}
	/**
	 * Used to show dashboard of the user
	 *
	 * @access public
	 * @return array
	 */
	public function dashboard() {
		$userId=$this->UserAuth->getUserId();
		$user = $this->User->findById($userId);
		$this->set('user', $user);
	}
	/**
	 * Used to activate user by Admin
	 *
	 * @access public
	 * @param integer $userId user id of user
	 * @return void
	 */
	public function makeActive($userId = null) {
		if (!empty($userId)) {
			$user=array();
			$user['User']['id']=$userId;
			$user['User']['active']=1;
			$this->User->save($user,false);
			$this->Session->setFlash(__('User is successfully activated'), 'flash/success');
		}
		$this->redirect('/allUsers');
	}
	/**
	 * Used to show access denied page if user want to view the page without permission
	 *
	 * @access public
	 * @return void
	 */
	public function accessDenied() {

	}
	/**
	 * Used to verify user's email address
	 *
	 * @access public
	 * @return void
	 */
	public function userVerification() {
		if (isset($_GET['ident']) && isset($_GET['activate'])) {
			$userId= $_GET['ident'];
			$activateKey= $_GET['activate'];
			$user = $this->User->read(null, $userId);
			if (!empty($user)) {
				if (!$user['User']['active']) {
					$password = $user['User']['password'];
					$theKey = $this->User->getActivationKey($password);
					if ($activateKey==$theKey) {
						$user['User']['active']=1;
						$this->User->save($user,false);
						if (sendRegistrationMail && emailVerification) {
							$this->User->sendRegistrationMail($user);
						}
						$this->Session->setFlash(__('Thank you, your account is activated now'));
					}
				} else {
					$this->Session->setFlash(__('Thank you, your account is already activated'));
				}
			} else {
				$this->Session->setFlash(__('Sorry something went wrong, please click on the link again'));
			}
		} else {
			$this->Session->setFlash(__('Sorry something went wrong, please click on the link again'));
		}
		$this->redirect('/login');
	}
	/**
	 * Used to send forgot password email to user
	 *
	 * @access public
	 * @return void
	 */
	public function forgotPassword() {
		if ($this->request -> isPost()) {
			$this->User->set($this->data);
			if ($this->User->LoginValidate()) {
				$email  = $this->data['User']['email'];
				$user = $this->User->findByUsername($email);
				if (empty($user)) {
					$user = $this->User->findByEmail($email);
					if (empty($user)) {
						$this->Session->setFlash(__('Incorrect Email/Username or Password'));
						return;
					}
				}
				// check for inactive account
				if ($user['User']['id'] != 1 and $user['User']['active']==0) {
					$this->Session->setFlash(__('Your registration has not been confirmed yet please verify your email before reset password'));
					return;
				}
				$this->User->forgotPassword($user);
				$this->Session->setFlash(__('Please check your mail for reset your password'));
				$this->redirect('/login');
			}
		}
	}
	/**
	 *  Used to reset password when user comes on the by clicking the password reset link from their email.
	 *
	 * @access public
	 * @return void
	 */
	public function activatePassword() {
		if ($this->request -> isPost()) {
			if (!empty($this->data['User']['ident']) && !empty($this->data['User']['activate'])) {
				$this->set('ident',$this->data['User']['ident']);
				$this->set('activate',$this->data['User']['activate']);
				$this->User->set($this->data);
				if ($this->User->RegisterValidate()) {
					$userId= $this->data['User']['ident'];
					$activateKey= $this->data['User']['activate'];
					$user = $this->User->read(null, $userId);
					if (!empty($user)) {
						$password = $user['User']['password'];
						$thekey =$this->User->getActivationKey($password);
						if ($thekey==$activateKey) {
							$user['User']['password']=$this->data['User']['password'];
							$user['User']['password'] = $this->UserAuth->makePassword($user['User']['password']);
							$this->User->save($user,false);
							$this->Session->setFlash(__('Your password has been reset successfully'));
							$this->redirect('/login');
						} else {
							$this->Session->setFlash(__('Something went wrong, please send password reset link again'));
						}
					} else {
						$this->Session->setFlash(__('Something went wrong, please click again on the link in email'));
					}
				}
			} else {
				$this->Session->setFlash(__('Something went wrong, please click again on the link in email'));
			}
		} else {
			if (isset($_GET['ident']) && isset($_GET['activate'])) {
				$this->set('ident',$_GET['ident']);
				$this->set('activate',$_GET['activate']);
			}
		}
	}
	
}
