<div class="row">
    <div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Config Meta'); ?></h3>
				<div class="box-tools pull-right">
					<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Config Meta List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>
			<div class="box-body">		
			<?php echo $this->Form->create('ConfigMeta', array('role' => 'form')); ?>
					
					<div class="form-group">
						<?php echo $this->Form->input('trackingId', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('key', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('value', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('comment', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group" style="display: none;">
						<?php echo $this->Form->input('user_id', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						
						<?php echo $this->Form->input('status', array('options' =>array('Active' => 'Active', 'Inactive' => 'Inactive'),'class' => 'form-control')); ?>
					</div>

				<?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
			<?php echo $this->Form->end(); ?>
			</div>
		</div>			
	</div>
</div>