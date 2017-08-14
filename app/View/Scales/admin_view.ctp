<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Scale'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Scale List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="Scales" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($scale['Scale']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Name'); ?></strong></td>
		<td>
			<?php echo h($scale['Scale']['name']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Employee Grade'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($scale['EmployeeGrade']['name'], array('controller' => 'employee_grades', 'action' => 'view', $scale['EmployeeGrade']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

