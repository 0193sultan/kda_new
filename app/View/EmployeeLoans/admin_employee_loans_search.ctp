<div class="row">
	<div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Employee Loans'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('employeeLoans','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Employee Loan'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">

				<div class="col-md-offset-2" style="width: 50%; height: 50px; border: 1px solid black; box-sizing: border-box;  margin-bottom: 20px; padding: 10px;">

					<?php 
					echo $this->Form->create(false, array(
						'url' => array('controller' => 'EmployeeLoans', 'action' => 'employee_loans_search'),
						'id' => 'employee_loans_search'
						));
						?>


						<?php
				/*  foreach ($department as  $key => $value) 
				 {
					echo "key is :".$key."value is ".$value."<br/>";
				 }
				 foreach ($loan as  $key => $value) 
				  {
				 	 $key= $value;
				  }
				echo "<pre>";
				 print_r($dprtmnt); 
				 exit();*/
				 ?>
				 <div style="float: left; width: 40%;">
				 	<span style="font-weight: 700;">Department : </span>

				 	<select style="width: 110px;" name="department_id" required>
				 		<option value="">select</option>
				 		<?php
				 		foreach ($department as  $key => $value) 
				 		{
				 			echo "<option value=".$key.">".$value."</option>";
				 		}
				 		?>
				 	</select>

				 </div>

				 <div style="float:left; width: 40%;">
				 	<span style="font-weight: 700;">Loan Name : </span>
				 	<select name="loan_id" required>
				 		<option value="">select</option>
				 		<?php
				 		foreach ($loan as  $key => $value) 
				 		{
				 			echo "<option value=".$key.">".$value."</option>";
				 		}
				 		?>
				 	</select>
				 </div>

				 <div style="width: 20% float: left;">
				 	<input type="submit" name="search" value="search" class="btn-primary">
				 </div>

				 <?php echo $this->Form->end(); ?>

				</div>

				<table id="EmployeeLoans" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('employee_id')."<br/>[Designation]"; ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('loan_type_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('loan_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('loan_amount'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('number_of_installment'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('installment_amount'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('interest_amount'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('total_payable'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('current_due'); ?></th>

							<th class="text-center"><?php echo $this->Paginator->sort('loan_apply_date'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('loan_approved_date'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('status'); ?></th>
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php /*debug($emloan); exit();*/ foreach ($emloan as $employeeLoan): ?>
						<tr>
							<td class="text-center"><?php echo h($employeeLoan['EmployeeLoan']['id']); ?></td>
							<td class="text-center">
								<?php echo $this->Html->link($employeeLoan['Employee']['name'], array('controller' => 'employees', 'action' => 'view', $employeeLoan['Employee']['id'])); ?>
								<br/> 
								<?php 
								echo "[".$employeeLoan['Employee']['Designation']['name']."]";
								?>
							</td>
							<td class="text-center">
								<?php echo $this->Html->link($employeeLoan['LoanType']['name'], array('controller' => 'loan_types', 'action' => 'view', $employeeLoan['LoanType']['id'])); ?>
							</td>
							<td class="text-center">
								<?php echo $this->Html->link($employeeLoan['Loan']['name'], array('controller' => 'loans', 'action' => 'view', $employeeLoan['Loan']['id'])); ?>
							</td>
							<td class="text-center"><?php echo h($employeeLoan['EmployeeLoan']['loan_amount']); ?></td>
							<td class="text-center"><?php echo h($employeeLoan['EmployeeLoan']['number_of_installment']); ?></td>
							<td class="text-center"><?php echo h($employeeLoan['EmployeeLoan']['installment_amount']); ?></td>
							<td class="text-center"><?php echo h($employeeLoan['EmployeeLoan']['interest_amount']); ?></td>

							<td class="text-center"><?php echo h($employeeLoan['EmployeeLoan']['total_payable']); ?></td>

							<td class="text-center"><?php echo h($employeeLoan['EmployeeLoan']['current_due']); ?></td>
							<td class="text-center"><?php echo h($employeeLoan['EmployeeLoan']['loan_apply_date']); ?></td>
							<td class="text-center"><?php echo h($employeeLoan['EmployeeLoan']['loan_approved_date']); ?></td>
							<td class="text-center">
								<?php 

								if($employeeLoan['EmployeeLoan']['status'] == 0)
								{
									echo "Active";
								}
								else if($employeeLoan['EmployeeLoan']['status'] ==1)
								{
									echo "Inactive";
								}

								?>

							</td>
							<td class="text-center">
								<?php if($this->App->menu_permission('employeeLoans','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $employeeLoan['EmployeeLoan']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
								<?php if($this->App->menu_permission('employeeLoans','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $employeeLoan['EmployeeLoan']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); } ?>
								<?php if($this->App->menu_permission('employeeLoans','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $employeeLoan['EmployeeLoan']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $employeeLoan['EmployeeLoan']['id'])); } ?>
							</td>
						</tr>
					<?php endforeach; ?>
				</tbody>
			</table>
			<div class='row'>
				<div class='col-xs-6'>
					<div id='Users_info' class='dataTables_info'>
						<?php	echo $this->Paginator->counter(array("format" => __("Page {:page} of {:pages}, showing {:current} records out of {:count} total"))); ?>	
					</div>
				</div>
				<div class='col-xs-6'>
					<div class='dataTables_paginate paging_bootstrap'>
						<ul class='pagination'>									
							<?php
							echo $this->Paginator->prev(__("prev"), array("tag" => "li"), null, array("tag" => "li","class" => "disabled","disabledTag" => "a"));
							echo $this->Paginator->numbers(array("separator" => "","currentTag" => "a", "currentClass" => "active","tag" => "li","first" => 1));
							echo $this->Paginator->next(__("next"), array("tag" => "li","currentClass" => "disabled"), null, array("tag" => "li","class" => "disabled","disabledTag" => "a"));
							?>								
						</ul>
					</div>
				</div>
			</div>				
		</div>			
	</div>
</div>
</div>