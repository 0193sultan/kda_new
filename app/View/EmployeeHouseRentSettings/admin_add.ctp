<div class="row">
    <div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Employee House Rent Setting'); ?></h3>
				<div class="box-tools pull-right">
					<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Employee House Rent Setting List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>
			<div class="box-body">		
			<?php echo $this->Form->create('EmployeeHouseRentSetting', array('role' => 'form')); ?>
										<div class="form-group">
						<?php echo $this->Form->input('gazette_year', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('min_basic', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('max_basic', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('location_id', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('house_rent_percent', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('house_rent_min', array('class' => 'form-control')); ?>
					</div>
					
					<div class="form-group" style="display: none;">
						<?php echo $this->Form->input('user_id', array('hiddenField' => 'true','class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('status', array('options' => array('Active' => 'Active', 'Inactive' => 'InActive'),'class' => 'form-control')); ?>
					</div>

				<?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
			<?php echo $this->Form->end(); ?>
			</div>
		</div>			
	</div>
</div>