<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Gpf Subscriptions'); ?></h3>
                <div class="box-tools pull-right">
                    <?php
                    if ($this->App->menu_permission('gpfSubscriptions', 'admin_add')) {
                        echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Gpf Subscription'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false));
                    }
                    ?>
                </div>
            </div>
            <?php
          //  pr($gpfSubscription);
            ?>
            <div class="box-body">
                <table  class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th class="text-center">Subscription Recovery</th>
                            <th class="text-center">Total Subscription Balance</th>
                            <th class="text-center">Subscription Interest</th>
                            <th class="text-center">Loan Amount</th>
                            <th class="text-center">Loan Recovery</th>
                            <th class="text-center">Loan Interest Amount</th>
                            <th class="text-center">loan Interest Recovery</th>
                            <th class="text-center">Create Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($gpfSubscription as $gpf): ?>
                            <tr>
                                <td class="text-center"><?= ($gpf['GpfSubscription']['subscription_recovery'] != 0 ? $gpf['GpfSubscription']['subscription_recovery'] : '') ?></td>
                                <td class="text-center"><?= ($gpf['GpfSubscription']['total_subscription_balance'] != 0 ? $gpf['GpfSubscription']['total_subscription_balance'] : '') ?></td>
                                <td class="text-center"><?= ($gpf['GpfSubscription']['subscription_interest']!= 0 ?$gpf['GpfSubscription']['subscription_interest']:'') ?></td>
                                <td class="text-center"><?= ($gpf['GpfSubscription']['loan_amount']!= 0 ?$gpf['GpfSubscription']['loan_amount']:'') ?></td>
                                <td class="text-center"><?= ($gpf['GpfSubscription']['loan_recovery']!= 0 ?$gpf['GpfSubscription']['loan_recovery']:'') ?></td>
                                <td class="text-center"><?= ($gpf['GpfSubscription']['loan_interest_amount']!= 0 ?$gpf['GpfSubscription']['loan_interest_amount']:'') ?></td>
                                <td class="text-center"><?= ($gpf['GpfSubscription']['loan_interest_recovery']!= 0 ?$gpf['GpfSubscription']['loan_interest_recovery']:'') ?></td>
                                <td class="text-center"><?= $gpf['GpfSubscription']['created_at'] ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
                <!--<div class='row'>
                    <div class='col-xs-6'>
                        <div id='Users_info' class='dataTables_info'>
                <?php echo $this->Paginator->counter(array("format" => __("Page {:page} of {:pages}, showing {:current} records out of {:count} total"))); ?>
                        </div>
                    </div>
                    <div class='col-xs-6'>
                        <div class='dataTables_paginate paging_bootstrap'>
                            <ul class='pagination'>
                <?php
                //echo $this->Paginator->prev(__("prev"), array("tag" => "li"), null, array("tag" => "li", "class" => "disabled", "disabledTag" => "a"));
                //echo $this->Paginator->numbers(array("separator" => "", "currentTag" => "a", "currentClass" => "active", "tag" => "li", "first" => 1));
                //echo $this->Paginator->next(__("next"), array("tag" => "li", "currentClass" => "disabled"), null, array("tag" => "li", "class" => "disabled", "disabledTag" => "a"));
                ?>
                            </ul>
                        </div>
                    </div>
                </div>-->
            </div>
        </div>
    </div>
</div>