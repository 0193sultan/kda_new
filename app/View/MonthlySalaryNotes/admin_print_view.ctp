<div id="print_me">
<h3 style="text-align: center;">Monthly Salary Note</h3>
	<table class="table table-bordered text-success text-center" style="width: 40%;" align="center">
		<tr>
			<td>Bank Name</td>
			<td> <?=$save_data_ready_for_print[0]['BankInfo']['name']; ?></td>
		</tr>

		<tr>
			<td>Fiscal Year</td>
			<td><?=$save_data_ready_for_print[0]['FiscalYear']['name']; ?></td>
		</tr>

		<tr>
			<td>Month</td>
			<td><?=$save_data_ready_for_print[0]['Month']['name']; ?></td>
		</tr>

	</table>

	<table id="" class="table table-bordered table-striped">
		<thead>
			<tr>
				<th>Employee Name</th>
				<th>Code</th>
				<th>Designation</th>
				<th>Account No</th>
				<th>Net Pay</th>
			</tr>
		</thead>

		<tbody>
			<?php if(!empty($save_data_ready_for_print)) foreach ($save_data_ready_for_print as $v): ?>
				<tr>
					<td><?=$v['MonthlySalaryNote']['emp_name']; ?></td>
					<td><?=$v['MonthlySalaryNote']['emp_id']; ?> </td>
					<td><?=$v['MonthlySalaryNote']['designation']; ?> </td>
					<td><?=$v['MonthlySalaryNote']['account_no']; ?> </td>
					<td><?=$v['MonthlySalaryNote']['net_pay']; ?> </td>

				</tr>	
			<?php endforeach; ?>
		</tbody>

	</table>

</div>
<p class="pull-right btn btn-primary" id="print">Print</p>
<script type="text/javascript">
	$('#print').click(function(){
		$("#print_me").print();
	});
</script>