<?php

/*pr($res);
pr($start_month);
pr($end_month);
pr($designation);*/


?>
<div class="box-body">	
<div id="print_me">
<?php if(!empty($res)): ?>	
<p class="text-center"> Khulna Development Authority KHULNA </p>
		<table class="table table-bordered table-striped" style="width: 50%;" align="center">
		<tr>
			<td>Employee Name</td>
			<td><?= $res[0]['Employee']['name']; ?></td>
			<td>Current Basic :</td>
			<td><?= $res[0]['EmployeeSalarySheet']['current_basic']; ?></td>
		</tr>

		<tr>
			<td>Designation :</td>
			<td><?= $designation[0]['Designation']['name']; ?></td>
			<td>Report start month :</td>
			<td><?= $start_month[0]; ?></td>
		</tr>

		<tr>
			<td>Joining  Date :</td>
			<td><?= $res[0]['Employee']['joining_date']; ?></td>
			<td>Report end month :</td>
			<td><?= $end_month[0]; ?></td>
		</tr>

       </table>

<p class="text-center"> Allowance : </p>

		<table class="table table-bordered table-striped" style="width: 50%;" align="center">
		<tr>
			<td>1</td>
			<td>Main Salary :</td>
			<td><?= $res[0][0]['current_basic_sum']; ?></td>
		</tr>

		<tr>
			<td>2</td>
			<td>House rent :</td>
			<td><?= $res[0][0]['house_rent']; ?></td>
		</tr>

		<tr>
			<td>3</td>
			<td>Eduaction :</td>
			<td><?= $res[0][0]['education']; ?></td>
		</tr>

		<tr>
			<td>4</td>
			<td>Medicle :</td>
			<td><?= $res[0][0]['medical']; ?></td>
		</tr>

		<tr>
			<td>5</td>
			<td>Tiffin :</td>
			<td><?= $res[0][0]['tiffin']; ?></td>
		</tr>

		<tr>
			<td>6</td>
			<td>Convence  :</td>
			<td><?= $res[0][0]['convance']; ?></td>
		</tr>

		<tr>
			<td>7</td>
			<td>Cycle  :</td>
			<td>
			<?php 
				echo $res[0][0]['convance'];
			?></td>
		</tr>

		<tr>
			<td>8</td>
			<td>Festivle Bonus  :</td>
			<td></td>
		</tr>

		<tr>
			<td>9</td>
			<td>Pohela Boishak :</td>
			<td></td>
		</tr>

		<tr>
			<td></td>
			<td>Total =</td>
			<td>
			<?php

				$sum = 0;
				$sum = $res[0][0]['current_basic_sum'] + $res[0][0]['house_rent'] + $res[0][0]['education'] + $res[0][0]['medical'] + $res[0][0]['tiffin'] + $res[0][0]['convance'];
				echo $sum;

			?></td>
		</tr>

		</table>

		<p  class="text-center"> Total <?= $sum; ?> Taka</p>

		<p class="text-center">Recovery :</p>

		<table class="table table-bordered table-striped" style="width: 50%;" align="center">

		<tr>
			<td>1</td>
			<td>GPF  Subscription :</td>
			<td><?= $res[0][0]['gpf']; ?></td>
		</tr>

		<tr>
			<td>2</td>
			<td>House building loan  :</td>
			<td><?= $res[0][0]['house_build_recovery']; ?></td>
		</tr>

		<tr>
			<td>3</td>
			<td>Computer loan :</td>
			<td><?= $res[0][0]['computer_loan']; ?></td>
		</tr>

		<tr>
			<td></td>
			<td>Total</td>
			<td>
				<?php

					$ttl = 0;

					$ttl = $res[0][0]['gpf'] + $res[0][0]['house_build_recovery'] + $res[0][0]['computer_loan'];
					echo $ttl;

				?>
			</td>
		</tr>


		</table>

		<p class="text-center">Total <?= $ttl; ?> Taka </p>
		<p class="text-center">Net Paid amount : <?php echo $sum-$ttl; ?> Taka </p>

		<p>
			Finance and Accounts Officer
			Khulna development authority
			Khulna -
			phone: 725151-3
		</p>

</div>
<p class="pull-right btn btn-primary" id="print" style="">Print</p>
<script type="text/javascript">
	$('#print').click(function(){
	     $("#print_me").print();
	});
</script>
<?php endif; ?>

</div>