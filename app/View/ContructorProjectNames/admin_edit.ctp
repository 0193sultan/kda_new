<div class="row">
    <div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Edit Contructor Project Name'); ?></h3>
				<div class="box-tools pull-right">
					<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Contructor Project Name List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>
			<div class="box-body">		
			<?php echo $this->Form->create('ContructorProjectName', array('role' => 'form')); ?>
										<div class="form-group">
						<?php echo $this->Form->input('id', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('name', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('project_type_id', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('project_head_name', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('location', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('project_value', array('class' => 'form-control')); ?>
					</div>
					<!-- <div class="form-group">
						<?php echo $this->Form->input('schedule_money', array('class' => 'form-control')); ?>
					</div> -->
					<div class="form-group">
						<?php echo $this->Form->input('schedule_money_%', array('class' => 'form-control')); ?>
					</div>
					<!-- <div class="form-group">
						<?php echo $this->Form->input('security_money', array('class' => 'form-control')); ?>
					</div> -->
					<div class="form-group">
						<?php echo $this->Form->input('security_money_%', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('project_start_date', array('type' => 'text','class' => 'form-control datepicker','required' => true)); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('projcet_details', array('class' => 'form-control')); ?>
					</div>
					<!-- <div class="form-group">
						<?php echo $this->Form->input('user_id', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('created_at', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('updated_at', array('class' => 'form-control')); ?>
					</div> -->

				<?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
			<?php echo $this->Form->end(); ?>
			</div>
		</div>			
	</div>
</div>