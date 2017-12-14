<style>
 .iradio_minimal{
 	margin: 2px 5px 6px 25px;
 }
</style>


<div class="row">
    <div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Edit Acc Head List'); ?></h3>
				<div class="box-tools pull-right">
					<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Acc Head List List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>
			<div class="box-body">		
			<?php echo $this->Form->create('AccHeadList', array('role' => 'form')); ?>
					<div class="form-group">
						<?php echo $this->Form->input('id', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('acc_head_type_id', array('class' => 'form-control', 'empty'=>'---- Please Select ----', 'disabled')); ?>
						<?php echo $this->Form->input('acc_head_type_id', array('class' => 'form-control', 'empty'=>'---- Please Select ----', 'type'=>'hidden')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('head_name', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('has_parent', array('class' => 'form-control has_parent', 'options'=>array('No'=>'No', 'Yes'=>'Yes'), 'disabled')); ?>
					</div>
					<div class="form-group parent_id">
						<?php echo $this->Form->input('parent_id', array('class' => 'form-control parent_info', 'options'=>$parent_head_list, 'empty'=>'---- Please Select ----')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('order_no', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
					<strong style="margin-left: 155px;">Effect On :</strong>
						<?php echo $this->Form->input('acc_effect_id', array('type'=>'radio', 'div'=>false, 'class' => 'form-control', 'hiddenField'=>false, 'label'=>false, 'legend'=>false)); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('status', array('class' => 'form-control', 'options'=>array('Active'=>'Active', 'Inactive'=>'Inactive'))); ?>
					</div>

				<?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
			<?php echo $this->Form->end(); ?>
			</div>
		</div>			
	</div>
</div>


<script>
	$(document).ready(function(){

		if ($('.parent_info').val() == '') {
			$('.parent_id').hide();
		} else {
			$('.parent_id').show();
			$('.has_parent').val('Yes');
		}

	});
</script>