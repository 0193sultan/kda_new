<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Gpf Subscriptions'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('gpfSubscriptions','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Gpf Subscription'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">
                <table id="GpfSubscriptions" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('employee_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('employee_loan_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('fiscal_year_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('month_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('subscription_recovery'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('total_subscription_balance'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('subscription_interest'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('current_balance_date'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('loan_amount'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('loan_recovery'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('loan_interest_amount'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('loan_interest_recovery'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('loan_date'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('sub_status'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('created_at'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('updated_at'); ?></th>
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($gpfSubscriptions as $gpfSubscription): ?>
					<tr>
						<td class="text-center"><?php echo h($gpfSubscription['GpfSubscription']['id']); ?></td>
						<td class="text-center">
			<?php echo $this->Html->link($gpfSubscription['Employee']['name'], array('controller' => 'employees', 'action' => 'view', $gpfSubscription['Employee']['id'])); ?>
		</td>
						<td class="text-center">
			<?php echo $this->Html->link($gpfSubscription['EmployeeLoan']['id'], array('controller' => 'employee_loans', 'action' => 'view', $gpfSubscription['EmployeeLoan']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($gpfSubscription['GpfSubscription']['fiscal_year_id']); ?></td>
						<td class="text-center"><?php echo h($gpfSubscription['GpfSubscription']['month_id']); ?></td>
						<td class="text-center"><?php echo h($gpfSubscription['GpfSubscription']['subscription_recovery']); ?></td>
						<td class="text-center"><?php echo h($gpfSubscription['GpfSubscription']['total_subscription_balance']); ?></td>
						<td class="text-center"><?php echo h($gpfSubscription['GpfSubscription']['subscription_interest']); ?></td>
						<td class="text-center"><?php echo h($gpfSubscription['GpfSubscription']['current_balance_date']); ?></td>
						<td class="text-center"><?php echo h($gpfSubscription['GpfSubscription']['loan_amount']); ?></td>
						<td class="text-center"><?php echo h($gpfSubscription['GpfSubscription']['loan_recovery']); ?></td>
						<td class="text-center"><?php echo h($gpfSubscription['GpfSubscription']['loan_interest_amount']); ?></td>
						<td class="text-center"><?php echo h($gpfSubscription['GpfSubscription']['loan_interest_recovery']); ?></td>
						<td class="text-center"><?php echo h($gpfSubscription['GpfSubscription']['loan_date']); ?></td>
						<td class="text-center"><?php echo h($gpfSubscription['GpfSubscription']['sub_status']); ?></td>
						<td class="text-center"><?php echo h($gpfSubscription['GpfSubscription']['created_at']); ?></td>
						<td class="text-center"><?php echo h($gpfSubscription['GpfSubscription']['updated_at']); ?></td>
						<td class="text-center">
							<?php if($this->App->menu_permission('gpfSubscriptions','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $gpfSubscription['GpfSubscription']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
							<?php if($this->App->menu_permission('gpfSubscriptions','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $gpfSubscription['GpfSubscription']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); } ?>
							<?php if($this->App->menu_permission('gpfSubscriptions','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $gpfSubscription['GpfSubscription']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $gpfSubscription['GpfSubscription']['id'])); } ?>
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