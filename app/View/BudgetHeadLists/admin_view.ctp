<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Budget Head List'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Budget Head List List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="BudgetHeadLists" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($budgetHeadList['BudgetHeadList']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Budget Schedule'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($budgetHeadList['BudgetSchedule']['name'], array('controller' => 'budget_schedules', 'action' => 'view', $budgetHeadList['BudgetSchedule']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Head Name'); ?></strong></td>
		<td>
			<?php echo h($budgetHeadList['BudgetHeadList']['head_name']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Order No'); ?></strong></td>
		<td>
			<?php echo h($budgetHeadList['BudgetHeadList']['order_no']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Status'); ?></strong></td>
		<td>
			<?php echo h($budgetHeadList['BudgetHeadList']['status']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

