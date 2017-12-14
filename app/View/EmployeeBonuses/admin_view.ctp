<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Employee Bonus'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Employee Bonus List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="EmployeeBonuses" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($employeeBonus['EmployeeBonus']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Employee'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($employeeBonus['Employee']['name'], array('controller' => 'employees', 'action' => 'view', $employeeBonus['Employee']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Current Basic'); ?></strong></td>
		<td>
			<?php echo h($employeeBonus['EmployeeBonus']['current_basic']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Scale'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($employeeBonus['Scale']['name'], array('controller' => 'scales', 'action' => 'view', $employeeBonus['Scale']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Bonus Amount'); ?></strong></td>
		<td>
			<?php echo h($employeeBonus['EmployeeBonus']['bonus_amount']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Percent'); ?></strong></td>
		<td>
			<?php echo h($employeeBonus['EmployeeBonus']['percent']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Fiscal Year'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($employeeBonus['FiscalYear']['name'], array('controller' => 'fiscal_years', 'action' => 'view', $employeeBonus['FiscalYear']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Month'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($employeeBonus['Month']['name'], array('controller' => 'months', 'action' => 'view', $employeeBonus['Month']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('User'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($employeeBonus['User']['name'], array('controller' => 'users', 'action' => 'view', $employeeBonus['User']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created At'); ?></strong></td>
		<td>
			<?php echo h($employeeBonus['EmployeeBonus']['created_at']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Updated At'); ?></strong></td>
		<td>
			<?php echo h($employeeBonus['EmployeeBonus']['updated_at']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

