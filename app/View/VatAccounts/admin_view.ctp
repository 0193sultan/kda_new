<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Vat Account'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Vat Account List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="VatAccounts" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($vatAccount['VatAccount']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Vat Account No'); ?></strong></td>
		<td>
			<?php echo h($vatAccount['VatAccount']['vat_account_no']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created At'); ?></strong></td>
		<td>
			<?php echo h($vatAccount['VatAccount']['created_at']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Updated At'); ?></strong></td>
		<td>
			<?php echo h($vatAccount['VatAccount']['updated_at']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

					
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title"><?php echo __('Related Vat Collections'); ?></h3>
					<div class="box-tools pull-right">
						<?php echo $this->Html->link('<i class="glyphicon glyphicon-plus"></i> '.__('New Vat Collection'), array('controller' => 'vat_collections', 'action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); ?>					</div><!-- /.actions -->
				</div>
				<?php if (!empty($vatAccount['VatCollection'])): ?>
					
					<div class="box-body table-responsive">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
											<th class="text-center"><?php echo __('Id'); ?></th>
		<th class="text-center"><?php echo __('Vat Account Id'); ?></th>
		<th class="text-center"><?php echo __('Vat Amount'); ?></th>
		<th class="text-center"><?php echo __('Daily Transaction Id'); ?></th>
		<th class="text-center"><?php echo __('Head Wise Account Balance Id'); ?></th>
		<th class="text-center"><?php echo __('Contructor Project Name Id'); ?></th>
		<th class="text-center"><?php echo __('Contructor Name Id'); ?></th>
		<th class="text-center"><?php echo __('Work Order Id'); ?></th>
		<th class="text-center"><?php echo __('Created At'); ?></th>
		<th class="text-center"><?php echo __('Updated At'); ?></th>
									<th class="text-center"><?php echo __('Actions'); ?></th>
								</tr>
							</thead>
							<tbody>
									<?php
										$i = 0;
										foreach ($vatAccount['VatCollection'] as $vatCollection): ?>
		<tr>
			<td class="text-center"><?php echo $vatCollection['id']; ?></td>
			<td class="text-center"><?php echo $vatCollection['vat_account_id']; ?></td>
			<td class="text-center"><?php echo $vatCollection['vat_amount']; ?></td>
			<td class="text-center"><?php echo $vatCollection['daily_transaction_id']; ?></td>
			<td class="text-center"><?php echo $vatCollection['head_wise_account_balance_id']; ?></td>
			<td class="text-center"><?php echo $vatCollection['contructor_project_name_id']; ?></td>
			<td class="text-center"><?php echo $vatCollection['contructor_name_id']; ?></td>
			<td class="text-center"><?php echo $vatCollection['work_order_id']; ?></td>
			<td class="text-center"><?php echo $vatCollection['created_at']; ?></td>
			<td class="text-center"><?php echo $vatCollection['updated_at']; ?></td>
			<td class="text-center">
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('controller' => 'vat_collections', 'action' => 'view', $vatCollection['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); ?>
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('controller' => 'vat_collections', 'action' => 'edit', $vatCollection['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); ?>
				<?php echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('controller' => 'vat_collections', 'action' => 'delete', $vatCollection['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $vatCollection['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
							</tbody>
						</table><!-- /.table table-striped table-bordered -->
					</div><!-- /.table-responsive -->
					
				<?php endif; ?>

				
				
			</div><!-- /.related -->

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

