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
			<?php if($loan['Loan']['loan_limit_currency'] == 0) {echo "TK";} else if($loan['Loan']['loan_limit_currency'] == 1 ) {echo "GPF";} ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Applicable For'); ?></strong></td>
		<td>
			<?php 
				if($loan['Loan']['applicable_for'] == 0 )
				{
					echo "All";
				}
				else if($loan['Loan']['applicable_for'] == 1)
				{
					echo "> 5 Grade";
				}
			?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Allow Multiple Time'); ?></strong></td>
		<td>
			<?php 
				if($loan['Loan']['allow_multiple_time'] == 0)
				{
					echo "No";
				}
				else if($loan['Loan']['allow_multiple_time'] == 1)
				{
					echo "Yes";
				}
			?>
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
			<?php 
			if($loan['Loan']['recovery_policy'] == 0)
			{
				echo "Start from next month";
			}
			else if($loan['Loan']['recovery_policy'] == 1)
			{
				echo "start from after one year";
			}

			?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Status'); ?></strong></td>
		<td>
			<?php 
				if($loan['Loan']['status'] == 0)
				{
					echo "Active";
				}
				else if($loan['Loan']['status'] == 1)
				{
					echo "Inactive";
				}
			?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

