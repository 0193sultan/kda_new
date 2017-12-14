<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Monthly Others Enty'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Monthly Others Enty List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="MonthlyOthersEnties" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Designation'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($monthlyOthersEnty['Designation']['name'], array('controller' => 'designations', 'action' => 'view', $monthlyOthersEnty['Designation']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Department'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($monthlyOthersEnty['Department']['name'], array('controller' => 'departments', 'action' => 'view', $monthlyOthersEnty['Department']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Employee'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($monthlyOthersEnty['Employee']['name'], array('controller' => 'employees', 'action' => 'view', $monthlyOthersEnty['Employee']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Fiscal Year'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($monthlyOthersEnty['FiscalYear']['name'], array('controller' => 'fiscal_years', 'action' => 'view', $monthlyOthersEnty['FiscalYear']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Month'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($monthlyOthersEnty['Month']['name'], array('controller' => 'months', 'action' => 'view', $monthlyOthersEnty['Month']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Electric Bill'); ?></strong></td>
		<td>
			<?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['electric_bill']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Telephone Bill'); ?></strong></td>
		<td>
			<?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['telephone_bill']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Rent A Car Bill'); ?></strong></td>
		<td>
			<?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['rent_a_car_bill']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Others'); ?></strong></td>
		<td>
			<?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['others']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created At'); ?></strong></td>
		<td>
			<?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['created_at']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Updated At'); ?></strong></td>
		<td>
			<?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['updated_at']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created By'); ?></strong></td>
		<td>
			<?php echo h($monthlyOthersEnty['MonthlyOthersEnty']['created_by']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

