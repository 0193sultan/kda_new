<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Loans'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('loans','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Loan'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">
                <table id="Loans" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('name'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('loan_type_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('highest_limit'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('loan_limit_currency'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('applicable_for'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('allow_multiple_time'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('highest_installment_qty'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('lowest_installment_qty'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('recovery_policy'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('status'); ?></th>
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($loans as $loan): ?>
					<tr>
						<td class="text-center"><?php echo h($loan['Loan']['id']); ?></td>
						<td class="text-center"><?php echo h($loan['Loan']['name']); ?></td>
						<td class="text-center">
			<?php echo $this->Html->link($loan['LoanType']['name'], array('controller' => 'loan_types', 'action' => 'view', $loan['LoanType']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($loan['Loan']['highest_limit']); ?></td>
						<td class="text-center"><?php echo h($loan['Loan']['loan_limit_currency']); ?></td>
						<td class="text-center"><?php echo h($loan['Loan']['applicable_for']); ?></td>
						<td class="text-center"><?php echo h($loan['Loan']['allow_multiple_time']); ?></td>
						<td class="text-center"><?php echo h($loan['Loan']['highest_installment_qty']); ?></td>
						<td class="text-center"><?php echo h($loan['Loan']['lowest_installment_qty']); ?></td>
						<td class="text-center"><?php echo h($loan['Loan']['recovery_policy']); ?></td>
						<td class="text-center"><?php echo h($loan['Loan']['status']); ?></td>
						<td class="text-center">
							<?php if($this->App->menu_permission('loans','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $loan['Loan']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
							<?php if($this->App->menu_permission('loans','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $loan['Loan']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); } ?>
							<?php if($this->App->menu_permission('loans','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $loan['Loan']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $loan['Loan']['id'])); } ?>
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