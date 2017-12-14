<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Acc Head List'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Acc Head List List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="AccHeadLists" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($accHeadList['AccHeadList']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Head Name'); ?></strong></td>
		<td>
			<?php echo h($accHeadList['AccHeadList']['head_name']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Parent Acc Head List'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($accHeadList['ParentAccHeadList']['head_name'], array('controller' => 'acc_head_lists', 'action' => 'view', $accHeadList['ParentAccHeadList']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Effect On'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($accHeadList['AccEffect']['acc_effect_head_name'], array('controller' => 'acc_effects', 'action' => 'view', $accHeadList['AccEffect']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Acc Head Type'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($accHeadList['AccHeadType']['head_type_name'], array('controller' => 'acc_head_types', 'action' => 'view', $accHeadList['AccHeadType']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Order No'); ?></strong></td>
		<td>
			<?php echo h($accHeadList['AccHeadList']['order_no']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

