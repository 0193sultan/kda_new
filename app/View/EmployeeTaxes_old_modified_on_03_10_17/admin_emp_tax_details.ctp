<?php

/*	pr($details);
	exit();*/

?>
<div class="box-body">

	<div id="print_me">

	<?php if(!empty($details)): ?>
	<p style="text-align: center;">Employee tax Details of Fiscal Year <?= $details[0]['FiscalYear']['name']; ?></p>
	<table id="tax-search" class="table table-bordered table-striped" style="width: 50%;" align="center">
	<thead>
		
		<tr>
			<th>Name</th>
			<th>Designation</th>
			<th>Join date</th>
		</tr>


	</thead>

	<tbody>

		<tr>
			<td><?= $details[0]['Employee']['name']; ?></td>
			<td><?= $details[0]['Employee']['Designation']['name']; ?></td>
			<td><?= $details[0]['Employee']['joining_date']; ?></td>
		</tr>
		
	</tbody>


	</table>

	<table id="tax-search" class="table table-bordered table-striped" style="width: 50%;" align="center">
	<thead>
		
		<tr>
			<th>Month Name</th>
			<th>Department</th>
			<th>Tax Recovery</th>
		</tr>


	</thead>

	<tbody>

		<?php  foreach ($details as  $v): ?>

		<tr>
			<td><?= $v['Month']['name']; ?></td>
			<td><?= $v['Employee']['Department']['name']; ?></td>
			<td><?= $v['EmployeeSalarySheet']['emp_tax']; ?></td>
		</tr>

		<?php endforeach; ?>
		<tr>
			<td colspan="3">
				<p class="col-md-5 pull-right">
					
					<?= "Total = ".$ttl_tax[0][0]['emp_tax']; ?>
					
				</p>
			</td>
		</tr>
		
	</tbody>


	</table>

    <?php endif; ?>

    </div>

    <p class="col-md-offset-9 btn btn-primary" id="print" style="">Print</p>
    <script type="text/javascript">
    	$('#print').click(function(){
    	     $("#print_me").print();
    	});
    </script>

</div>