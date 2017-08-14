<?php

/*	pr($Department);
	pr($Loan); */
	//pr($res);
	//exit();

	//echo "Department id from session... ".$_SESSION['department'];
	//exit();

?>
<div class="box-body">		

		<table class="table table-bordered table-striped" style="width: 50%;" align="center">

		<?php 
		   echo $this->Form->create(false, array(
			'url' => array('controller' => 'InstallmentReleases', 'action' => 'admin_index')
			));
		?>

		<tr>
			<td>Department Name</td>
			<td>
				<?php
					$department = array(0 => 'All') + $Department;
					echo $this->Form->input('department_id', array('options'=> $department, 'label' => false, 'class' => array('form-control'),'style' =>array('width: 100px')));
				?>
			</td>
			<td>Loan Name</td>
			<td>
				<?php
					echo $this->Form->input('loan_id', array('options'=> $Loan, 'label' => false, 'class' => array('form-control'),'style' =>array('width: 100px')));
				?>
			</td>
			<td>
			 	<input type="submit" name="btn" value="Search" class="btn btn-primary">
			 </td>
		</tr>

	 <?php echo $this->Form->end(); ?>

		</table>

		<div id="print_me">

		<?php if(!empty($res)): ?>

			<table class="table table-bordered table-striped" align="center" style="width: 50%;">
				<tr>
					<td>Department : </td>
					<td>
						<?php
							if(isset($_SESSION['department']))
							{
								echo "ALL";
								unset($_SESSION['department']);
							}
							else
							{
								echo $res[0]['Employee']['Department']['name'];
							}
						?>
					</td>
					<td>Loan Name : </td>
					<td>
						<?php
							echo $res[0]['Loan']['name'];
						?>
					</td>
				</tr>

			</table>


			<table class="table table-bordered table-striped" align="center">
				<thead>
					<tr>

						<th>Employee Name<br/> [Designation]</th>
						<th>Loan Name</th>
						<th>Loan Type</th>
						<th>Loan Approved Date</th>
						<th>Current Due</th>
						<th>Status</th>
						<th>Action </th>

					</tr>
				</thead>

				<tbody>
				<?php foreach ($res as $v): ?>
					<tr>
						<td><?php echo $v['Employee']['name']."<br/> [".$v['Employee']['Designation']['name']."]"; ?></td>
						<td><?= $v['Loan']['name']; ?></td>
						<td><?= $v['LoanType']['name']; ?></td>
						<td><?= $v['EmployeeLoan']['loan_approved_date']; ?></td>
						<td><?= $v['EmployeeLoan']['current_due']; ?></td>
						<td>
							<?php

								if($v['EmployeeLoan']['status'] == 0)
								{
									echo "Active";
								}
								else if($v['EmployeeLoan']['status'] == 1)
								{
									echo "Inactive";
								}

							?>
						</td>
						<td class="text-center">
							<a href="<?php echo BASE_URL."admin/InstallmentReleases/installment_release/".$v['EmployeeLoan']['id']; ?>"><span class="glyphicon glyphicon-edit" style="font-size: 30px;"></span></a>

						</td>
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
<?php endif; ?>
</div>