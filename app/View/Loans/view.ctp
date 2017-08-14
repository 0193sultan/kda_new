<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Loan'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Loan List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="Loans" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($loan['Loan']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Name'); ?></strong></td>
		<td>
			<?php echo h($loan['Loan']['name']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Loan Type'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($loan['LoanType']['name'], array('controller' => 'loan_types', 'action' => 'view', $loan['LoanType']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Highest Limit'); ?></strong></td>
		<td>
			<?php echo h($loan['Loan']['highest_limit']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Loan Limit Currency'); ?></strong></td>
		<td>
			<?php echo h($loan['Loan']['loan_limit_currency']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Applicable For'); ?></strong></td>
		<td>
			<?php echo h($loan['Loan']['applicable_for']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Allow Multiple Time'); ?></strong></td>
		<td>
			<?php echo h($loan['Loan']['allow_multiple_time']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Highest Installment Qty'); ?></strong></td>
		<td>
			<?php echo h($loan['Loan']['highest_installment_qty']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Lowest Installment Qty'); ?></strong></td>
		<td>
			<?php echo h($loan['Loan']['lowest_installment_qty']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Recovery Policy'); ?></strong></td>
		<td>
			<?php echo h($loan['Loan']['recovery_policy']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Status'); ?></strong></td>
		<td>
			<?php echo h($loan['Loan']['status']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

