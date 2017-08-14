<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Tax Setting'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Tax Setting List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="TaxSettings" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($taxSetting['TaxSetting']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Tax Applied Year'); ?></strong></td>
		<td>
			<?php echo h($taxSetting['TaxSetting']['tax_applied_year']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Tax Name'); ?></strong></td>
		<td>
			<?php echo h($taxSetting['TaxSetting']['tax_name']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Tax Executable Amount'); ?></strong></td>
		<td>
			<?php echo h($taxSetting['TaxSetting']['tax_executable_amount']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Applied Place For'); ?></strong></td>
		<td>
			<?php echo h($taxSetting['TaxSetting']['applied_place_for']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Applied Tax Amount'); ?></strong></td>
		<td>
			<?php echo h($taxSetting['TaxSetting']['applied_tax_amount']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Monthly Recovery'); ?></strong></td>
		<td>
			<?php echo h($taxSetting['TaxSetting']['monthly_recovery']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Loan Adjustment'); ?></strong></td>
		<td>
			<?php echo h($taxSetting['TaxSetting']['loan_adjustment']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Add Sub'); ?></strong></td>
		<td>
			<?php echo h($taxSetting['TaxSetting']['add_sub']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created At'); ?></strong></td>
		<td>
			<?php echo h($taxSetting['TaxSetting']['created_at']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Updated At'); ?></strong></td>
		<td>
			<?php echo h($taxSetting['TaxSetting']['updated_at']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

