<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Work Order'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Work Order List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="WorkOrders" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($workOrder['WorkOrder']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Contructor Project Name'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($workOrder['ContructorProjectName']['name'], array('controller' => 'contructor_project_names', 'action' => 'view', $workOrder['ContructorProjectName']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Contructor Name'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($workOrder['ContructorName']['name'], array('controller' => 'contructor_names', 'action' => 'view', $workOrder['ContructorName']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Work Order No'); ?></strong></td>
		<td>
			<?php echo h($workOrder['WorkOrder']['work_order_no']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Fiscal Years'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($workOrder['FiscalYears']['name'], array('controller' => 'fiscal_years', 'action' => 'view', $workOrder['FiscalYears']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Work Order Date'); ?></strong></td>
		<td>
			<?php echo h($workOrder['WorkOrder']['work_order_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Work Order Details'); ?></strong></td>
		<td>
			<?php echo h($workOrder['WorkOrder']['work_order_details']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('User'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($workOrder['User']['name'], array('controller' => 'users', 'action' => 'view', $workOrder['User']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created At'); ?></strong></td>
		<td>
			<?php echo h($workOrder['WorkOrder']['created_at']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Updated At'); ?></strong></td>
		<td>
			<?php echo h($workOrder['WorkOrder']['updated_at']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

