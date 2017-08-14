<div class="row">
    <div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Edit User'); ?></h3>
				<div class="box-tools pull-right">
					<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> User List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>
			<div class="box-body">		
			<?php echo $this->Form->create('User'); ?>
				<?php echo $this->Form->input("id" ,array('type' => 'hidden', 'label' => false,'div' => false))?>
				<?php echo $this->Form->input('sales_person_id', array('type'=>'hidden')); ?>
				<div class="form-group">
					<?php echo $this->Form->input("User.user_group_id" ,array('class' => 'form-control','empty'=>'---- Select Group ----')); ?>
				</div>
				<div class="form-group">
					<?php echo $this->Form->input('username', array('class' => 'form-control username')); ?>
					<div style="margin-top:-15px;padding-left:10px;" id="mgs"></div>
				</div>
				<div class="form-group">
					<?php echo $this->Form->input('password', array('class' => 'form-control','type' => 'password')); ?>
				</div>
				<div class="form-group">
					<label for="UserPassword">Confirm Password :</label>
					<?php echo $this->Form->input('cpassword', array('class' => 'form-control','type'=>'password','label'=>false)); ?>
				</div>
				<div class="form-group">
					<?php echo $this->Form->input('SalesPerson.name', array('class' => 'form-control')); ?>
				</div>
				<div class="form-group">
					<?php echo $this->Form->input('SalesPerson.designation_id', array('class' => 'form-control','empty'=>'---- Select ----')); ?>
				</div>
				<div class="form-group">
					<?php echo $this->Form->input('SalesPerson.office_id', array('class' => 'form-control','empty'=>'---- Select ----','id'=>'office_id')); ?>
				</div>
				<div class="form-group">
					<label for="UserActive">Is Active :</label>
					<?php echo $this->Form->input('active', array('class' => 'form-control','type'=>'checkbox','label'=>false)); ?>
				</div>
				<?php echo $this->Form->submit('Update User', array('class' => 'btn btn-large btn-primary')); ?>
			<?php echo $this->Form->end(); ?>
		</div>			
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){    
	$(".username").keyup(function(){  
		var user_id = '<?php echo $this->request->data['User']['id'];?>';
		var username = $(this).val();   
		if(username.length > 3)
		{  
			$("#mgs").html(' Checking...');   
			$.ajax({    
			type : 'POST',
			url  : '<?php echo BASE_URL;?>admin/duplicate_user_check',
			data : 'user_id='+user_id+'&username='+username,
			success : function(data){
					$("#mgs").html(data);
				}
			});
			return false;   
		}
		else
		{
			$("#mgs").html('');
		}
	});
		
	$(".code").keyup(function(){  
		var id = '<?php echo $this->request->data['User']['sales_person_id'];?>';		
		var code = $(this).val();   
		if(code.length > 2)
		{  
			$("#codemgs").html(' Checking...');   
			$.ajax({    
			type : 'POST',
			url  : '<?php echo BASE_URL;?>admin/duplicate_usercode_check',
			data : 'id='+id+'&code='+code,
			success : function(data){
					$("#codemgs").html(data);
				}
			});
			return false;   
		}
		else
		{
			$("#codemgs").html('');
		}
	}); 	
});
</script>
