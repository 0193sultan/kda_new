<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Contructor Advance Payments'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('contructorAdvancePayments','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Contructor Advance Payment'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">
                <table id="ContructorAdvancePayments" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
							<!-- <th class="text-center"><?php echo $this->Paginator->sort('work_order_id'); ?></th>  -->
							<th class="text-center"><?php echo $this->Paginator->sort('Project Name'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('Contructor Name'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('workorder_no'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('advance_amount'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('voucher_no'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('fiscal_years_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('payment_date'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('payment_note'); ?></th>
							<!-- <th class="text-center"><?php echo $this->Paginator->sort('user_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('created_at'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('updated_at'); ?></th> -->
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($contructorAdvancePayments as $contructorAdvancePayment): ?>
					<?php 
					 // pr($contructorAdvancePayment);
					 // pr($contructorAdvancePayment['WorkOrder']['ContructorProjectName']['name']);
					 // die();
					?> 
					<tr>
						<td class="text-center"><?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['id']); ?></td>
						<td class="text-center"><?php echo h($contructorAdvancePayment['WorkOrder']['ContructorProjectName']['name']); ?></td>
						<td class="text-center"><?php echo h($contructorAdvancePayment['WorkOrder']['ContructorName']['name']); ?></td>
						<td class="text-center"><?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['workorder_no']); ?></td>
						<td class="text-center"><?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['advance_amount']); ?></td>
						<td class="text-center"><?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['voucher_no']); ?></td>
						<td class="text-center">
			<?php echo $this->Html->link($contructorAdvancePayment['FiscalYears']['name'], array('controller' => 'fiscal_years', 'action' => 'view', $contructorAdvancePayment['FiscalYears']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['payment_date']); ?></td>
						<td class="text-center"><?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['payment_note']); ?></td>
						<!-- <td class="text-center">
			<?php echo $this->Html->link($contructorAdvancePayment['User']['name'], array('controller' => 'users', 'action' => 'view', $contructorAdvancePayment['User']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['created_at']); ?></td>
						<td class="text-center"><?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['updated_at']); ?></td> -->
						<td class="text-center">
							<?php if($this->App->menu_permission('contructorAdvancePayments','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $contructorAdvancePayment['ContructorAdvancePayment']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
							<?php if($this->App->menu_permission('contructorAdvancePayments','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $contructorAdvancePayment['ContructorAdvancePayment']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); } ?>
							<?php if($this->App->menu_permission('contructorAdvancePayments','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $contructorAdvancePayment['ContructorAdvancePayment']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $contructorAdvancePayment['ContructorAdvancePayment']['id'])); } ?>
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