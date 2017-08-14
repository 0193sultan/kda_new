<?php

//pr($info); exit();

?>
<style type="text/css">
	.in-width
	{
		width: 120px;
	}
</style>
<div class="box-body">	

		
		<p class="text-center">Loan  Intallment Release:</p>	

		<table class="table table-bordered table-striped" style="width: 50%;" align="center">

		<?php 
		   echo $this->Form->create(false, array(
			'url' => array('controller' => 'InstallmentReleases', 'action' => 'admin_installment_release')
			));
		?>

			<tr>
				<td class="text-right">Loan name :</td>
				<td><?= $info[0]['Loan']['name']; ?></td>
			</tr>

			<tr>
				<td class="text-right">Loan reciver name :</td>
				<td><?= $info[0]['Employee']['name']." [".$info[0]['Employee']['employeeID']."]"; ?></td>
			</tr>

			<tr>
				<td class="text-right">Loan Amount :</td>
				<td><?= $info[0]['EmployeeLoan']['loan_amount']." TK"; ?></td>
			</tr>

			<tr>
				<td class="text-right">Installment realease  NO</td>
				<td>
					<?php
						echo $this->Form->input('installment_release_no', array('options' => array('2' => 'Release no 2', '3' => 'Release no 3'), 'label' => false, 'required' => true, 'class' => array('form-control in-width')));
					?>
				</td>
			</tr>

			<tr>
				<td class="text-right">Installment Amount :</td>
				<td>
					<?php
						echo $this->Form->input('installment_amount', array('type' => 'number', 'label' => false, 'required' => true, 'class' => array('in-width')))
					?>
				</td>
			</tr>

			<tr>
				<td class="text-right">Installment  Date </td>
				<td>
					<?php
						echo $this->Form->input('installment_date', array('type' => 'text', 'required' => true, 'class' => array('form-control datepicker in-width'),'label' => false));
					?>
				</td>
			</tr>

			<tr>
				<td></td>
				<td>
					<input type="hidden" name="id" value="<?= $info[0]['EmployeeLoan']['id']; ?>">
					<input type="submit" name="save" value="save" class="btn btn-primary">
				</td>
			</tr>

		<?php echo $this->Form->end(); ?>

		</table>
</div>