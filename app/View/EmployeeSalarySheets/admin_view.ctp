<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Employee Salary Sheet'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Employee Salary Sheet List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="EmployeeSalarySheets" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Employee Id'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['employee_id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Basic Salary'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['basic_salary']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('New Basic Salary'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['new_basic_salary']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Da'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['da']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Pp'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['pp']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Medical'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['medical']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Convance'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['convance']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Wash'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['wash']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Mobile'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['mobile']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Charge'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['charge']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Other'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['other']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Gross Pay'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['gross_pay']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Gpf'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['gpf']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Group Insurance'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['group_insurance']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('House Rent'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['house_rent']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('House Loan Recovery'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['house_loan_recovery']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Vechcale Recovery'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['vechcale_recovery']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Telephone Allowance'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['telephone_allowance']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Tiffin'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['tiffin']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Motorcycle Loan'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['motorcycle_loan']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('House Build Recovery'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['house_build_recovery']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('House Repair Reovery'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['house_repair_reovery']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Bicycle Loan'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['bicycle_loan']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Computer Loan'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['computer_loan']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Car Loan'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['car_loan']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Extra Loan'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['extra_loan']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Education'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['education']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Fixed House Rent Recovery'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['fixed_house_rent_recovery']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Health Insurance'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['health_insurance']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Water Supply Recovery'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['water_supply_recovery']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Electricity Recovery'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['electricity_recovery']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Bf Recovery'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['bf_recovery']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Gi Recovery'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['gi_recovery']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Tin Shade Recovery'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['tin_shade_recovery']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Salary Type Id'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['salary_type_id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Status'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['status']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Total Payable'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['total_payable']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Fiscal Year Id'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['fiscal_year_id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Month Id'); ?></strong></td>
		<td>
			<?php echo h($employeeSalarySheet['EmployeeSalarySheet']['month_id']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

