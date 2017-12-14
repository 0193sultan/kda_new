<?php
 
 $obj = new EmployeeBonusesController();

?>

<div class='box-body'>

	<div id="print_me">

	<table class="table table-bordered table-striped" style="width: 50%;"  align="center">

	<tr>
		<td>Bonus Name:</td>
		<td>
			<?php

				$comment = $obj->get_config_meta_comment($bonus[0]['EmployeeBonus']['festival_tracking_config_meta_id']);
				echo $comment[0]['ConfigMeta']['comment'];

			?>
		</td>
	</tr>

	<tr>
		
		<td>Fiscal Year</td>
		<td><?=$bonus[0]['FiscalYear']['name']; ?></td>
	</tr>
	<tr>
		<td>Month</td>
		<td><?=$bonus[0]['Month']['name']; ?></td>
	</tr>
	<tr>
		<td>Date</td>
		<td><?=$bonus[0]['EmployeeBonus']['created_at']; ?></td>
	</tr>

	</table>

	<table class="table table-bordered table-striped"  align="center">

	<thead>
		<tr>
			<th>Employee Name</th>
			<th>Department name</th>
			<th>Designation</th>
			<th>Current Basic</th>
			<th>Bonus Amount</th>
			<th>Present Address</th>
		</tr>
	</thead>

	<tbody>

	<?php foreach ($bonus as $v): ?>

		<tr>
			<td><?=$v['Employee']['name']; ?></td>
			<td><?=!empty($v['Employee']['Department']['name'])?$v['Employee']['Department']['name']:''; ?></td>
			<td><?=!empty($v['Employee']['Designation']['name'])?$v['Employee']['Designation']['name']:''; ?></td>
			<td><?=$v['EmployeeBonus']['current_basic']; ?></td>
			<td><?=$v['EmployeeBonus']['bonus_amount']; ?></td>
			<td><?=$v['Employee']['name']; ?></td>
		</tr>

	<?php endforeach; ?>

	</tbody>

	</table>

</div>

<p class="pull-right btn btn-primary" id="print" style="">Print</p>
<script type="text/javascript">
	$('#print').click(function(){
	     $("#print_me").print();
	});
</script>

</div>