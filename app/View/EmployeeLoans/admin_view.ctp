<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Employee Loan'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Employee Loan List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="EmployeeLoans" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($employeeLoan['EmployeeLoan']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Employee'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($employeeLoan['Employee']['name'], array('controller' => 'employees', 'action' => 'view', $employeeLoan['Employee']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Loan Type'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($employeeLoan['LoanType']['name'], array('controller' => 'loan_types', 'action' => 'view', $employeeLoan['LoanType']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Loan'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($employeeLoan['Loan']['name'], array('controller' => 'loans', 'action' => 'view', $employeeLoan['Loan']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Loan Amount'); ?></strong></td>
		<td>
			<?php echo h($employeeLoan['EmployeeLoan']['loan_amount']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Number Of Installment'); ?></strong></td>
		<td>
			<?php echo h($employeeLoan['EmployeeLoan']['number_of_installment']); ?>
			&nbsp;
		</td>
</tr>

<tr>		
	<td><strong><?php echo __('Installment Amount'); ?></strong></td>
		<td>
			<?php echo h($employeeLoan['EmployeeLoan']['installment_amount']); ?>
			&nbsp;
		</td>
</tr>

<tr>		
	<td><strong><?php echo __('Interest Amount'); ?></strong></td>
		<td>
			<?php echo h($employeeLoan['EmployeeLoan']['interest_amount']); ?>
			&nbsp;
		</td>
</tr>

<tr>		
	<td><strong><?php echo __('Total Payabale'); ?></strong></td>
		<td>
			<?php echo h($employeeLoan['EmployeeLoan']['total_payable']); ?>
			&nbsp;
		</td>
</tr>

<tr>		
	<td><strong><?php echo __('Current Due'); ?></strong></td>
		<td>
			<?php echo h($employeeLoan['EmployeeLoan']['current_due']); ?>
			&nbsp;
		</td>
</tr>



<tr>		<td><strong><?php echo __('Loan Apply Date'); ?></strong></td>
		<td>
			<?php echo h($employeeLoan['EmployeeLoan']['loan_apply_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Loan Approved Date'); ?></strong></td>
		<td>
			<?php echo h($employeeLoan['EmployeeLoan']['loan_approved_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Status'); ?></strong></td>
		<td>
			<?php
			
			if($employeeLoan['EmployeeLoan']['status'] == 0)
			{
				echo "Active";
			}

			else if($employeeLoan['EmployeeLoan']['status'] == 1)
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

