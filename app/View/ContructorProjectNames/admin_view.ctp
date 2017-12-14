<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Contructor Project Name'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Contructor Project Name List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="ContructorProjectNames" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($contructorProjectName['ContructorProjectName']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Name'); ?></strong></td>
		<td>
			<?php echo h($contructorProjectName['ContructorProjectName']['name']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Project Type'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($contructorProjectName['ProjectType']['name'], array('controller' => 'project_types', 'action' => 'view', $contructorProjectName['ProjectType']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Project Head Name'); ?></strong></td>
		<td>
			<?php echo h($contructorProjectName['ContructorProjectName']['project_head_name']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Location'); ?></strong></td>
		<td>
			<?php echo h($contructorProjectName['ContructorProjectName']['location']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Projcet Value'); ?></strong></td>
		<td>
			<?php echo h($contructorProjectName['ContructorProjectName']['project_value']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Schedule Money'); ?></strong></td>
		<td>
			<?php echo h($contructorProjectName['ContructorProjectName']['schedule_money']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Schedule Money %'); ?></strong></td>
		<td>
			<?php echo h($contructorProjectName['ContructorProjectName']['schedule_money_%']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Security Money'); ?></strong></td>
		<td>
			<?php echo h($contructorProjectName['ContructorProjectName']['security_money']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Security Money %'); ?></strong></td>
		<td>
			<?php echo h($contructorProjectName['ContructorProjectName']['security_money_%']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Project Start Date'); ?></strong></td>
		<td>
			<?php echo h($contructorProjectName['ContructorProjectName']['project_start_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Projcet Details'); ?></strong></td>
		<td>
			<?php echo h($contructorProjectName['ContructorProjectName']['projcet_details']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('User'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($contructorProjectName['User']['name'], array('controller' => 'users', 'action' => 'view', $contructorProjectName['User']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created At'); ?></strong></td>
		<td>
			<?php echo h($contructorProjectName['ContructorProjectName']['created_at']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Updated At'); ?></strong></td>
		<td>
			<?php echo h($contructorProjectName['ContructorProjectName']['updated_at']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

