<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Loan Adjustment'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Loan Adjustment List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="LoanAdjustments" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($loanAdjustment['LoanAdjustment']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Employee Loan'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($loanAdjustment['EmployeeLoan']['id'], array('controller' => 'employee_loans', 'action' => 'view', $loanAdjustment['EmployeeLoan']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Adjustment Amount'); ?></strong></td>
		<td>
			<?php echo h($loanAdjustment['LoanAdjustment']['adjustment_amount']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Previous Current Due'); ?></strong></td>
		<td>
			<?php echo h($loanAdjustment['LoanAdjustment']['previous_current_due']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Previous Interest Amount Due'); ?></strong></td>
		<td>
			<?php echo h($loanAdjustment['LoanAdjustment']['previous_interest_amount_due']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Adjustment On Current Due'); ?></strong></td>
		<td>
			<?php echo h($loanAdjustment['LoanAdjustment']['adjustment_on_current_due']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Adjustment On Interest Amount Due'); ?></strong></td>
		<td>
			<?php echo h($loanAdjustment['LoanAdjustment']['adjustment_on_interest_amount_due']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Adjustment Date'); ?></strong></td>
		<td>
			<?php echo h($loanAdjustment['LoanAdjustment']['adjustment_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created At'); ?></strong></td>
		<td>
			<?php echo h($loanAdjustment['LoanAdjustment']['created_at']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Updated At'); ?></strong></td>
		<td>
			<?php echo h($loanAdjustment['LoanAdjustment']['updated_at']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

