<!-- <div class="row">
    <div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Loan Recovery'); ?></h3>
				<div class="box-tools pull-right">
					<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Loan Recovery List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>
			<div class="box-body">		
			<?php echo $this->Form->create('LoanRecovery', array('role' => 'form')); ?>
					<div class="form-group">

						<?php echo $this->Form->input('month_id', array('class' => 'form-control')); ?>
					</div>

					<div class="form-group">
						<?php echo $this->Form->input('employee_loan_id', array('class' => 'form-control')); ?> -->
			<!-- 		</div>

				<?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
			<?php echo $this->Form->end(); ?>
			</div>
		</div>			
	</div>
</div> -->


<?php

$month_id = '5';

$obj = new LoanRecoveriesController();


foreach ($employeeLoans as  $employee_loan_id) 
{

	$res = $obj->ttl_instlmnt_qty_loanAmount_installmentAmount($employee_loan_id);
	$ttl_rcvry = $obj->ttl_recovery_by_employeeLoanId($employee_loan_id);
	
	if($ttl_rcvry <= $res['number_of_installment'])
	{
		$obj->loan_recovery_insert($month_id,$employee_loan_id);
	}

}

?>