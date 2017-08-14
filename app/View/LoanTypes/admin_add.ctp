<div class="row">
    <div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Loan Type'); ?></h3>
				<div class="box-tools pull-right">
					<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Loan Type List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>
			<div class="box-body">		
			<?php echo $this->Form->create('LoanType', array('role' => 'form')); ?>
										<div class="form-group">
						<?php echo $this->Form->input('name', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('interest_rate', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php 
						
						/*echo $this->Form->input('status', array('class' => 'form-control'));*/ 
						
						$roles = array('0'=>'Active','1'=>'Inactive');
						echo $this->Form->input('status', array(
						     'options' => $roles,
						    'class' => 'form-control',
						));

						?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('created_date', array('type' => 'text', 'class' => array('form-control','datepicker'))); ?>
					</div>

				<?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
			<?php echo $this->Form->end(); ?>
			</div>
		</div>			
	</div>
</div>