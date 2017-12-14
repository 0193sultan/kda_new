<?php

?>
<div class="box-body">

<h3 class="text-center">Contructor Ledgers</h3>
<!-- form start -->
<table id="contructor_ledgers" class="table table-bordered table-striped" rowspacing="0">
<?php echo $this->Form->create('ContructorLedgers', array('role' => 'form')); ?>
	<tr>
		<td>Projcect Name :</td>
		<?php 
		$project_list = array('--Select--') + $ContructorProjectName;
		 ?>
		<td><?php echo $this->Form->input('contructor_project_name_id',array('options' => $project_list, 'label' => false, 'class' =>'form-control','id'=>'contructor_project_name')); ?></td>
	</tr>
	<tr>
		<td>Contructor Type :</td>
		<?php 
		$contructor_list = array('--Select--') + $ContructorName;
		 ?>
		<td>
		<?php 
		echo $this->Form->input('contructor_name_id',array('options' => $contructor_list, 'label' => false, 'class' =>'form-control','id'=>'contructor_name')); 
		?>

		</td>
	</tr>
	<script type="text/javascript">
		               var base_url = "<?php echo BASE_URL; ?>";
		               $(document).ready(function(){
			               $('#contructor_name').change(function(){
			               	// alert('hello');
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
				               			for(i=0;i<data.length;i++){
				               				// console.log(data[i]['WorkOrder']['work_order_no']);
				               				$("#work_order_no_1").append('<option>'+data[i]['WorkOrder']['work_order_no']+'</option>');
				               			};

				               		}
	               				});

							});


			            });



		               
               
            </script>
	<tr>
		<td>Select</td>
		<td>

			<select id="work_order_no_1" name="work_order_no_1">
				<option value="-1">--Select--</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td>Start Date :</td>
		<td><?php echo $this->Form->input('start_date', array('label' => false,'class' => 'datepicker form-control')); ?></td>
	</tr>
	<tr>
		<td>End Date</td>
		<td><?php echo $this->Form->input('end_date', array('label' => false,'class' => 'datepicker form-control')); ?></</td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" name="search" value="search" class="btn btn-primary"></td>
	</tr>
<?php echo $this->Form->end(); ?>
</table>
<!-- form  end-->
		<div id="print">
		<h3 style="text-align:center">Contractor Ledgers</h3>
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
					
				</tr>
			
			</table>



		<table id="" class="table table-bordered table-striped" rowspacing="0">
			<tr>
				
				<th>Bill Amount</th>
				<th>Payment Type</th>
				<th>Payment Date</th>
				<th>Voucher NO</th>
				<th>Fiscal Year</th>
			</tr>
			<?php foreach ($bill_payment_array as $bill): ?>
				<tr>
					
					<td><?php echo $bill['ContructorBillPayment']['bill_amount'] ?></td>
					<td>Bill Pay</td>
					<td><?php echo $bill['ContructorBillPayment']['bill_pay_date'];  ?></td>
					<td><?php echo $bill['ContructorBillPayment']['voucher_no'];  ?></td>
					<td><?php echo $bill['FiscalYear']['name'];  ?></td>
					
				</tr>
			<?php endforeach; ?>

			<?php foreach ($advance_payment_array as $advance): ?>
				<tr>
					
					<td><?php echo $advance['ContructorAdvancePayment']['advance_amount'] ?></td>
					<td>Advance Payment</td>
					<td><?php echo $advance['ContructorAdvancePayment']['payment_date'];  ?></td>
					<td><?php echo $advance['ContructorAdvancePayment']['voucher_no'];  ?></td>
					<td><?php echo $advance['FiscalYears']['name'];  ?></td>
					
				</tr>
				
			<?php endforeach; ?>
				<tr>
					<td><b>Total=<b><?php echo $total_paid; ?></td>
				</tr>
		</table>

		<?php endif; ?> 
		</div>
		<button id="printbutton">Print</button>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$("#printbutton").click(function(){
			$('#print').print();
		});

	});
</script>