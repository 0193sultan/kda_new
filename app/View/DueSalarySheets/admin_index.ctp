<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Due Salary Sheets'); ?></h3>
                <div class="box-tools pull-right">
                    <?php
                    if ($this->App->menu_permission('dueSalarySheets', 'admin_add')) {
                        echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Due Salary Sheet'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false));
                    }
                    ?>
                </div>
            </div>
            <div class="box-body">
                <?php
                echo $this->Form->create('DueSalarySheets', array('role' => 'form'));
                // pr($fiscalYearData);
                ?>
                <div  class="row">
                    <div class=" col-sm-12">
                        <table>
                            <tr>
                                <td><h5 class="box-title">Year : </h5></td>
                                <td><?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:200px', 'options' => array('' => 'Select Year', $fiscalYearData))); ?></td>
                                <td><h5 class="box-title">&nbsp;&nbsp;&nbsp;&nbsp;Month :  </h5></td>
                                <td><?php echo $this->Form->input('month_id', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:200px')); ?></td>
                                <!--<td><?php //echo $this->Form->input('salary_types', array('class' => 'form-control', 'label' => false, 'style' => 'width:200px', 'default' => '31', 'options' => array('' => 'Select Salary Type', $salaryTypes)));                   ?></td>-->
                                <td> <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?></td>
                            </tr>
                        </table>
                        <br>
                    </div>
                </div>
                <br>

                <?php echo $this->Form->end(); ?>


                <table id="DueSalarySheets" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('employee_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('due_days'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('current_basic'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('da'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('pp'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('medical'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('convance'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('wash'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('mobile'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('cycle'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('charge'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('other'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('house_rent'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('telephone_allowance'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('tiffin'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('education'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('fiscal_year_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('month_id'); ?></th>
                            <th width="120" class="text-center"><?php echo __('Actions'); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php

                            if(!empty($dueSalary)):
                                //   pr($dueSalary);
                        foreach ($dueSalary as $dueSalarySheet): ?>
                            <tr>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['id']); ?></td>
                                <td class="text-center">
                                    <?php echo $this->Html->link($dueSalarySheet['Employee']['name'], array('controller' => 'employees', 'action' => 'view', $dueSalarySheet['Employee']['id'])); ?>
                                </td>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['due_days']); ?></td>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['current_basic']); ?></td>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['da']); ?></td>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['pp']); ?></td>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['medical']); ?></td>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['convance']); ?></td>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['wash']); ?></td>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['mobile']); ?></td>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['cycle']); ?></td>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['charge']); ?></td>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['other']); ?></td>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['house_rent']); ?></td>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['telephone_allowance']); ?></td>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['tiffin']); ?></td>
                                <td class="text-center"><?php echo h($dueSalarySheet['DueSalarySheet']['education']); ?></td>
                                <td class="text-center">
                                    <?php echo $this->Html->link($dueSalarySheet['FiscalYear']['name'], array('controller' => 'fiscal_years', 'action' => 'view', $dueSalarySheet['FiscalYear']['id'])); ?>
                                </td>
                                <td class="text-center">
                                    <?php echo $this->Html->link($dueSalarySheet['Month']['name'], array('controller' => 'months', 'action' => 'view', $dueSalarySheet['Month']['id'])); ?>
                                </td>
                                <td class="text-center">
                                    <?php
                                    if ($this->App->menu_permission('dueSalarySheets', 'admin_view')) {
                                        echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $dueSalarySheet['DueSalarySheet']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'view'));
                                    }
                                    ?>
                                    <?php
                                    if ($this->App->menu_permission('dueSalarySheets', 'admin_edit')) {
                                        echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $dueSalarySheet['DueSalarySheet']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'edit'));
                                    }
                                    ?>
                                    <?php
                                    if ($this->App->menu_permission('dueSalarySheets', 'admin_delete')) {
                                        echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $dueSalarySheet['DueSalarySheet']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $dueSalarySheet['DueSalarySheet']['id']));
                                    }
                                    ?>
                                </td>
                            </tr>
                        <?php endforeach;

                                                    endif;
                        ?>
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
<script>
    $('#DueSalarySheetsFiscalYearId').change(function () {
        var yearId = $(this).val();
        //console.log(yearId);
        //var gradeName = $('#EmployeeEmployeeGradeId option:selected').text();
        // console.log(gradeName);
        $.ajax({
            url: '<?php echo BASE_URL ?>admin/Apis/get_months',
            type: 'POST',
            data: {yearId: yearId},
            success: function (result) {
                result = $.parseJSON(result);
                var options = '<option value="0">Select current Basic</option>'
                $.each(result, function (index, value) {
                    options += '<option value=' + '"' + index + '">' + value + '</option>'
                });
                $('#DueSalarySheetsMonthId').html(options);
            }
        });
    });
</script>