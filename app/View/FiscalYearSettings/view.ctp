<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Fiscal Year Setting'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Fiscal Year Setting List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="FiscalYearSettings" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($fiscalYearSetting['FiscalYearSetting']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Fiscal Year'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($fiscalYearSetting['FiscalYear']['name'], array('controller' => 'fiscal_years', 'action' => 'view', $fiscalYearSetting['FiscalYear']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Month'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($fiscalYearSetting['Month']['name'], array('controller' => 'months', 'action' => 'view', $fiscalYearSetting['Month']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Working Day'); ?></strong></td>
		<td>
			<?php echo h($fiscalYearSetting['FiscalYearSetting']['working_day']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

