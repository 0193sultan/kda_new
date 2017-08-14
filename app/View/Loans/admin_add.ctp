<div class="row">
    <div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Loan'); ?></h3>
				<div class="box-tools pull-right">
					<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Loan List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>
			<div class="box-body">		
			<?php echo $this->Form->create('Loan', array('role' => 'form')); ?>
										<div class="form-group">
						<?php echo $this->Form->input('name', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('loan_type_id', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('highest_limit', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">

					<label>Loan Limit Currency</label>
					TK
					<input type="radio" name="loan_limit_currency" value="0">
					GPF
					<input type="radio" name="loan_limit_currency" value="1">
					
					</div>
					<div class="form-group">
						<?php 
						$roles = array('0'=>'All','1'=>'> 5 Grade');
						echo $this->Form->input('applicable_for', array(
						     'options' => $roles,
						    'class' => 'form-control',
						));
					 ?>
					</div>
					<div class="form-group">
						<?php 
						$roles = array('0'=>'No','1'=>'Yes');
						echo $this->Form->input('allow_multiple_time', array(
						     'options' => $roles,
						    'class' => 'form-control',
						));
						?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('highest_installment_qty', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('lowest_installment_qty', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php 
						$roles = array('0'=>'Start from next month','1'=>'Start from after one year');
						echo $this->Form->input('recovery_policy', array(
						     'options' => $roles,
						    'class' => 'form-control',
						));
						?>
					</div>
					<div class="form-group">
						<?php 
						$roles = array('0'=>'Active','1'=>'Inactive');
						echo $this->Form->input('status', array(
						     'options' => $roles,
						    'class' => 'form-control',
						));
						?>
					</div>

				<?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
			<?php echo $this->Form->end(); ?>
			</div>
		</div>			
	</div>
</div>