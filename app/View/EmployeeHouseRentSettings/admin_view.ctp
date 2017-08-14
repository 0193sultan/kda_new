<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Employee House Rent Setting'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Employee House Rent Setting List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="EmployeeHouseRentSettings" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Gazette Year'); ?></strong></td>
		<td>
			<?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['gazette_year']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Min Basic'); ?></strong></td>
		<td>
			<?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['min_basic']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Max Basic'); ?></strong></td>
		<td>
			<?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['max_basic']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Location'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($employeeHouseRentSetting['Location']['name'], array('controller' => 'locations', 'action' => 'view', $employeeHouseRentSetting['Location']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('House Rent Percent'); ?></strong></td>
		<td>
			<?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['house_rent_percent']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('House Rent Min'); ?></strong></td>
		<td>
			<?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['house_rent_min']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created Date'); ?></strong></td>
		<td>
			<?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['created_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Update Date'); ?></strong></td>
		<td>
			<?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['update_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('User'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($employeeHouseRentSetting['User']['name'], array('controller' => 'users', 'action' => 'view', $employeeHouseRentSetting['User']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Status'); ?></strong></td>
		<td>
			<?php echo h($employeeHouseRentSetting['EmployeeHouseRentSetting']['status']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

