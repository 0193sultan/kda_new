<div class="row">
	<div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-body">
				<table id="Scales" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('name','Increment list'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('employee_scale_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('Employeescale.scale_declare_year','scale Declare Year'); ?></th>
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
						<?php $i=1;foreach ($scales as $scale): ?>
							<tr>
								<td class="text-center"><?php echo $i++;?></td>
								<td class="text-center"><?php echo h($scale['Scale']['name']);?></td>
								<td class="text-center">
								<?php echo $this->Html->link($scale['Scale']['name'], array('controller' => 'employee_scales', 'action' => 'view', $scale['Scale']['id'])); ?>
								</td>
								<td class="text-center">
									<?php echo $this->Html->link($scale['EmployeeGrade']['grade_declare_year'], array('controller' => 'employee_grade', 'action' => 'view', $scale['EmployeeGrade']['id'])); ?>
								</td>
								<td class="text-center">
									<!-- <?php if($this->App->menu_permission('scales','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $scale['Scale']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view','rel'=>'modal:open')); } ?> -->
									<?php if($this->App->menu_permission('scales','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $scale['Scale']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'Edit')); } ?>
									<?php if($this->App->menu_permission('scales','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $scale['Scale']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $scale['Scale']['id'])); } ?>
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