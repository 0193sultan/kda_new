<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Tax Settings'); ?></h3>
                <div class="box-tools pull-right">
                    <?php
                    if ($this->App->menu_permission('taxSettings', 'admin_add')) {
                        echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Tax Setting'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false));
                    }
                    ?>
                </div>
            </div>
            <div class="box-body">
                <table id="TaxSettings" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('tax_applied_year'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('tax_name'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('tax_executable_amount'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('location_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('applied_tax_amount'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('monthly_recovery'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('tax_adjustment_for_last_month'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('add_sub'); ?></th>
                            <th width="120" class="text-center"><?php echo __('Actions'); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($taxSettings as $taxSetting): ?>
                            <tr>
                                <td class="text-center"><?php echo h($taxSetting['TaxSetting']['id']); ?></td>
                                <td class="text-center"><?php echo h($taxSetting['TaxSetting']['tax_applied_year']); ?></td>
                                <td class="text-center"><?php echo h($taxSetting['TaxSetting']['tax_name']); ?></td>
                                <td class="text-center"><?php echo h($taxSetting['TaxSetting']['tax_executable_amount']); ?></td>
                                <td class="text-center"><?php echo h($taxSetting['TaxSetting']['location_id']); ?></td>
                                <td class="text-center"><?php echo h($taxSetting['TaxSetting']['applied_tax_amount']); ?></td>
                                <td class="text-center"><?php echo h($taxSetting['TaxSetting']['monthly_recovery']); ?></td>
                                <td class="text-center"><?php echo h($taxSetting['TaxSetting']['tax_adjustment_for_last_month']); ?></td>
                                <td class="text-center"><?php echo h($taxSetting['TaxSetting']['add_sub']); ?></td>
                                <td class="text-center">
                                    <?php
                                    if ($this->App->menu_permission('taxSettings', 'admin_view')) {
                                        echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $taxSetting['TaxSetting']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'view'));
                                    }
                                    ?>
                                    <?php
                                    if ($this->App->menu_permission('taxSettings', 'admin_edit')) {
                                        echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $taxSetting['TaxSetting']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'edit'));
                                    }
                                    ?>
                                    <?php
                                    if ($this->App->menu_permission('taxSettings', 'admin_delete')) {
                                        echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $taxSetting['TaxSetting']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $taxSetting['TaxSetting']['id']));
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