<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Due Salary Sheet'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Due Salary Sheet List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="DueSalarySheets" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Employee'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($dueSalarySheet['Employee']['name'], array('controller' => 'employees', 'action' => 'view', $dueSalarySheet['Employee']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Current Basic'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['current_basic']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('New Basic Salary'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['new_basic_salary']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Da'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['da']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Pp'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['pp']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Medical'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['medical']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Convance'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['convance']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Wash'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['wash']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Mobile'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['mobile']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Cycle'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['cycle']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Charge'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['charge']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Other'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['other']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Gross Pay'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['gross_pay']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('House Rent'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['house_rent']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Telephone Allowance'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['telephone_allowance']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Tiffin'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['tiffin']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Education'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['education']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Status'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['status']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Total Payable'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['total_payable']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Fiscal Year'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($dueSalarySheet['FiscalYear']['name'], array('controller' => 'fiscal_years', 'action' => 'view', $dueSalarySheet['FiscalYear']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Month'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($dueSalarySheet['Month']['name'], array('controller' => 'months', 'action' => 'view', $dueSalarySheet['Month']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created At'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['created_at']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Updated At'); ?></strong></td>
		<td>
			<?php echo h($dueSalarySheet['DueSalarySheet']['updated_at']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

