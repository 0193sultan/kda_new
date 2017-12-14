<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Monthly Others Enties'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('monthlyOthersEnties','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Monthly Others Enty'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">
                <table id="MonthlyOthersEnties" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('designation_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('department_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('employee_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('fiscal_year_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('month_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('electric_bill'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('telephone_bill'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('rent_a_car_bill'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('others'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('created_at'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('updated_at'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('created_by'); ?></th>
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($monthlyOthersEnties as $monthlyOthersEnty): ?>
					<tr>
						<td class="text-center"><?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['id']); ?></td>
						<td class="text-center">
			<?php echo $this->Html->link($monthlyOthersEnty['Designation']['name'], array('controller' => 'designations', 'action' => 'view', $monthlyOthersEnty['Designation']['id'])); ?>
		</td>
						<td class="text-center">
			<?php echo $this->Html->link($monthlyOthersEnty['Department']['name'], array('controller' => 'departments', 'action' => 'view', $monthlyOthersEnty['Department']['id'])); ?>
		</td>
						<td class="text-center">
			<?php echo $this->Html->link($monthlyOthersEnty['Employee']['name'], array('controller' => 'employees', 'action' => 'view', $monthlyOthersEnty['Employee']['id'])); ?>
		</td>
						<td class="text-center">
			<?php echo $this->Html->link($monthlyOthersEnty['FiscalYear']['name'], array('controller' => 'fiscal_years', 'action' => 'view', $monthlyOthersEnty['FiscalYear']['id'])); ?>
		</td>
						<td class="text-center">
			<?php echo $this->Html->link($monthlyOthersEnty['Month']['name'], array('controller' => 'months', 'action' => 'view', $monthlyOthersEnty['Month']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['electric_bill']); ?></td>
						<td class="text-center"><?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['telephone_bill']); ?></td>
						<td class="text-center"><?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['rent_a_car_bill']); ?></td>
						<td class="text-center"><?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['others']); ?></td>
						<td class="text-center"><?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['created_at']); ?></td>
						<td class="text-center"><?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['updated_at']); ?></td>
						<td class="text-center"><?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['created_by']); ?></td>
						<td class="text-center">
							<?php if($this->App->menu_permission('monthlyOthersEnties','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $monthlyOthersEnty['MonthlyOthersEnty']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
							<?php if($this->App->menu_permission('monthlyOthersEnties','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $monthlyOthersEnty['MonthlyOthersEnty']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); } ?>
							<?php if($this->App->menu_permission('monthlyOthersEnties','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $monthlyOthersEnty['MonthlyOthersEnty']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $monthlyOthersEnty['MonthlyOthersEnty']['id'])); } ?>
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