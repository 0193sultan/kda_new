<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Product Conversion List'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('ProductConvertHistories','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Product Conversion'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">
                <table id="InventoryAdjustments" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th width="50" class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('store_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('from_product_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('to_product_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('from_status_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('to_status_id'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('quantity'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('created_by'); ?></th>
							<th class="text-center"><?php echo $this->Paginator->sort('created_at','Date'); ?></th>
							<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($productConvertHistories as $productConvertHistories): ?>
					<tr>
						<td class="text-center"><?php echo h($productConvertHistories['ProductConvertHistory']['id']); ?></td>
						<td class="text-center"><?php echo h($productConvertHistories['ProductConvertHistory']['store_id']); ?></td>
					<!--	<td class="text-center"><?php if($productConvertHistories['ProductConvertHistory']['status'] == 1){ echo 'In'; }else{ echo 'Out';}  ?></td>-->
						<td class="text-center"><?php echo h($productConvertHistories['ProductConvertHistory']['from_product_id']); ?></td>
						<td class="text-center"><?php echo h($productConvertHistories['ProductConvertHistory']['to_product_id']); ?></td>
						<td class="text-center"><?php echo h($productConvertHistories['ProductConvertHistory']['from_status_id']); ?></td>
						<td class="text-center"><?php echo h($productConvertHistories['ProductConvertHistory']['to_status_id']); ?></td>
						<td class="text-center"><?php echo h($productConvertHistories['ProductConvertHistory']['quantity']); ?></td>
						<td class="text-center"><?php echo h($productConvertHistories['ProductConvertHistory']['type']); ?></td>
						<td class="text-center"><?php echo h($productConvertHistories['ProductConvertHistory']['created_by']); ?></td>
						<td class="text-center"><?php echo $this->App->dateformat($productConvertHistories['ProductConvertHistory']['created_at']); ?></td>
						<td class="text-center">
							<?php if($this->App->menu_permission('ProductConvertHistories','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $productConvertHistories['ProductConvertHistory']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
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