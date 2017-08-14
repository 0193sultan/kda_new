<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Loan Type'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Loan Type List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="LoanTypes" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($loanType['LoanType']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Name'); ?></strong></td>
		<td>
			<?php echo h($loanType['LoanType']['name']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Interest Rate'); ?></strong></td>
		<td>
			<?php echo h($loanType['LoanType']['interest_rate'])."%"; ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Status'); ?></strong></td>
		<td>
			<?php 
			if($loanType['LoanType']['status'] == 0)
			{
				echo "Active";
			}
			else if($loanType['LoanType']['status'] == 1)
			{
				echo "Inactive";
			}

			 ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created Date'); ?></strong></td>
		<td>
			<?php echo h($loanType['LoanType']['created_date']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

					
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title"><?php echo __('Related Employee Loans'); ?></h3>
					<div class="box-tools pull-right">
						<?php echo $this->Html->link('<i class="glyphicon glyphicon-plus"></i> '.__('New Employee Loan'), array('controller' => 'employee_loans', 'action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); ?>					</div><!-- /.actions -->
				</div>
				<?php if (!empty($loanType['EmployeeLoan'])): ?>
					
					<div class="box-body table-responsive">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
											<th class="text-center"><?php echo __('Id'); ?></th>
		<th class="text-center"><?php echo __('Employee Id'); ?></th>
		<th class="text-center"><?php echo __('Loan Type Id'); ?></th>
		<th class="text-center"><?php echo __('Loan Id'); ?></th>
		<th class="text-center"><?php echo __('Loan Amount'); ?></th>
		<th class="text-center"><?php echo __('Number Of Installment'); ?></th>
		<th class="text-center"><?php echo __('Installment Amount'); ?></th>
		<th class="text-center"><?php echo __('Loan Apply Date'); ?></th>
		<th class="text-center"><?php echo __('Loan Approved Date'); ?></th>
		<th class="text-center"><?php echo __('Status'); ?></th>
									<th class="text-center"><?php echo __('Actions'); ?></th>
								</tr>
							</thead>
							<tbody>
									<?php
										$i = 0;
										foreach ($loanType['EmployeeLoan'] as $employeeLoan): ?>
		<tr>
			<td class="text-center"><?php echo $employeeLoan['id']; ?></td>
			<td class="text-center"><?php echo $employeeLoan['employee_id']; ?></td>
			<td class="text-center"><?php echo $employeeLoan['loan_type_id']; ?></td>
			<td class="text-center"><?php echo $employeeLoan['loan_id']; ?></td>
			<td class="text-center"><?php echo $employeeLoan['loan_amount']; ?></td>
			<td class="text-center"><?php echo $employeeLoan['number_of_installment']; ?></td>
			<td class="text-center"><?php echo $employeeLoan['installment_amount']; ?></td>
			<td class="text-center"><?php echo $employeeLoan['loan_apply_date']; ?></td>
			<td class="text-center"><?php echo $employeeLoan['loan_approved_date']; ?></td>
			<td class="text-center"><?php echo $employeeLoan['status']; ?></td>
			<td class="text-center">
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('controller' => 'employee_loans', 'action' => 'view', $employeeLoan['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); ?>
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('controller' => 'employee_loans', 'action' => 'edit', $employeeLoan['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); ?>
				<?php echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('controller' => 'employee_loans', 'action' => 'delete', $employeeLoan['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $employeeLoan['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
							</tbody>
						</table><!-- /.table table-striped table-bordered -->
					</div><!-- /.table-responsive -->
					
				<?php endif; ?>

				
				
			</div><!-- /.related -->

					
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title"><?php echo __('Related Loans'); ?></h3>
					<div class="box-tools pull-right">
						<?php echo $this->Html->link('<i class="glyphicon glyphicon-plus"></i> '.__('New Loan'), array('controller' => 'loans', 'action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); ?>					</div><!-- /.actions -->
				</div>
				<?php if (!empty($loanType['Loan'])): ?>
					
					<div class="box-body table-responsive">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
											<th class="text-center"><?php echo __('Id'); ?></th>
		<th class="text-center"><?php echo __('Name'); ?></th>
		<th class="text-center"><?php echo __('Loan Type Id'); ?></th>
		<th class="text-center"><?php echo __('Highest Limit'); ?></th>
		<th class="text-center"><?php echo __('Loan Limit Currency'); ?></th>
		<th class="text-center"><?php echo __('Applicable For'); ?></th>
		<th class="text-center"><?php echo __('Allow Multiple Time'); ?></th>
		<th class="text-center"><?php echo __('Highest Installment Qty'); ?></th>
		<th class="text-center"><?php echo __('Lowest Installment Qty'); ?></th>
		<th class="text-center"><?php echo __('Recovery Policy'); ?></th>
		<th class="text-center"><?php echo __('Status'); ?></th>
									<th class="text-center"><?php echo __('Actions'); ?></th>
								</tr>
							</thead>
							<tbody>
									<?php
										$i = 0;
										foreach ($loanType['Loan'] as $loan): ?>
		<tr>
			<td class="text-center"><?php echo $loan['id']; ?></td>
			<td class="text-center"><?php echo $loan['name']; ?></td>
			<td class="text-center"><?php echo $loan['loan_type_id']; ?></td>
			<td class="text-center"><?php echo $loan['highest_limit']; ?></td>
			<td class="text-center"><?php echo $loan['loan_limit_currency']; ?></td>
			<td class="text-center"><?php echo $loan['applicable_for']; ?></td>
			<td class="text-center"><?php echo $loan['allow_multiple_time']; ?></td>
			<td class="text-center"><?php echo $loan['highest_installment_qty']; ?></td>
			<td class="text-center"><?php echo $loan['lowest_installment_qty']; ?></td>
			<td class="text-center"><?php echo $loan['recovery_policy']; ?></td>
			<td class="text-center"><?php echo $loan['status']; ?></td>
			<td class="text-center">
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('controller' => 'loans', 'action' => 'view', $loan['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); ?>
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('controller' => 'loans', 'action' => 'edit', $loan['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); ?>
				<?php echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('controller' => 'loans', 'action' => 'delete', $loan['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $loan['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
							</tbody>
						</table><!-- /.table table-striped table-bordered -->
					</div><!-- /.table-responsive -->
					
				<?php endif; ?>

				
				
			</div><!-- /.related -->

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

