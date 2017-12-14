<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Acc Head List'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Acc Head List List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="AccHeadLists" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($accHeadList['AccHeadList']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Acc Head Type'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($accHeadList['AccHeadType']['id'], array('controller' => 'acc_head_types', 'action' => 'view', $accHeadList['AccHeadType']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Head Name'); ?></strong></td>
		<td>
			<?php echo h($accHeadList['AccHeadList']['head_name']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Parent Acc Head List'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($accHeadList['ParentAccHeadList']['id'], array('controller' => 'acc_head_lists', 'action' => 'view', $accHeadList['ParentAccHeadList']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Acc Effect'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($accHeadList['AccEffect']['id'], array('controller' => 'acc_effects', 'action' => 'view', $accHeadList['AccEffect']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Order No'); ?></strong></td>
		<td>
			<?php echo h($accHeadList['AccHeadList']['order_no']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Action Head Id'); ?></strong></td>
		<td>
			<?php echo h($accHeadList['AccHeadList']['action_head_id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Action Sub Head Id'); ?></strong></td>
		<td>
			<?php echo h($accHeadList['AccHeadList']['action_sub_head_id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Action Type'); ?></strong></td>
		<td>
			<?php echo h($accHeadList['AccHeadList']['action_type']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Status'); ?></strong></td>
		<td>
			<?php echo h($accHeadList['AccHeadList']['status']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('User'); ?></strong></td>
		<td>
			<?php echo $this->Html->link($accHeadList['User']['name'], array('controller' => 'users', 'action' => 'view', $accHeadList['User']['id']), array('class' => '')); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Created At'); ?></strong></td>
		<td>
			<?php echo h($accHeadList['AccHeadList']['created_at']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Updated At'); ?></strong></td>
		<td>
			<?php echo h($accHeadList['AccHeadList']['updated_at']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>

					
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title"><?php echo __('Related Acc Head Lists'); ?></h3>
					<div class="box-tools pull-right">
						<?php echo $this->Html->link('<i class="glyphicon glyphicon-plus"></i> '.__('New Child Acc Head List'), array('controller' => 'acc_head_lists', 'action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); ?>					</div><!-- /.actions -->
				</div>
				<?php if (!empty($accHeadList['ChildAccHeadList'])): ?>
					
					<div class="box-body table-responsive">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
											<th class="text-center"><?php echo __('Id'); ?></th>
		<th class="text-center"><?php echo __('Acc Head Type Id'); ?></th>
		<th class="text-center"><?php echo __('Head Name'); ?></th>
		<th class="text-center"><?php echo __('Parent Id'); ?></th>
		<th class="text-center"><?php echo __('Acc Effect Id'); ?></th>
		<th class="text-center"><?php echo __('Order No'); ?></th>
		<th class="text-center"><?php echo __('Action Head Id'); ?></th>
		<th class="text-center"><?php echo __('Action Sub Head Id'); ?></th>
		<th class="text-center"><?php echo __('Action Type'); ?></th>
		<th class="text-center"><?php echo __('Status'); ?></th>
		<th class="text-center"><?php echo __('User Id'); ?></th>
		<th class="text-center"><?php echo __('Created At'); ?></th>
		<th class="text-center"><?php echo __('Updated At'); ?></th>
									<th class="text-center"><?php echo __('Actions'); ?></th>
								</tr>
							</thead>
							<tbody>
									<?php
										$i = 0;
										foreach ($accHeadList['ChildAccHeadList'] as $childAccHeadList): ?>
		<tr>
			<td class="text-center"><?php echo $childAccHeadList['id']; ?></td>
			<td class="text-center"><?php echo $childAccHeadList['acc_head_type_id']; ?></td>
			<td class="text-center"><?php echo $childAccHeadList['head_name']; ?></td>
			<td class="text-center"><?php echo $childAccHeadList['parent_id']; ?></td>
			<td class="text-center"><?php echo $childAccHeadList['acc_effect_id']; ?></td>
			<td class="text-center"><?php echo $childAccHeadList['order_no']; ?></td>
			<td class="text-center"><?php echo $childAccHeadList['action_head_id']; ?></td>
			<td class="text-center"><?php echo $childAccHeadList['action_sub_head_id']; ?></td>
			<td class="text-center"><?php echo $childAccHeadList['action_type']; ?></td>
			<td class="text-center"><?php echo $childAccHeadList['status']; ?></td>
			<td class="text-center"><?php echo $childAccHeadList['user_id']; ?></td>
			<td class="text-center"><?php echo $childAccHeadList['created_at']; ?></td>
			<td class="text-center"><?php echo $childAccHeadList['updated_at']; ?></td>
			<td class="text-center">
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('controller' => 'acc_head_lists', 'action' => 'view', $childAccHeadList['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); ?>
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('controller' => 'acc_head_lists', 'action' => 'edit', $childAccHeadList['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); ?>
				<?php echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('controller' => 'acc_head_lists', 'action' => 'delete', $childAccHeadList['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $childAccHeadList['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
							</tbody>
						</table><!-- /.table table-striped table-bordered -->
					</div><!-- /.table-responsive -->
					
				<?php endif; ?>

				
				
			</div><!-- /.related -->

					
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title"><?php echo __('Related Asset Details'); ?></h3>
					<div class="box-tools pull-right">
						<?php echo $this->Html->link('<i class="glyphicon glyphicon-plus"></i> '.__('New Asset Detail'), array('controller' => 'asset_details', 'action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); ?>					</div><!-- /.actions -->
				</div>
				<?php if (!empty($accHeadList['AssetDetail'])): ?>
					
					<div class="box-body table-responsive">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
											<th class="text-center"><?php echo __('Id'); ?></th>
		<th class="text-center"><?php echo __('Entry Type Id'); ?></th>
		<th class="text-center"><?php echo __('Daily Transaction Id'); ?></th>
		<th class="text-center"><?php echo __('Acc Head List Id'); ?></th>
		<th class="text-center"><?php echo __('Acc Sub Head List Id'); ?></th>
		<th class="text-center"><?php echo __('Action Type'); ?></th>
		<th class="text-center"><?php echo __('Amount'); ?></th>
		<th class="text-center"><?php echo __('User Id'); ?></th>
		<th class="text-center"><?php echo __('Created At'); ?></th>
		<th class="text-center"><?php echo __('Updated At'); ?></th>
									<th class="text-center"><?php echo __('Actions'); ?></th>
								</tr>
							</thead>
							<tbody>
									<?php
										$i = 0;
										foreach ($accHeadList['AssetDetail'] as $assetDetail): ?>
		<tr>
			<td class="text-center"><?php echo $assetDetail['id']; ?></td>
			<td class="text-center"><?php echo $assetDetail['entry_type_id']; ?></td>
			<td class="text-center"><?php echo $assetDetail['daily_transaction_id']; ?></td>
			<td class="text-center"><?php echo $assetDetail['acc_head_list_id']; ?></td>
			<td class="text-center"><?php echo $assetDetail['acc_sub_head_list_id']; ?></td>
			<td class="text-center"><?php echo $assetDetail['action_type']; ?></td>
			<td class="text-center"><?php echo $assetDetail['amount']; ?></td>
			<td class="text-center"><?php echo $assetDetail['user_id']; ?></td>
			<td class="text-center"><?php echo $assetDetail['created_at']; ?></td>
			<td class="text-center"><?php echo $assetDetail['updated_at']; ?></td>
			<td class="text-center">
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('controller' => 'asset_details', 'action' => 'view', $assetDetail['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); ?>
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('controller' => 'asset_details', 'action' => 'edit', $assetDetail['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); ?>
				<?php echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('controller' => 'asset_details', 'action' => 'delete', $assetDetail['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $assetDetail['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
							</tbody>
						</table><!-- /.table table-striped table-bordered -->
					</div><!-- /.table-responsive -->
					
				<?php endif; ?>

				
				
			</div><!-- /.related -->

					
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title"><?php echo __('Related Daily Transactions'); ?></h3>
					<div class="box-tools pull-right">
						<?php echo $this->Html->link('<i class="glyphicon glyphicon-plus"></i> '.__('New Daily Transaction'), array('controller' => 'daily_transactions', 'action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); ?>					</div><!-- /.actions -->
				</div>
				<?php if (!empty($accHeadList['DailyTransaction'])): ?>
					
					<div class="box-body table-responsive">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
											<th class="text-center"><?php echo __('Id'); ?></th>
		<th class="text-center"><?php echo __('Entry Type Id'); ?></th>
		<th class="text-center"><?php echo __('Acc Head Type Id'); ?></th>
		<th class="text-center"><?php echo __('Acc Head List Id'); ?></th>
		<th class="text-center"><?php echo __('Bank Info Id'); ?></th>
		<th class="text-center"><?php echo __('Branch Id'); ?></th>
		<th class="text-center"><?php echo __('Bank Account Id'); ?></th>
		<th class="text-center"><?php echo __('Fiscal Year Id'); ?></th>
		<th class="text-center"><?php echo __('Month Id'); ?></th>
		<th class="text-center"><?php echo __('Deposit Amount'); ?></th>
		<th class="text-center"><?php echo __('Voucher No'); ?></th>
		<th class="text-center"><?php echo __('Transaction Date'); ?></th>
		<th class="text-center"><?php echo __('Transaction Note'); ?></th>
		<th class="text-center"><?php echo __('Posting Date'); ?></th>
		<th class="text-center"><?php echo __('User Id'); ?></th>
		<th class="text-center"><?php echo __('Created At'); ?></th>
		<th class="text-center"><?php echo __('Updated At'); ?></th>
									<th class="text-center"><?php echo __('Actions'); ?></th>
								</tr>
							</thead>
							<tbody>
									<?php
										$i = 0;
										foreach ($accHeadList['DailyTransaction'] as $dailyTransaction): ?>
		<tr>
			<td class="text-center"><?php echo $dailyTransaction['id']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['entry_type_id']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['acc_head_type_id']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['acc_head_list_id']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['bank_info_id']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['branch_id']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['bank_account_id']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['fiscal_year_id']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['month_id']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['deposit_amount']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['voucher_no']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['transaction_date']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['transaction_note']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['posting_date']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['user_id']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['created_at']; ?></td>
			<td class="text-center"><?php echo $dailyTransaction['updated_at']; ?></td>
			<td class="text-center">
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('controller' => 'daily_transactions', 'action' => 'view', $dailyTransaction['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); ?>
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('controller' => 'daily_transactions', 'action' => 'edit', $dailyTransaction['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); ?>
				<?php echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('controller' => 'daily_transactions', 'action' => 'delete', $dailyTransaction['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $dailyTransaction['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
							</tbody>
						</table><!-- /.table table-striped table-bordered -->
					</div><!-- /.table-responsive -->
					
				<?php endif; ?>

				
				
			</div><!-- /.related -->

					
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title"><?php echo __('Related Income Expense Details'); ?></h3>
					<div class="box-tools pull-right">
						<?php echo $this->Html->link('<i class="glyphicon glyphicon-plus"></i> '.__('New Income Expense Detail'), array('controller' => 'income_expense_details', 'action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); ?>					</div><!-- /.actions -->
				</div>
				<?php if (!empty($accHeadList['IncomeExpenseDetail'])): ?>
					
					<div class="box-body table-responsive">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
											<th class="text-center"><?php echo __('Id'); ?></th>
		<th class="text-center"><?php echo __('Entry Type Id'); ?></th>
		<th class="text-center"><?php echo __('Daily Transaction Id'); ?></th>
		<th class="text-center"><?php echo __('Acc Head List Id'); ?></th>
		<th class="text-center"><?php echo __('Acc Sub Head List Id'); ?></th>
		<th class="text-center"><?php echo __('Acc Effect Id'); ?></th>
		<th class="text-center"><?php echo __('Amount'); ?></th>
		<th class="text-center"><?php echo __('User Id'); ?></th>
		<th class="text-center"><?php echo __('Created At'); ?></th>
		<th class="text-center"><?php echo __('Updated At'); ?></th>
									<th class="text-center"><?php echo __('Actions'); ?></th>
								</tr>
							</thead>
							<tbody>
									<?php
										$i = 0;
										foreach ($accHeadList['IncomeExpenseDetail'] as $incomeExpenseDetail): ?>
		<tr>
			<td class="text-center"><?php echo $incomeExpenseDetail['id']; ?></td>
			<td class="text-center"><?php echo $incomeExpenseDetail['entry_type_id']; ?></td>
			<td class="text-center"><?php echo $incomeExpenseDetail['daily_transaction_id']; ?></td>
			<td class="text-center"><?php echo $incomeExpenseDetail['acc_head_list_id']; ?></td>
			<td class="text-center"><?php echo $incomeExpenseDetail['acc_sub_head_list_id']; ?></td>
			<td class="text-center"><?php echo $incomeExpenseDetail['acc_effect_id']; ?></td>
			<td class="text-center"><?php echo $incomeExpenseDetail['amount']; ?></td>
			<td class="text-center"><?php echo $incomeExpenseDetail['user_id']; ?></td>
			<td class="text-center"><?php echo $incomeExpenseDetail['created_at']; ?></td>
			<td class="text-center"><?php echo $incomeExpenseDetail['updated_at']; ?></td>
			<td class="text-center">
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('controller' => 'income_expense_details', 'action' => 'view', $incomeExpenseDetail['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); ?>
				<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('controller' => 'income_expense_details', 'action' => 'edit', $incomeExpenseDetail['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); ?>
				<?php echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('controller' => 'income_expense_details', 'action' => 'delete', $incomeExpenseDetail['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $incomeExpenseDetail['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
							</tbody>
						</table><!-- /.table table-striped table-bordered -->
					</div><!-- /.table-responsive -->
					
				<?php endif; ?>

				
				
			</div><!-- /.related -->

			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

