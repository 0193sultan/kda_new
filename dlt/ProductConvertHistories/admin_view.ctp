<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Inventory Adjustment'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Inventory Adjustment List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="InventoryAdjustments" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($inventoryAdjustment['InventoryAdjustment']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Transaction Type'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($inventoryAdjustment['TransactionType']['name'], array('controller' => 'transaction_types', 'action' => 'view', $inventoryAdjustment['TransactionType']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Store'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($inventoryAdjustment['Store']['name'], array('controller' => 'stores', 'action' => 'view', $inventoryAdjustment['Store']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Institute'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($inventoryAdjustment['Institute']['name'], array('controller' => 'institutes', 'action' => 'view', $inventoryAdjustment['Institute']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Status'); ?></strong></td>
		<td>
			<?php echo h($inventoryAdjustment['InventoryAdjustment']['status']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Remarks'); ?></strong></td>
		<td>
			<?php echo h($inventoryAdjustment['InventoryAdjustment']['remarks']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created At'); ?></strong></td>
		<td>
			<?php echo h($inventoryAdjustment['InventoryAdjustment']['created_at']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created By'); ?></strong></td>
		<td>
			<?php echo h($inventoryAdjustment['InventoryAdjustment']['created_by']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Updated At'); ?></strong></td>
		<td>
			<?php echo h($inventoryAdjustment['InventoryAdjustment']['updated_at']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Updated By'); ?></strong></td>
		<td>
			<?php echo h($inventoryAdjustment['InventoryAdjustment']['updated_by']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

					
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title"><?php echo __('Related Inventory Adjustment Details'); ?></h3>
					<div class="box-tools pull-right">
						<?php echo $this->Html->link('<i class="glyphicon glyphicon-plus"></i> '.__('New Inventory Adjustment Detail'), array('controller' => 'inventory_adjustment_details', 'action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); ?>					</div><!-- /.actions -->
				</div>
				<?php if (!empty($inventoryAdjustment['InventoryAdjustmentDetail'])): ?>
					
					<div class="box-body table-responsive">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
											<th class="text-center"><?php echo __('Id'); ?></th>
		<th class="text-center"><?php echo __('Inventory Adjustment Id'); ?></th>
		<th class="text-center"><?php echo __('Current Inventory Id'); ?></th>
		<th class="text-center"><?php echo __('Quantity'); ?></th>
									<th class="text-center"><?php echo __('Actions'); ?></th>
								</tr>
							</thead>
							<tbody>
									<?php
										$i = 0;
										foreach ($inventoryAdjustment['InventoryAdjustmentDetail'] as $inventoryAdjustmentDetail): ?>
		<tr>
			<td class="text-center"><?php echo $inventoryAdjustmentDetail['id']; ?></td>
			<td class="text-center"><?php echo $inventoryAdjustmentDetail['inventory_adjustment_id']; ?></td>
			<td class="text-center"><?php echo $inventoryAdjustmentDetail['current_inventory_id']; ?></td>
			<td class="text-center"><?php echo $inventoryAdjustmentDetail['quantity']; ?></td>
			<td class="text-center">
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('controller' => 'inventory_adjustment_details', 'action' => 'view', $inventoryAdjustmentDetail['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); ?>
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('controller' => 'inventory_adjustment_details', 'action' => 'edit', $inventoryAdjustmentDetail['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); ?>
				<?php echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('controller' => 'inventory_adjustment_details', 'action' => 'delete', $inventoryAdjustmentDetail['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $inventoryAdjustmentDetail['id'])); ?>
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

