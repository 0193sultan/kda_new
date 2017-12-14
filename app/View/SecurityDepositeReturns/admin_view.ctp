<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Security Deposite Return'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Security Deposite Return List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="SecurityDepositeReturns" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($securityDepositeReturn['SecurityDepositeReturn']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Work Order'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($securityDepositeReturn['WorkOrder']['id'], array('controller' => 'work_orders', 'action' => 'view', $securityDepositeReturn['WorkOrder']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Work Order No'); ?></strong></td>
		<td>
			<?php echo h($securityDepositeReturn['SecurityDepositeReturn']['work_order_no']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Security Return Amount'); ?></strong></td>
		<td>
			<?php echo h($securityDepositeReturn['SecurityDepositeReturn']['security_return_amount']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Total Security Money Paid'); ?></strong></td>
		<td>
			<?php echo h($securityDepositeReturn['SecurityDepositeReturn']['total_security_money_paid']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Voucher No'); ?></strong></td>
		<td>
			<?php echo h($securityDepositeReturn['SecurityDepositeReturn']['voucher_no']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Fiscal Year'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($securityDepositeReturn['FiscalYear']['name'], array('controller' => 'fiscal_years', 'action' => 'view', $securityDepositeReturn['FiscalYear']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Payment Date'); ?></strong></td>
		<td>
			<?php echo h($securityDepositeReturn['SecurityDepositeReturn']['payment_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Payment Note'); ?></strong></td>
		<td>
			<?php echo h($securityDepositeReturn['SecurityDepositeReturn']['payment_note']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

