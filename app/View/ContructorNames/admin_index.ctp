<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Contructor Registrations'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('contructorNames','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Contructor Registration'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">
                <table id="ContructorNames" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('name'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('owner_name'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('father_name'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('address'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('phone'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('alt_phone'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('licence_no'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('licence_category_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('licence_fee'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('enlisted_date'); ?></th>
							<!-- <th class="text-center"><?php echo $this->Paginator->sort('user_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('created_at'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('updated_at'); ?></th> -->
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($contructorNames as $contructorName): ?>
					<tr>
						<td class="text-center"><?php echo h($contructorName['ContructorName']['id']); ?></td>
						<td class="text-center"><?php echo h($contructorName['ContructorName']['name']); ?></td>
						<td class="text-center"><?php echo h($contructorName['ContructorName']['owner_name']); ?></td>
						<td class="text-center"><?php echo h($contructorName['ContructorName']['father_name']); ?></td>
						<td class="text-center"><?php echo h($contructorName['ContructorName']['address']); ?></td>
						<td class="text-center"><?php echo h($contructorName['ContructorName']['phone']); ?></td>
						<td class="text-center"><?php echo h($contructorName['ContructorName']['alternative_phone']); ?></td>
						<td class="text-center"><?php echo h($contructorName['ContructorName']['licence_no']); ?></td>
						<td class="text-center">
			<?php echo $this->Html->link($contructorName['LicenceCategory']['name'], array('controller' => 'licence_categories', 'action' => 'view', $contructorName['LicenceCategory']['id'])); ?>
		</td>
						<td class="text-center"><?php echo h($contructorName['ContructorName']['licence_fee']); ?></td>
						<td class="text-center"><?php echo h($contructorName['ContructorName']['enlisted_date']); ?></td>
						<!-- <td class="text-center">
							<?php echo $this->Html->link($contructorName['User']['name'], array('controller' => 'users', 'action' => 'view', $contructorName['User']['id'])); ?>
						</td>
						<td class="text-center"><?php echo h($contructorName['ContructorName']['created_at']); ?></td>
						<td class="text-center"><?php echo h($contructorName['ContructorName']['updated_at']); ?></td> -->
						<td class="text-center">
							<?php if($this->App->menu_permission('contructorNames','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $contructorName['ContructorName']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
							<?php if($this->App->menu_permission('contructorNames','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $contructorName['ContructorName']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); } ?>
							<?php if($this->App->menu_permission('contructorNames','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $contructorName['ContructorName']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $contructorName['ContructorName']['id'])); } ?>
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