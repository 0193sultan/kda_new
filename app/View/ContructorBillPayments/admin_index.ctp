<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Contructor Bill Payments'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('contructorBillPayments','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Contructor Bill Payment'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">
                <table id="ContructorBillPayments" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('Project Name'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('Contructor Name'); ?></th>
							<!-- <th class="text-center"><?php echo $this->Paginator->sort('work_order_id'); ?></th> -->
							<th class="text-center"><?php echo $this->Paginator->sort('work_order_no'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('bill_amount'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('voucher_no'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('fiscal_year_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('vat_%'); ?></th>
							<!-- <th class="text-center"><?php echo $this->Paginator->sort('vat'); ?></th> -->
							<th class="text-center"><?php echo $this->Paginator->sort('tax_%'); ?></th>
							<!-- <th class="text-center"><?php echo $this->Paginator->sort('tax'); ?></th> -->
							<th class="text-center"><?php echo $this->Paginator->sort('security_money_%'); ?></th>
							<!-- <th class="text-center"><?php echo $this->Paginator->sort('security_money'); ?></th> -->
							<th class="text-center"><?php echo $this->Paginator->sort('advance_adjustment'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('net_pay'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('bill_pay_date'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('payment_note'); ?></th>
							<!-- <th class="text-center"><?php echo $this->Paginator->sort('user_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('created_at'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('updated_at'); ?></th> -->
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($contructorBillPayments as $contructorBillPayment): ?>
						<!-- <?php 
						pr($contructorBillPayment);
						 ?> --> 
						
					<tr>
						<td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['id']); ?></td>
						
						
						<td class="text-center"><?php echo h($contructorBillPayment['WorkOrder']['ContructorName']['name']); ?></td>
						<td class="text-center"><?php echo h($contructorBillPayment['WorkOrder']['ContructorProjectName']['name']); ?></td>						
						<td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['work_order_no']); ?></td>
						<td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['bill_amount']); ?></td>
						<td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['voucher_no']); ?></td>
						<td class="text-center">
			<?php echo $this->Html->link($contructorBillPayment['FiscalYear']['name'], array('controller' => 'fiscal_years', 'action' => 'view', $contructorBillPayment['FiscalYear']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['vat_%']); ?></td>
						<!-- <td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['vat']); ?></td> -->
						<td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['tax_%']); ?></td>
						<!-- <td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['tax']); ?></td> -->
						<td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['security_money_%']); ?></td>
						<!-- <td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['security_money']); ?></td> -->
						<td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['advance_adjustment']); ?></td>
						<td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['net_pay']); ?></td>
						<td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['bill_pay_date']); ?></td>
						<td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['payment_note']); ?></td>
						<!-- <td class="text-center">
			<?php echo $this->Html->link($contructorBillPayment['User']['name'], array('controller' => 'users', 'action' => 'view', $contructorBillPayment['User']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['created_at']); ?></td>
						<td class="text-center"><?php echo h($contructorBillPayment['ContructorBillPayment']['updated_at']); ?></td> -->
						<td class="text-center">
							<?php if($this->App->menu_permission('contructorBillPayments','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $contructorBillPayment['ContructorBillPayment']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
							<?php if($this->App->menu_permission('contructorBillPayments','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $contructorBillPayment['ContructorBillPayment']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); } ?>
							<?php if($this->App->menu_permission('contructorBillPayments','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $contructorBillPayment['ContructorBillPayment']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $contructorBillPayment['ContructorBillPayment']['id'])); } ?>
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