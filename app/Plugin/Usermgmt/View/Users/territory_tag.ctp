<div class="row">
    <div class="col-md-12">
		<?php echo $message; ?>
		<div class="box box-primary">			
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Edit Territory'); ?></h3>
				<div class="box-tools pull-right">
					<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> User List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">		
			<?php echo $this->Form->create('SalesPerson'); ?>
				<?php echo $this->Form->input("id" ,array('type' => 'hidden', 'label' => false,'div' => false))?>
				<?php echo $this->Form->input("office_id" ,array('type' => 'hidden', 'label' => false,'div' => false))?>
				<div class="form-group">
					<?php echo $this->Form->input('SalesPerson.territory_id', array('class' => 'form-control','empty'=>'---- Select ----','options'=>$territorys,'required'=>true)); ?>
				</div>				
				<?php echo $this->Form->submit('Update Territory', array('class' => 'btn btn-large btn-primary')); ?>
			<?php echo $this->Form->end(); ?>
		</div>			
	</div>
</div>
