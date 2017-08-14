<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Loan Recovery'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Loan Recovery List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="LoanRecoveries" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($loanRecovery['LoanRecovery']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Month'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($loanRecovery['Month']['name'], array('controller' => 'months', 'action' => 'view', $loanRecovery['Month']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Employee Loan'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($loanRecovery['EmployeeLoan']['id'], array('controller' => 'employee_loans', 'action' => 'view', $loanRecovery['EmployeeLoan']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

