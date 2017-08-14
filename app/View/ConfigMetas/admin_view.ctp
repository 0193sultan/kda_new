<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Config Meta'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Config Meta List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="ConfigMetas" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($configMeta['ConfigMeta']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Tracking Id'); ?></strong></td>
		<td>
			<?php echo h($configMeta['ConfigMeta']['trackingId']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Key'); ?></strong></td>
		<td>
			<?php echo h($configMeta['ConfigMeta']['key']); ?>
			&nbsp;
		</td>
</tr>
<tr>		
<td><strong><?php echo __('Value'); ?></strong></td>
		<td>
			<?php echo h($configMeta['ConfigMeta']['value']); ?>
			&nbsp;
		</td>
</tr>


<tr>		
<td><strong><?php echo __('Comment'); ?></strong></td>
		<td>
			<?php echo h($configMeta['ConfigMeta']['comment']); ?>
			&nbsp;
		</td>
</tr>



<tr>		<td><strong><?php echo __('Create Date'); ?></strong></td>
		<td>
			<?php echo h($configMeta['ConfigMeta']['create_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Update Date'); ?></strong></td>
		<td>
			<?php echo h($configMeta['ConfigMeta']['update_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('User'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($configMeta['User']['name'], array('controller' => 'users', 'action' => 'view', $configMeta['User']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Status'); ?></strong></td>
		<td>
			<?php echo h($configMeta['ConfigMeta']['status']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

