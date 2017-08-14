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
			<div class="form-group col-md-offset-3 col-lg-offset-3" style="width: 40%; border: 0.5px solid black; padding: 20px;">
		
				<?php 
					echo $this->Form->create(false, array(
					    'url' => array('controller' => 'loans', 'action' => 'loan_name_search'),
					    'id' => 'loan_name'
					));
				 ?>
		
				<?php echo $this->Form->input('loan_name', array('required' => true, 'class' => 'form-control')); ?>

				<?php echo $this->Form->submit('Search', array('class' => 'btn-large btn-primary', 'style' =>'margin-left: 18px')); ?>

				<?php echo $this->Form->end(); ?>

			</div>

			</div>
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
					<?php foreach ($res as $loan): ?>
					<tr>
						<td class="text-center"><?php echo h($loan['Loan']['id']); ?></td>
						<td class="text-center"><?php echo h($loan['Loan']['name']); ?></td>
						<td class="text-center">
			<?php echo $this->Html->link($loan['LoanType']['name'], array('controller' => 'loan_types', 'action' => 'view', $loan['LoanType']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($loan['Loan']['highest_limit']); ?></td>
						<td class="text-center">
						<?php
						 if($loan['Loan']['loan_limit_currency'] == 0)
						 {
						 	echo "TK";
						 }
						 else if($loan['Loan']['loan_limit_currency'] == 1)
						 {
						 	echo "GPF";
						 }

						 ?></td>
						<td class="text-center">
						<?php
						if($loan['Loan']['applicable_for'] == 0)
						{
							echo "All";
						}  
						else if($loan['Loan']['applicable_for'] == 1)
						{
							echo "> 5 Grade";
						}
						?></td>
						<td class="text-center">
						<?php
						if($loan['Loan']['allow_multiple_time'] == 0)
						{
							echo "No";
						} 
						else if($loan['Loan']['allow_multiple_time'] == 1)
						{
							echo "Yes";
						}

						 ?></td>
						<td class="text-center"><?php echo h($loan['Loan']['highest_installment_qty']); ?></td>
						<td class="text-center"><?php echo h($loan['Loan']['lowest_installment_qty']); ?></td>
						<td class="text-center">
						<?php 
						if($loan['Loan']['recovery_policy'] == 0)
						{
							echo "Start from next month";
						}
						else if($loan['Loan']['recovery_policy'] == 1)
						{
							echo "Start from next Year";
						}
						 ?>
						 	
						 </td>
						<td class="text-center">
						<?php 

						if($loan['Loan']['status'] == 0)
						{
							echo "Active";
						} 
						else if($loan['Loan']['status'] ==1)
						{
							echo "Inactive";
						}

						?></td>
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