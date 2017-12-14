<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Loan Adjustments'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('loanAdjustments','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Loan Adjustment'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">
                <table id="LoanAdjustments" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('employee_loan_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('adjustment_amount'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('previous_current_due'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('previous_interest_amount_due'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('adjustment_on_current_due'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('adjustment_on_interest_amount_due'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('adjustment_date'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('created_at'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('updated_at'); ?></th>
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($loanAdjustments as $loanAdjustment): ?>
					<tr>
						<td class="text-center"><?php echo h($loanAdjustment['LoanAdjustment']['id']); ?></td>
						<td class="text-center">
			<?php echo $this->Html->link($loanAdjustment['EmployeeLoan']['id'], array('controller' => 'employee_loans', 'action' => 'view', $loanAdjustment['EmployeeLoan']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($loanAdjustment['LoanAdjustment']['adjustment_amount']); ?></td>
						<td class="text-center"><?php echo h($loanAdjustment['LoanAdjustment']['previous_current_due']); ?></td>
						<td class="text-center"><?php echo h($loanAdjustment['LoanAdjustment']['previous_interest_amount_due']); ?></td>
						<td class="text-center"><?php echo h($loanAdjustment['LoanAdjustment']['adjustment_on_current_due']); ?></td>
						<td class="text-center"><?php echo h($loanAdjustment['LoanAdjustment']['adjustment_on_interest_amount_due']); ?></td>
						<td class="text-center"><?php echo h($loanAdjustment['LoanAdjustment']['adjustment_date']); ?></td>
						<td class="text-center"><?php echo h($loanAdjustment['LoanAdjustment']['created_at']); ?></td>
						<td class="text-center"><?php echo h($loanAdjustment['LoanAdjustment']['updated_at']); ?></td>
						<td class="text-center">
							<?php if($this->App->menu_permission('loanAdjustments','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $loanAdjustment['LoanAdjustment']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
							<?php if($this->App->menu_permission('loanAdjustments','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $loanAdjustment['LoanAdjustment']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); } ?>
							<?php if($this->App->menu_permission('loanAdjustments','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $loanAdjustment['LoanAdjustment']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $loanAdjustment['LoanAdjustment']['id'])); } ?>
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