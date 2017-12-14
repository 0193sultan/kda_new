<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Contructor Registration'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Contructor Registration List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="ContructorNames" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($contructorName['ContructorName']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Name'); ?></strong></td>
		<td>
			<?php echo h($contructorName['ContructorName']['name']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Owner Name'); ?></strong></td>
		<td>
			<?php echo h($contructorName['ContructorName']['owner_name']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Father Name'); ?></strong></td>
		<td>
			<?php echo h($contructorName['ContructorName']['father_name']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Address'); ?></strong></td>
		<td>
			<?php echo h($contructorName['ContructorName']['address']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Phone'); ?></strong></td>
		<td>
			<?php echo h($contructorName['ContructorName']['phone']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Alt Phone'); ?></strong></td>
		<td>
			<?php echo h($contructorName['ContructorName']['alternative_phone']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Licence No'); ?></strong></td>
		<td>
			<?php echo h($contructorName['ContructorName']['licence_no']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Licence Category'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($contructorName['LicenceCategory']['name'], array('controller' => 'licence_categories', 'action' => 'view', $contructorName['LicenceCategory']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Licence Fee'); ?></strong></td>
		<td>
			<?php echo h($contructorName['ContructorName']['licence_fee']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Enlisted Date'); ?></strong></td>
		<td>
			<?php echo h($contructorName['ContructorName']['enlisted_date']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

