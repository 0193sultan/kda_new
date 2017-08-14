<div class="row">
    <div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Add Monthly Attendance Entry'); ?></h3>
				<div class="box-tools pull-right">
					<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Monthly Attendance Entry List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>
			<div class="box-body">	
			<?php echo $this->Form->create('MonthlyAttendanceEntry', array('role' => 'form')); ?>
										<div class="form-group">
						<?php echo $this->Form->input('employee_id', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('official_attendence', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('casual_leave', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('sick_leave', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('earned_leave', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('maternity_leave', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('total_attendance', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('panalty', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('datetime', array('class' => 'form-control')); ?>
					</div>

				<?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
			<?php echo $this->Form->end(); ?>
			</div>
		</div>			
	</div>
</div>