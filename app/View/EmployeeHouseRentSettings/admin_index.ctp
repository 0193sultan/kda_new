<?php

/*pr($employeeHouseRentSettings);
exit();*/

?>
<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Employee House Rent Settings'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('employeeHouseRentSettings','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Employee House Rent Setting'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">
                <table id="EmployeeHouseRentSettings" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('gazette_year'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('min_basic'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('max_basic'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('location_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('house_rent_percent'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('house_rent_min'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('created_date'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('update_date'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('user_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('status'); ?></th>
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($employeeHouseRentSettings as $employeeHouseRentSetting): ?>
					<tr>
						<td class="text-center"><?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['id']); ?></td>
						<td class="text-center"><?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['gazette_year']); ?></td>
						<td class="text-center"><?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['min_basic']); ?></td>
						<td class="text-center"><?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['max_basic']); ?></td>
						<td class="text-center">
			<?php echo $this->Html->link($employeeHouseRentSetting['Location']['name'], array('controller' => 'locations', 'action' => 'view', $employeeHouseRentSetting['Location']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['house_rent_percent'])."%"; ?></td>
						<td class="text-center"><?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['house_rent_min']); ?></td>
						<td class="text-center"><?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['created_date']); ?></td>
						<td class="text-center"><?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['update_date']); ?></td>
						<td class="text-center">
			<?php echo $this->Html->link($employeeHouseRentSetting['User']['name'], array('controller' => 'users', 'action' => 'view', $employeeHouseRentSetting['User']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['status']); ?></td>
						<td class="text-center">
							<?php if($this->App->menu_permission('employeeHouseRentSettings','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $employeeHouseRentSetting['EmployeeHouseRentSetting']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
							<?php if($this->App->menu_permission('employeeHouseRentSettings','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $employeeHouseRentSetting['EmployeeHouseRentSetting']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); } ?>
							<?php if($this->App->menu_permission('employeeHouseRentSettings','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $employeeHouseRentSetting['EmployeeHouseRentSetting']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $employeeHouseRentSetting['EmployeeHouseRentSetting']['id'])); } ?>
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