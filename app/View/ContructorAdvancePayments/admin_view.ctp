<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Contructor Advance Payment'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Contructor Advance Payment List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="ContructorAdvancePayments" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Work Order'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($contructorAdvancePayment['WorkOrder']['id'], array('controller' => 'work_orders', 'action' => 'view', $contructorAdvancePayment['WorkOrder']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Workorder No'); ?></strong></td>
		<td>
			<?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['workorder_no']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Advance Amount'); ?></strong></td>
		<td>
			<?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['advance_amount']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Voucher No'); ?></strong></td>
		<td>
			<?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['voucher_no']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Fiscal Years'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($contructorAdvancePayment['FiscalYears']['name'], array('controller' => 'fiscal_years', 'action' => 'view', $contructorAdvancePayment['FiscalYears']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Payment Date'); ?></strong></td>
		<td>
			<?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['payment_date']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Payment Note'); ?></strong></td>
		<td>
			<?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['payment_note']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('User'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($contructorAdvancePayment['User']['name'], array('controller' => 'users', 'action' => 'view', $contructorAdvancePayment['User']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created At'); ?></strong></td>
		<td>
			<?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['created_at']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Updated At'); ?></strong></td>
		<td>
			<?php echo h($contructorAdvancePayment['ContructorAdvancePayment']['updated_at']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

