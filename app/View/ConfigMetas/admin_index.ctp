<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Config Metas'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('configMetas','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Config Meta'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">
                <table id="ConfigMetas" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('trackingId'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('key'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('value'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('comment'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('create_date'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('update_date'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('user_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('status'); ?></th>
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($configMetas as $configMeta): ?>
					<tr>
						<td class="text-center"><?php echo h($configMeta['ConfigMeta']['id']); ?></td>
						<td class="text-center"><?php echo h($configMeta['ConfigMeta']['trackingId']); ?></td>
						<td class="text-center"><?php echo h($configMeta['ConfigMeta']['key']); ?></td>
						<td class="text-center"><?php echo h($configMeta['ConfigMeta']['value']); ?></td>
						<td class="text-center"><?php echo h($configMeta['ConfigMeta']['comment']); ?></td>
						<td class="text-center"><?php echo h($configMeta['ConfigMeta']['create_date']); ?></td>
						<td class="text-center"><?php echo h($configMeta['ConfigMeta']['update_date']); ?></td>
						<td class="text-center">
			<?php echo $this->Html->link($configMeta['User']['name'], array('controller' => 'users', 'action' => 'view', $configMeta['User']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($configMeta['ConfigMeta']['status']); ?></td>
						<td class="text-center">
							<?php if($this->App->menu_permission('configMetas','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $configMeta['ConfigMeta']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
							<?php if($this->App->menu_permission('configMetas','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $configMeta['ConfigMeta']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); } ?>
							<?php if($this->App->menu_permission('configMetas','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $configMeta['ConfigMeta']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $configMeta['ConfigMeta']['id'])); } ?>
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