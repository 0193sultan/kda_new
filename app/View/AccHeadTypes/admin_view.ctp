<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Acc Head Type'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Acc Head Type List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="AccHeadTypes" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($accHeadType['AccHeadType']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Head Type Name'); ?></strong></td>
		<td>
			<?php echo h($accHeadType['AccHeadType']['head_type_name']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Status'); ?></strong></td>
		<td>
			<?php echo h($accHeadType['AccHeadType']['status']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>
			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->
