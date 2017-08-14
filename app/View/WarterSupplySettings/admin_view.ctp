<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Warter Supply Setting'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Warter Supply Setting List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="WarterSupplySettings" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($warterSupplySetting['WarterSupplySetting']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Year'); ?></strong></td>
		<td>
			<?php echo h($warterSupplySetting['WarterSupplySetting']['year']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Grade Start'); ?></strong></td>
		<td>
			<?php echo h($warterSupplySetting['WarterSupplySetting']['grade_start']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Grade End'); ?></strong></td>
		<td>
			<?php echo h($warterSupplySetting['WarterSupplySetting']['grade_end']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Living Status'); ?></strong></td>
		<td>
			<?php echo h($warterSupplySetting['Location']['name']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Water Bill'); ?></strong></td>
		<td>
			<?php echo h($warterSupplySetting['WarterSupplySetting']['water_bill']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Create Date'); ?></strong></td>
		<td>
			<?php echo h($warterSupplySetting['WarterSupplySetting']['create_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Update Date'); ?></strong></td>
		<td>
			<?php echo h($warterSupplySetting['WarterSupplySetting']['update_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('User'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($warterSupplySetting['User']['name'], array('controller' => 'users', 'action' => 'view', $warterSupplySetting['User']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Status'); ?></strong></td>
		<td>
			<?php echo h($warterSupplySetting['WarterSupplySetting']['status']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

