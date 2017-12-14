<?php

	/*pr($departments);
	pr($Designations);
	pr($FiscalYears);
	pr($Employees); */
	/*pr($sal);
	exit();*/

	$obj = new EmployeeTaxesController();
	

/*	pr($sal); exit();*/

	/*pr($tax_amount); exit();*/


?>

<style type="text/css">
	.select_width
	{
		width : 100px;
	}
</style>

<div class="box-body">
	<table id="tax-search" class="table table-bordered table-striped" style="width: 50%;" align="center">
	<?php 
	echo $this->Form->create(false, array(
		'url' => array('controller' => 'EmployeeTaxes', 'action' => 'admin_index'),
		'id' => 'admin_index'
		));
		?>
		<tr>
			<td>Department Name</td>
			<td>Designation</td>
			<td>Employee Name</td>
			<td colspan="2">Fisal Year</td>
		</tr>

		<tr>
			<td>
					<?php 
						$department = array('All') + $departments;
						echo $this->Form->input('department_id', array(
						     'options' => $department,
						    'class' => 'form-control select_width',
						    'label' => false
						));
					 ?>
			</td>
			<td>
					<?php 
						$Designation = array('All') + $Designations;
						echo $this->Form->input('designation_id', array(
						     'options' => $Designation,
						    'class' => 'form-control select_width',
						    'label' => false
						));
					 ?>
			</td>

			<td>
					<select class="form-control select_width" id="name" name="name">
					<?php 

						$Employee = array('All') + $Employees; 

						foreach ($Employee as $key => $value) 
						{
							echo "<option value= ".$key.">".$value."</option>";
						}

					?>
					
					</select>
			</td>
			<td>
				<?php 
					echo $this->Form->input('fiscal_year_id', array(
					     'options' => $FiscalYears,
					    'class' => 'form-control select_width',
					    'label' => false
					));
				 ?>
			</td>
			<td>
				<input type="submit" name="Search" value="Search" class="btn-primary">
			</td>
		</tr>
		<?php echo $this->Form->end(); ?>
	</table>

	<!-- js code for onclick -->

	<script type="text/javascript">
	    var base_url = "<?php echo BASE_URL; ?>";
		$(document).ready(function(){
			$('#designation_id').change(function(){
				var department_name = $("#department_id option:selected").val();
				var designation = $("#designation_id option:selected").val();

				if(department_name != 0 || designation !=0)
				 	$.ajax({
				 		url: base_url+"EmployeeTaxes/get_call",
				 		method:"POST",
				 		data:{
				 			
				 			department_name : department_name,
				 			designation : designation
				 				
				 			},

				 		dataType:"text",
				 		success:function(data){
				 			$('#name').html(data);
				 			//$('#a').html(data);
				 		}
				 	});

			});

		});

	</script>

	<p id="a"></p>

	<?php if(!empty($sal)): ?>

	<div id="print_me">

	<p>KDA Employee Tax List Fiscal Year <?= $sal[0]['FiscalYear']['name']; ?></p>

	<table id="tax-list" class="table table-bordered table-striped" align="center">
 
	<thead>
	<tr>
		<th>Employee Name</th>
		<th>Code</th>
		<th>Designation</th>
		<th>Grade</th>
		<th>Basic</th>
		<th>Joinig Date</th>
		<th>Department</th>
		<th>Total tax</th>
		<th>Action</th>
	</tr>
	</thead>

	<tbody>
	<?php foreach ($sal as $v): ?>
	<tr>
		
		<td><?= $v['Employee']['name']; ?></td>
		<td><?= $v['Employee']['employeeID']; ?></td>
		<td><?= $v['Employee']['Designation']['name']; ?></td>
		<td><?= $v['Employee']['EmployeeGrade']['name']; ?></td>
		<td><?= $v['Employee']['Basic']['name']; ?></td>
		<td><?= $v['Employee']['joining_date']; ?></td>
		<td><?= $v['Employee']['Department']['name']; ?></td>
		<td>
			<?php

				$ttl_tax = $obj->get_ttl_tax($v['Employee']['id'], $v['FiscalYear']['id']);
				echo $ttl_tax[0][0]['emp_tax'];

			?>
		</td>
		<td class="text-center">
			<a href="<?php echo BASE_URL."admin/EmployeeTaxes/emp_tax_details/".$v['Employee']['id']."/".$v['FiscalYear']['id']; ?>"><span class="btn btn-primary">Details</span></a>
		</td>
	</tr>

	<?php endforeach; ?> 

	</tbody>

	</table>
	<p class="col-md-2 pull-right">
		
		<?= "Total = ".$tax_amount[0][0]['emp_tax']; ?>
		
	</p>

	</div>

	<?php endif; ?>

	<p class="col-md-offset-11 pull-right btn btn-primary" id="print">Print</p>
	<script type="text/javascript">
		$('#print').click(function(){
		     $("#print_me").print();
		});
	</script>

</div>