<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Gpf Subscription'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Gpf Subscription List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="GpfSubscriptions" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($gpfSubscription['GpfSubscription']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Employee'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($gpfSubscription['Employee']['name'], array('controller' => 'employees', 'action' => 'view', $gpfSubscription['Employee']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Employee Loan'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($gpfSubscription['EmployeeLoan']['id'], array('controller' => 'employee_loans', 'action' => 'view', $gpfSubscription['EmployeeLoan']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Fiscal Year Id'); ?></strong></td>
		<td>
			<?php echo h($gpfSubscription['GpfSubscription']['fiscal_year_id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Month Id'); ?></strong></td>
		<td>
			<?php echo h($gpfSubscription['GpfSubscription']['month_id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Subscription Recovery'); ?></strong></td>
		<td>
			<?php echo h($gpfSubscription['GpfSubscription']['subscription_recovery']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Total Subscription Balance'); ?></strong></td>
		<td>
			<?php echo h($gpfSubscription['GpfSubscription']['total_subscription_balance']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Subscription Interest'); ?></strong></td>
		<td>
			<?php echo h($gpfSubscription['GpfSubscription']['subscription_interest']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Current Balance Date'); ?></strong></td>
		<td>
			<?php echo h($gpfSubscription['GpfSubscription']['current_balance_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Loan Amount'); ?></strong></td>
		<td>
			<?php echo h($gpfSubscription['GpfSubscription']['loan_amount']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Loan Recovery'); ?></strong></td>
		<td>
			<?php echo h($gpfSubscription['GpfSubscription']['loan_recovery']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Loan Interest Amount'); ?></strong></td>
		<td>
			<?php echo h($gpfSubscription['GpfSubscription']['loan_interest_amount']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Loan Interest Recovery'); ?></strong></td>
		<td>
			<?php echo h($gpfSubscription['GpfSubscription']['loan_interest_recovery']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Loan Date'); ?></strong></td>
		<td>
			<?php echo h($gpfSubscription['GpfSubscription']['loan_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Sub Status'); ?></strong></td>
		<td>
			<?php echo h($gpfSubscription['GpfSubscription']['sub_status']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created At'); ?></strong></td>
		<td>
			<?php echo h($gpfSubscription['GpfSubscription']['created_at']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Updated At'); ?></strong></td>
		<td>
			<?php echo h($gpfSubscription['GpfSubscription']['updated_at']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

