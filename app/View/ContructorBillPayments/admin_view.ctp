<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Contructor Bill Payment'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Contructor Bill Payment List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="ContructorBillPayments" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Work Order'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($contructorBillPayment['WorkOrder']['id'], array('controller' => 'work_orders', 'action' => 'view', $contructorBillPayment['WorkOrder']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Work Order No'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['work_order_no']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Bill Amount'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['bill_amount']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Voucher No'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['voucher_no']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Fiscal Year'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($contructorBillPayment['FiscalYear']['name'], array('controller' => 'fiscal_years', 'action' => 'view', $contructorBillPayment['FiscalYear']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Vat %'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['vat_%']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Vat'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['vat']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Tax %'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['tax_%']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Tax'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['tax']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Security Money %'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['security_money_%']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Security Money'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['security_money']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Advance Adjustment'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['advance_adjustment']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Net Pay'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['net_pay']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Bill Pay Date'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['bill_pay_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Payment Note'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['payment_note']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('User'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($contructorBillPayment['User']['name'], array('controller' => 'users', 'action' => 'view', $contructorBillPayment['User']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created At'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['created_at']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Updated At'); ?></strong></td>
		<td>
			<?php echo h($contructorBillPayment['ContructorBillPayment']['updated_at']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

