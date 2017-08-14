<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Monthly Attendance Entry'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Monthly Attendance Entry List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="MonthlyAttendanceEntries" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Employee'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($monthlyAttendanceEntry['Employee']['name'], array('controller' => 'employees', 'action' => 'view', $monthlyAttendanceEntry['Employee']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Official Attendence'); ?></strong></td>
		<td>
			<?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['official_attendence']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Casual Leave'); ?></strong></td>
		<td>
			<?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['casual_leave']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Sick Leave'); ?></strong></td>
		<td>
			<?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['sick_leave']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Earned Leave'); ?></strong></td>
		<td>
			<?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['earned_leave']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Maternity Leave'); ?></strong></td>
		<td>
			<?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['maternity_leave']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Total Attendance'); ?></strong></td>
		<td>
			<?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['total_attendance']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Panalty'); ?></strong></td>
		<td>
			<?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['panalty']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Datetime'); ?></strong></td>
		<td>
			<?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['datetime']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

