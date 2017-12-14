<div class="row">
    <div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Edit Contructor Bill Payment'); ?></h3>
				<div class="box-tools pull-right">
					<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Contructor Bill Payment List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>
			<div class="box-body">		
			<?php echo $this->Form->create('ContructorBillPayment', array('role' => 'form')); ?>
					<div class="form-group">
						<?php echo $this->Form->input('id', array('class' => 'form-control')); ?>
					</div>
					<!-- <div class="form-group">
						<?php echo $this->Form->input('work_order_id', array('class' => 'form-control')); ?>
					</div> -->

					<div class="form-group">
						<?php 
						$project_list = array('--Select--') + $contructor_project_name;
						echo $this->Form->input('contructor_project_name_id',array('label' => 'Project Name','options' => $project_list, 'id' => 'contructor_project_name'));  
						?>
					</div> 
					<div class="form-group">
						<?php
						$contructor_list = array('--Select--') + $contructor_name;
						echo $this->Form->input('contructor_name_id',array('label' => 'Contructor Name','options' => $contructor_list, 'id' => 'contructor_name'));  
						
						?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('work_order_no', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('bill_amount', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('voucher_no', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('vat_%', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('vat', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('tax_%', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('tax', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('security_money_%', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('security_money', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('advance_adjustment', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('net_pay', array('class' => 'form-control')); ?>
					</div>
					<div class="form-group">
 						<?php echo $this->Form->input('bill_pay_date', array('type' => 'text','class' => 'form-control datepicker','required' => true)); ?>
					</div>
					<div class="form-group">
						<?php echo $this->Form->input('payment_note', array('class' => 'form-control')); ?>
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