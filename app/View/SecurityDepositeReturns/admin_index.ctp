<!-- <?php 
if(!empty($security_return))
 pr($security_return);
  // die();

 ?> -->
<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Security Deposite Returns'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('securityDepositeReturns','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Security Deposite Return'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">
				<table id="security_return" class="table table-bordered table-striped" rowspacing="0">
					<?php echo $this->Form->create('SecurityReturn', array('role' => 'form')); ?>
						<tr>
							<td>Projcect Name :</td>
							<td>
							
							<?php 
							$project_list = array('--Select--') + $contructor_project_name;
							echo $this->Form->input('contructor_project_name_id',array('label' =>false,'options' => $project_list, 'id' => 'contructor_project_name')); 
							?></td>
						</tr>

						<tr>
							<td>Contructor Type :</td>
							<td>
							
							<?php
							$contructor_list = array('--Select--') + $contructor_name;
						echo $this->Form->input('contructor_name_id',array('label' =>false,'options' => $contructor_list, 'id' => 'contructor_name'));  
							?></td>
						</tr>



						<script type="text/javascript">
							var base_url = "<?php echo BASE_URL; ?>";
		               $(document).ready(function(){
			               $('#contructor_name').change(function(){
								var contructor_project_name_id = $("#contructor_project_name option:selected").val();
				                var contructor_name_id = $("#contructor_name option:selected").val();
				                $.ajax({
				               		url: base_url+"admin/ContructorAdvancePayments/get_call",
				               		method:"POST",
				               		data:{
				               			
				               			contructor_project_name_id : contructor_project_name_id,
				               			contructor_name_id : contructor_name_id,
				               			
				               			},
		               
				               		dataType:"json",
				               		success:function(data){
				               			 console.log(data);
				               			for(i=0;i<data.length;i++){
				               				console.log(data[i]['WorkOrder']['work_order_no']);
				               				$("#work_order_no_1").append('<option>'+data[i]['WorkOrder']['work_order_no']+'</option>');
				               			};
				               			for(i=0;i<data.length;i++){
				               				console.log(data[i]['WorkOrder']['id']);
				               				$('#work_order_id').val(data[i]['WorkOrder']['id']);
				               			};
				               		}
	               				});

							});
               
               			});
						</script>
						<tr>
						<td>Work order No:</td>
							<td>
								
						<select id="work_order_no_1" name="work_order_no_1">
							<option value="-1">please select</option>
						</select>
							</td>
						</tr>

						<tr>
						<td></td>
						<td><input type="submit" name="search" value="search" class="btn btn-primary"></td>
						</tr>
					<?php echo $this->Form->end(); ?>
				</table>


<?php if(!empty($bill_payment_array) && !empty($work_order_array)): ?>
	 
 	<?php
 	$total_bill_paid = 0;
 	$total_advance_paid = 0;
 		
 		foreach ($advance_payment_array as $advance){
			$total_advance_paid +=  $advance['ContructorAdvancePayment']['advance_amount'];
		}

		foreach ($bill_payment_array as $bill){
			$total_bill_paid +=  $bill['ContructorBillPayment']['bill_amount'];
		}
		
		$project_value =$work_order_array[0]['ContructorProjectName']['project_value'];
		$total_paid = $total_bill_paid + $total_advance_paid;
		$total_due = $project_value - $total_paid;
		

	 ?>
	<table id="" class="table table-bordered table-striped" rowspacing="0">
		<tr>
			<td><b>Contructor Name:</b> <?php echo $work_order_array[0]['ContructorName']['name']; ?></td>
			<td><b>Project Value:</b><?php echo $project_value; ?></td>
		</tr>
		<tr>
			<td><b>Project Name: </b><?php echo $work_order_array[0]['ContructorProjectName']['name']; ?></td>

			<td><b>Total Paid: </b><?php echo $total_paid; ?></td>
		</tr>
		<tr>
			<td><b>Work Order No:</b><?php echo $bill_payment_array[0]['WorkOrder']['work_order_no']; ?></td>
			<td><b>Total due:</b><?php echo $total_due; ?></td>

		</tr>
		<tr>
			<td><b>Security Deposite:</b><?php echo $work_order_array[0]['ContructorProjectName']['security_money']; ?></td>
				<?php if(!empty($security_return)): ?>
				<?php 
				$total_return_amount = 0;
				foreach ($security_return as $return){
				$total_return_amount +=  $return['SecurityDepositeReturn']['security_return_amount'];
				}
				?>
				<td><b>Security Deposite Return:</b><?php echo $total_return_amount; ?></td>
			<?php endif; ?>
		</tr>
		
	
	</table>

<?php endif; ?>




			<?php if(!empty($security_return)): ?>
                <table id="SecurityDepositeReturns" class="table table-bordered table-striped">
					<thead>
						<tr>
							
							<th class="text-center">
							<?php echo $this->Paginator->sort('Return Amount'); ?>
							</th>
							<th class="text-center"><?php echo $this->Paginator->sort('payment_date'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('voucher_no'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('fiscal_year_id'); ?></th>
							
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($security_return as $return): ?>
											<tr>
						<td><?php echo $return['SecurityDepositeReturn']['security_return_amount']; ?></td>
						<td><?php echo $return['SecurityDepositeReturn']['payment_date']; ?></td>
						<td><?php echo $return['SecurityDepositeReturn']['voucher_no']; ?></td>
						<td><?php echo $return['FiscalYear']['name']; ?></td>
						 <td class="text-center">
							<?php if($this->App->menu_permission('securityDepositeReturns','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $return['SecurityDepositeReturn']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
							<?php if($this->App->menu_permission('securityDepositeReturns','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $return['SecurityDepositeReturn']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); } ?>
							<?php if($this->App->menu_permission('securityDepositeReturns','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $return['SecurityDepositeReturn']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $return['SecurityDepositeReturn']['id'])); } ?>
						</td> 
					</tr>
					<?php endforeach; ?>
					<tr>
						<td>
							<b>Total = </b><?php echo $total_return_amount; ?>
						</td>
					</tr>
					</tbody>
				</table>
				<?php endif; ?>	
				<div class='row'>
					<div class='col-xs-6'>
						<div id='Users_info' class='dataTables_info'>
						<?php	echo $this->Paginator->counter(array("format" => __("Page {:page} of {:pages}, showing {:current} records out of {:count} total"))); ?>	
						</div>
					</div>
					<div class='col-xs-6'>
						<div class='dataTables_paginate paging_bootstrap'>
							<ul class='pagination'>									
								<?php
									echo $this->Paginator->prev(__("prev"), array("tag" => "li"), null, array("tag" => "li","class" => "disabled","disabledTag" => "a"));
									echo $this->Paginator->numbers(array("separator" => "","currentTag" => "a", "currentClass" => "active","tag" => "li","first" => 1));
									echo $this->Paginator->next(__("next"), array("tag" => "li","currentClass" => "disabled"), null, array("tag" => "li","class" => "disabled","disabledTag" => "a"));
								?>								
							</ul>
						</div>
					</div>
				</div>	
						
			</div>			
		</div>
	</div>
</div>