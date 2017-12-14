<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Contructor Project Names'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('contructorProjectNames','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Contructor Project Name'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">
                <table id="ContructorProjectNames" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('name'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('project_type_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('project_head_name'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('location'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('project_value'); ?></th>
							<!-- <th class="text-center"><?php echo $this->Paginator->sort('schedule_money'); ?></th> -->
							<th class="text-center"><?php echo $this->Paginator->sort('schedule_money_%'); ?></th>
							<!-- <th class="text-center"><?php echo $this->Paginator->sort('security_money'); ?></th> -->
							<th class="text-center"><?php echo $this->Paginator->sort('security_money_%'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('project_start_date'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('projcet_details'); ?></th>
							<!-- <th class="text-center"><?php echo $this->Paginator->sort('user_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('created_at'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('updated_at'); ?></th> -->
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($contructorProjectNames as $contructorProjectName): ?>
					<tr>
						<td class="text-center"><?php echo h($contructorProjectName['ContructorProjectName']['id']); ?></td>
						<td class="text-center"><?php echo h($contructorProjectName['ContructorProjectName']['name']); ?></td>
						<td class="text-center">
			<?php echo $this->Html->link($contructorProjectName['ProjectType']['name'], array('controller' => 'project_types', 'action' => 'view', $contructorProjectName['ProjectType']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($contructorProjectName['ContructorProjectName']['project_head_name']); ?></td>
						<td class="text-center"><?php echo h($contructorProjectName['ContructorProjectName']['location']); ?></td>
						<td class="text-center"><?php echo h($contructorProjectName['ContructorProjectName']['project_value']); ?></td>
						<!-- <td class="text-center"><?php echo h($contructorProjectName['ContructorProjectName']['schedule_money']); ?></td> -->
						<td class="text-center"><?php echo h($contructorProjectName['ContructorProjectName']['schedule_money_%']); ?></td>
						<!-- <td class="text-center"><?php echo h($contructorProjectName['ContructorProjectName']['security_money']); ?></td> -->
						<td class="text-center"><?php echo h($contructorProjectName['ContructorProjectName']['security_money_%']); ?></td>
						<td class="text-center"><?php echo h($contructorProjectName['ContructorProjectName']['project_start_date']); ?></td>
						<td class="text-center"><?php echo h($contructorProjectName['ContructorProjectName']['projcet_details']); ?></td>
						<!-- <td class="text-center">
							<?php echo $this->Html->link($contructorProjectName['User']['name'], array('controller' => 'users', 'action' => 'view', $contructorProjectName['User']['id'])); ?>
						</td>
						<td class="text-center"><?php echo h($contructorProjectName['ContructorProjectName']['created_at']); ?></td>
						<td class="text-center"><?php echo h($contructorProjectName['ContructorProjectName']['updated_at']); ?></td> -->
						<td class="text-center">
							<?php if($this->App->menu_permission('contructorProjectNames','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $contructorProjectName['ContructorProjectName']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
							<?php if($this->App->menu_permission('contructorProjectNames','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $contructorProjectName['ContructorProjectName']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); } ?>
							<?php if($this->App->menu_permission('contructorProjectNames','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $contructorProjectName['ContructorProjectName']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $contructorProjectName['ContructorProjectName']['id'])); } ?>
						</td>
					</tr>
					<?php endforeach; ?>
					</tbody>
				</table>
				<div class='row'>
					<div class='col-xs-6'>
						<div id='Users_info' class='dataTables_info'>
						<?php	echo $this->Paginator->counter(array("format" => __("Page {:page} of {:pages}, showing {:current} records out of {:count} total"))); ?>	
						</div>
					</div>
					<div class='col-xs-6'>
						<div class='dataTables_paginate paging_bootstrap'>
							<ul class='pagination'>									
								<?php
									echo $this->Paginator->prev(__("prev"), array("tag" => "li"), null, array("tag" => "li","class" => "disabled","disabledTag" => "a"));
									echo $this->Paginator->numbers(array("separator" => "","currentTag" => "a", "currentClass" => "active","tag" => "li","first" => 1));
									echo $this->Paginator->next(__("next"), array("tag" => "li","currentClass" => "disabled"), null, array("tag" => "li","class" => "disabled","disabledTag" => "a"));
								?>								
							</ul>
						</div>
					</div>
				</div>				
			</div>			
		</div>
	</div>
</div>