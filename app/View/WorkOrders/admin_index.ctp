<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Work Orders'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('workOrders','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Work Order'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">
                <table id="WorkOrders" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('contructor_project_name_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('contructor_name_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('work_order_no'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('fiscal_years_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('work_order_date'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('work_order_details'); ?></th>
							<!-- <th class="text-center"><?php echo $this->Paginator->sort('user_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('created_at'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('updated_at'); ?></th> -->
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($workOrders as $workOrder): ?>
					<tr>
						<td class="text-center"><?php echo h($workOrder['WorkOrder']['id']); ?></td>
						<td class="text-center">
			<?php echo $this->Html->link($workOrder['ContructorProjectName']['name'], array('controller' => 'contructor_project_names', 'action' => 'view', $workOrder['ContructorProjectName']['id'])); ?>
		</td>
						<td class="text-center">
			<?php echo $this->Html->link($workOrder['ContructorName']['name'], array('controller' => 'contructor_names', 'action' => 'view', $workOrder['ContructorName']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($workOrder['WorkOrder']['work_order_no']); ?></td>
						<td class="text-center">
			<?php echo $this->Html->link($workOrder['FiscalYears']['name'], array('controller' => 'fiscal_years', 'action' => 'view', $workOrder['FiscalYears']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($workOrder['WorkOrder']['work_order_date']); ?></td>
						<td class="text-center"><?php echo h($workOrder['WorkOrder']['work_order_details']); ?></td>
						<!-- <td class="text-center">
			<?php echo $this->Html->link($workOrder['User']['name'], array('controller' => 'users', 'action' => 'view', $workOrder['User']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($workOrder['WorkOrder']['created_at']); ?></td>
						<td class="text-center"><?php echo h($workOrder['WorkOrder']['updated_at']); ?></td> -->
						<td class="text-center">
							<?php if($this->App->menu_permission('workOrders','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $workOrder['WorkOrder']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
							<?php if($this->App->menu_permission('workOrders','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $workOrder['WorkOrder']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); } ?>
							<?php if($this->App->menu_permission('workOrders','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $workOrder['WorkOrder']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $workOrder['WorkOrder']['id'])); } ?>
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