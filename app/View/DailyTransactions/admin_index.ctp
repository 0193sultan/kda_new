<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Daily Transactions'); ?></h3>
                <div class="box-tools pull-right">
                    <?php
                    if ($this->App->menu_permission('dailyTransactions', 'admin_add')) {
                        echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Daily Transaction'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false));
                    }
                    ?>
                </div>
            </div>
            <div class="box-body">
                <table id="DailyTransactions" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('entry_type'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('acc_head_type_id', 'Head Type'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('acc_head_list_id', 'Main Head'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('acc_head_list_id', 'Sub Head'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('bank_info_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('branch_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('bank_account_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('transaction_amount'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('voucher_no'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('transaction_date'); ?></th>
                            <th width="120" class="text-center"><?php echo __('Actions'); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        //pr($dailyTransactions);
                        foreach ($dailyTransactions as $dailyTransaction):
                            ?>
                            <tr>
                                <td class="text-center"><?php echo h($dailyTransaction['DailyTransaction']['id']); ?></td>
                                <td class="text-center"><?php echo h($dailyTransaction['EntryType']['entry_type']); ?></td>
                                <td class="text-center"><?php echo h($dailyTransaction['AccHeadType']['head_type_name']); ?></td>
                                <td class="text-center">
    <?php echo $this->Html->link($dailyTransaction['AccHeadList']['parent_id'] == 0 ? $dailyTransaction['AccHeadList']['head_name'] : $main_head_list[$dailyTransaction['AccHeadList']['parent_id']], array('controller' => 'acc_head_lists', 'action' => 'view', $dailyTransaction['AccHeadList']['id'])); ?>
                                </td>
                                <td class="text-center">
    <?php echo $this->Html->link($dailyTransaction['AccHeadList']['parent_id'] != 0 ? $dailyTransaction['AccHeadList']['head_name'] : '', array('controller' => 'acc_head_lists', 'action' => 'view', $dailyTransaction['AccHeadList']['id'])); ?>
                                </td>
                                <td class="text-center">
    <?php echo $this->Html->link($dailyTransaction['BankInfo']['name'], array('controller' => 'banks', 'action' => 'view', $dailyTransaction['BankInfo']['id'])); ?>
                                </td>
                                <td class="text-center">
    <?php echo $this->Html->link($dailyTransaction['Branch']['branch'], array('controller' => 'branches', 'action' => 'view', $dailyTransaction['Branch']['id'])); ?>
                                </td>
                                <td class="text-center">
    <?php echo $this->Html->link($dailyTransaction['BankAccount']['account_no'], array('controller' => 'bank_accounts', 'action' => 'view', $dailyTransaction['BankAccount']['id'])); ?>
                                </td>
                                <td class="text-center"><?php echo h($dailyTransaction['DailyTransaction']['transaction_amount']); ?></td>
                                <td class="text-center"><?php echo h($dailyTransaction['DailyTransaction']['voucher_no']); ?></td>
                                <td class="text-center"><?php echo h(date('d-m-Y', strtotime($dailyTransaction['DailyTransaction']['created_at']))); ?></td>
                                <td class="text-center">
                                    <?php
                                    if ($this->App->menu_permission('dailyTransactions', 'admin_view')) {
                                        echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $dailyTransaction['DailyTransaction']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'view'));
                                    }
                                    ?>
                                    <?php
                                    if ($this->App->menu_permission('dailyTransactions', 'admin_edit')) {
                                        echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $dailyTransaction['DailyTransaction']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'edit'));
                                    }
                                    ?>
                                    <?php
                                    if ($this->App->menu_permission('dailyTransactions', 'admin_delete')) {
                                        echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $dailyTransaction['DailyTransaction']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $dailyTransaction['DailyTransaction']['id']));
                                    }
                                    ?>
                                </td>
                            </tr>
<?php endforeach; ?>
                    </tbody>
                </table>
                <div class='row'>
                    <div class='col-xs-6'>
                        <div id='Users_info' class='dataTables_info'>
<?php echo $this->Paginator->counter(array("format" => __("Page {:page} of {:pages}, showing {:current} records out of {:count} total"))); ?>
                        </div>
                    </div>
                    <div class='col-xs-6'>
                        <div class='dataTables_paginate paging_bootstrap'>
                            <ul class='pagination'>
                                <?php
                                echo $this->Paginator->prev(__("prev"), array("tag" => "li"), null, array("tag" => "li", "class" => "disabled", "disabledTag" => "a"));
                                echo $this->Paginator->numbers(array("separator" => "", "currentTag" => "a", "currentClass" => "active", "tag" => "li", "first" => 1));
                                echo $this->Paginator->next(__("next"), array("tag" => "li", "currentClass" => "disabled"), null, array("tag" => "li", "class" => "disabled", "disabledTag" => "a"));
                                ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>