<?php

$total = 0;

foreach ($salarySheets as $v) 
{
	foreach ($v as $va) 
	{
		foreach ($va as  $value)
		 {
			$total += $value;
		}
	}
}


?>

<div class="box-body">
	<!-- search Start -->

	<?php 
	echo $this->Form->create(false, array(
		'url' => array('controller' => 'SallarySummarySheets', 'action' => 'admin_index'),
		'id' => 'admin_index'
		));
		?>

		<table class="table table-bordered" style="width: 40%;" align="center">
			<tr>
				<td>Fiscal year</td>
				<td>
					<select name="fiscal_year_id" id="fiscal_year_id" style="width: 110px" required>
						<?php
						//echo "<option value=0>All</option>";
						foreach ($fiscalyears as $key => $value) 
						{
							echo "<option value=$key>$value</option>";
						}					

						?>			 		
					</select>
				</td>
			</tr>

			<tr>
				<td>Start Month</td>
				<td>
					<select name="month_id_start" id="month_id_start" style="width: 110px" required>
						<?php
						//echo "<option value=0>All</option>";
						foreach ($months as $key => $value) 
						{
							echo "<option value=$key>$value</option>";
						}					

						?>			 		
					</select>
				</td>
			</tr>

			<tr>
				<td>End Month</td>
				<td>
					<select name="month_id_end" id="month_id_end" style="width: 110px" required>
						<?php
						//echo "<option value=0>All</option>";
						foreach ($months as $key => $value) 
						{
							echo "<option value=$key>$value</option>";
						}					

						?>			 		
					</select>
				</td>
			</tr>

			<tr>
				<td></td>
				<td>
					<input type="submit" name="btn" id="btn" value="search" class="btn btn-primary"></td>
				</tr>
			</table>

			<?php echo $this->Form->end(); ?>

		</div>
<!-- Search End -->
<?php if(!empty($fYear)) { ?>
<div id="print_me">

	<h3 class="text-success text-center"> Showing result Between <?=$month_start[0]['Month']['name']; ?>  to  <?=$month_end[0]['Month']['name']; ?> of Fiscal year <?=$fYear[0]['FiscalYear']['name']; ?> </h3>

 <table id="" class="table table-bordered table-striped">

 	<tr>
 		<td>Basic</td>
 		<td><?=$salarySheets[0][0]['basic_salary']; ?></td>
 		<td>GPF Subscription</td>
 		<td><?=$salarySheets[0][0]['gpf']; ?></td>
 	</tr>

 	<tr>
 		<td>P.P</td>
 		<td><?=$salarySheets[0][0]['pp']; ?></td>
 		<td>Medical</td>
 		<td><?=$salarySheets[0][0]['medical']; ?></td>
 	</tr>

 	<tr>
 		<td>HRent</td>
 		<td><?=$salarySheets[0][0]['house_rent']; ?></td>
 		<td>House recovery</td>
 		<td><?=$salarySheets[0][0]['house_loan_recovery']; ?></td>
 	</tr>

 	<tr>
 		<td>Tiffin</td>
 		<td><?=$salarySheets[0][0]['tiffin']; ?></td>
 		<td>Vehicle</td>
 		<td><?=$salarySheets[0][0]['vechcale_recovery']; ?></td>
 	</tr>

 	<tr>
 		<td>Education</td>
 		<td><?=$salarySheets[0][0]['education']; ?></td>
 		<td>Telephone</td>
 		<td><?=$salarySheets[0][0]['telephone_allowance']; ?></td>
 	</tr>

 	<tr>
 		<td>Charges</td>
 		<td><?=$salarySheets[0][0]['charge']; ?></td>
 		<td>Bycycle Loan</td>
 		<td><?=$salarySheets[0][0]['bicycle_loan']; ?></td>
 	</tr>

 	<tr>
 		<td>Convence</td>
 		<td><?=$salarySheets[0][0]['convance']; ?></td>
 		<td>Motor cycle Adv</td>
 		<td><?=$salarySheets[0][0]['bicycle_loan']; ?></td>
 	</tr>

 	<tr>
 		<td>Washing</td>
 		<td><?=$salarySheets[0][0]['wash']; ?></td>
 		<td>House building Adv</td>
 		<td><?=$salarySheets[0][0]['house_build_recovery']; ?></td>
 	</tr>

 	<tr>
 		<td>Mobile</td>
 		<td><?=$salarySheets[0][0]['mobile']; ?></td>
 		<td>House repair Adv</td>
 		<td><?=$salarySheets[0][0]['house_repair_reovery']; ?></td>
 	</tr>

 	<tr>
 		<td>D.A</td>
 		<td><?=$salarySheets[0][0]['da']; ?></td>
 		<td>Computer loan</td>
 		<td><?=$salarySheets[0][0]['computer_loan']; ?></td>
 	</tr>

 	<tr>
 		<td>Others</td>
 		<td><?=$salarySheets[0][0]['other']; ?></td>
 		<td>Motor car loan</td>
 		<td><?=$salarySheets[0][0]['car_loan']; ?></td>
 	</tr>

 	<tr>
 		<td>New Basic Salary</td>
 		<td><?=$salarySheets[0][0]['new_basic_salary']; ?></td>
 		<td>Electricity</td>
 		<td><?=$salarySheets[0][0]['electricity_recovery']; ?></td>
 	</tr>

 	<tr>
 		<td>Gross Pay</td>
 		<td><?=$salarySheets[0][0]['gross_pay']; ?></td>
 		<td>Water supply</td>
 		<td><?=$salarySheets[0][0]['water_supply_recovery']; ?></td>
 	</tr>

 	<tr>
 		<td>Total Payable</td>
 		<td><?=$salarySheets[0][0]['total_payable']; ?></td>
 		<td>Fix House rent</td>
 		<td><?=$salarySheets[0][0]['fixed_house_rent_recovery']; ?></td>
 	</tr>

 	<tr>
 		<td></td>
 		<td></td>
 		<td>Group Insurance</td>
 		<td><?=$salarySheets[0][0]['group_insurance']; ?></td>
 	</tr>

 	<tr>
 		<td></td>
 		<td></td>
 		<td>BF</td>
 		<td><?=$salarySheets[0][0]['bf_recovery']; ?></td>
 	</tr>

 	<tr>
 		<td></td>
 		<td></td>
 		<td>Tin Shed</td>
 		<td><?=$salarySheets[0][0]['tin_shade_recovery']; ?></td>
 	</tr>

 	<tr>
 		<td></td>
 		<td></td>
 		<td>GI Recovery</td>
 		<td><?=$salarySheets[0][0]['gi_recovery']; ?></td>
 	</tr>

 	<tr>
 		<td></td>
 		<td></td>
 		<td>Health Insurance</td>
 		<td><?=$salarySheets[0][0]['health_insurance']; ?></td>
 	</tr>

 	<tr>
 		<td></td>
 		<td></td>
 		<td>Extra Loan</td>
 		<td><?=$salarySheets[0][0]['extra_loan']; ?></td>
 	</tr>


 	<tr>
 		<td></td>
 		<td>Grand Total =</td>
 		<td><?=$total; ?></td>
 		<td></td>
 	</tr>

</table>

</div>

<p class="pull-right btn btn-primary" id="print">Print</p>
<script type="text/javascript">
	$('#print').click(function(){
	     $("#print_me").print();
	});
</script>

<?php } ?>