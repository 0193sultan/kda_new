<div class="row">
    <div class="col-xs-12">		
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php echo __('Daily Transaction'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Daily Transaction List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <table id="DailyTransactions" class="table table-bordered table-striped">
                    <tbody>
                        <tr>		<td><strong><?php echo __('Id'); ?></strong></td>
                            <td>
                                <?php echo h($dailyTransaction['DailyTransaction']['id']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Entry Type'); ?></strong></td>
                            <td>
                                <?php echo h($dailyTransaction['EntryType']['entry_type']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Head Type'); ?></strong></td>
                            <td>
                                <?php echo h($head_type_list[$dailyTransaction['AccHeadList']['acc_head_type_id']]); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Main Head'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($dailyTransaction['AccHeadList']['parent_id'] == 0 ? $dailyTransaction['AccHeadList']['head_name'] : $main_head_list[$dailyTransaction['AccHeadList']['parent_id']], array('controller' => 'acc_head_lists', 'action' => 'view', $dailyTransaction['AccHeadList']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Sub Head'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($dailyTransaction['AccHeadList']['parent_id'] != 0 ? $dailyTransaction['AccHeadList']['head_name'] : '', array('controller' => 'acc_head_lists', 'action' => 'view', $dailyTransaction['AccHeadList']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Bank'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($dailyTransaction['Bank']['name'], array('controller' => 'banks', 'action' => 'view', $dailyTransaction['Bank']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Branch'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($dailyTransaction['Branch']['branch'], array('controller' => 'branches', 'action' => 'view', $dailyTransaction['Branch']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Bank Account'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($dailyTransaction['BankAccount']['account_no'], array('controller' => 'bank_accounts', 'action' => 'view', $dailyTransaction['BankAccount']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Fiscal Year'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($dailyTransaction['FiscalYear']['name'], array('controller' => 'fiscal_years', 'action' => 'view', $dailyTransaction['FiscalYear']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Month'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($dailyTransaction['Month']['name'], array('controller' => 'months', 'action' => 'view', $dailyTransaction['Month']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Deposit Amount'); ?></strong></td>
                            <td>
                                <?php echo h($dailyTransaction['DailyTransaction']['transaction_amount']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Voucher No'); ?></strong></td>
                            <td>
                                <?php echo h($dailyTransaction['DailyTransaction']['voucher_no']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Transaction Date'); ?></strong></td>
                            <td>
                                <?php echo h(date('d-m-Y', strtotime($dailyTransaction['DailyTransaction']['transaction_date']))); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Transaction Note'); ?></strong></td>
                            <td>
                                <?php echo h($dailyTransaction['DailyTransaction']['transaction_note']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Posting Date'); ?></strong></td>
                            <td>
                                <?php echo h(date('d-m-Y', strtotime($dailyTransaction['DailyTransaction']['posting_date']))); ?>
                                &nbsp;
                            </td>
                        </tr>					</tbody>
                </table>
            </div>
        </div>


    </div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

