<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Acc Head Lists'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('accHeadLists','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Acc Head List'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">
                <table id="AccHeadLists" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('head_name'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('parent_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('acc_effect_id', 'Effect On'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('acc_head_type_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('status'); ?></th>
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($accHeadLists as $accHeadList): ?>
					<tr>
						<td class="text-center"><?php echo h($accHeadList['AccHeadList']['id']); ?></td>
						<td class="text-center"><?php echo h($accHeadList['AccHeadList']['head_name']); ?></td>
						<td class="text-center">
			<?php echo $this->Html->link($accHeadList['ParentAccHeadList']['head_name'], array('controller' => 'acc_head_lists', 'action' => 'view', $accHeadList['ParentAccHeadList']['id'])); ?>
		</td>
						<td class="text-center">
			<?php echo $this->Html->link($accHeadList['AccEffect']['acc_effect_head_name'], array('controller' => 'acc_effects', 'action' => 'view', $accHeadList['AccEffect']['id'])); ?>
		</td>
						<td class="text-center">
			<?php echo $this->Html->link($accHeadList['AccHeadType']['head_type_name'], array('controller' => 'acc_head_types', 'action' => 'view', $accHeadList['AccHeadType']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($accHeadList['AccHeadList']['status']); ?></td>
						<td class="text-center">
							<?php if($this->App->menu_permission('accHeadLists','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $accHeadList['AccHeadList']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
							<?php if($this->App->menu_permission('accHeadLists','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $accHeadList['AccHeadList']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); } ?>
							<?php if($this->App->menu_permission('accHeadLists','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $accHeadList['AccHeadList']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $accHeadList['AccHeadList']['id'])); } ?>
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