<style>
    label {
        float: left;
        width: 100%;
        text-align: left;
        margin: 5px 20px 0 0;
        padding: 10%;
    }
    .search_employee label {
        float: left;
        width: 100%;
        text-align: left;
        margin: 5px 20px 0 0;
        padding: 0px;
    }
    .form-control {
        float: left;
        width: 90%;
        font-size: 13px;
        height: 28px;
        padding: 5px;
        margin-left: 10px;
    }

    .submit {
        margin-left: 0px;
        padding-left: 0px;
    }
</style>
<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Employees'); ?></h3>
                <div class="box-tools pull-right">
                    <?php
                    if ($this->App->menu_permission('employees', 'admin_add')) {
                        echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Employee'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false));
                    }
                    ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('search', array('role' => 'form')); ?>
                <table class="table  table-striped search_employee" style="margin-bottom: 20px;">
                    <tbody>
                        <tr>
                            <td><?php echo $this->Form->label('employee_no', 'Employee no/name'); ?></td>
                            <td style="border-right:1px solid #ddd;"><?php echo $this->Form->input('employee_no', array('class' => 'form-control', 'label' => false)); ?></td>
                            <td><?php echo $this->Form->label('employee_dept', 'Employee Department'); ?></td>
                            <td style="border-right:1px solid #ddd;"><?php echo $this->Form->input('employee_dept', array('class' => 'form-control', 'label' => false, 'options' => array('' => 'All', $departments))); ?></td>
                            <td><?php echo $this->Form->label('employee_desg', 'Employee Designation'); ?></td>
                            <td style="border-right:1px solid #ddd;"><?php echo $this->Form->input('employee_desg', array('class' => 'form-control', 'label' => false, 'options' => array('' => 'All', $designations))); ?></td>
                            <td><?php echo $this->Form->submit('search', array('class' => 'btn btn-primary')); ?></td>
                        </tr>
                    </tbody>
                </table>
                <?php echo $this->Form->end(); ?>
                <table id="Employees" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                                <!-- <th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th> -->
                            <th class="text-center"><?php echo $this->Paginator->sort('name'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('employeeID'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('employee_grade_id'); ?></th>
                            <!-- <th class="text-center"><?php echo $this->Paginator->sort('increment_id'); ?></th> -->
                            <th class="text-center"><?php echo $this->Paginator->sort('designation_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('scale_id', 'Current Basic'); ?></th>
                            <!-- <th class="text-center"><?php echo $this->Paginator->sort('new_basic'); ?></th> -->
                            <!-- <th class="text-center"><?php echo $this->Paginator->sort('date_of_birth'); ?></th> -->
                            <th class="text-center"><?php echo $this->Paginator->sort('joining_date'); ?></th>
                            <!-- <th class="text-center"><?php echo $this->Paginator->sort('quota_id'); ?></th> -->
                            <!-- <th class="text-center"><?php echo $this->Paginator->sort('employee_type_id'); ?></th> -->
                            <th class="text-center"><?php echo $this->Paginator->sort('religion_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('department_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('job_status_id'); ?></th>
                            <!-- <th class="text-center"><?php echo $this->Paginator->sort('current_posting_place'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('account_number'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('bank_info_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('fathers_name'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('mothers_name'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('sex_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('marital_status_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('spouse_name'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('living_status_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('present_address'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('permanent_address'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('contact_no'); ?></th>-->

                            <th width="120" class="text-center"><?php echo __('Actions'); ?></th> 						</tr>
                    </thead>
                    <tbody>
                        <?php
                                           // pr($employees);
                        foreach ($employees as $employee): ?>
                            <tr>
                                    <!-- <td class="text-center"><?php echo h($employee['Employee']['id']); ?></td> -->
                                <td class="text-center"><?php echo h($employee['Employee']['name']); ?></td>
                                <td class="text-center"><?php echo h($employee['Employee']['employeeID']); ?></td>
                                <td class="text-center">
                                    <?php echo $this->Html->link($employee['EmployeeGrade']['name'], array('controller' => 'employee_grades', 'action' => 'view', $employee['EmployeeGrade']['id'])); ?>
                                </td>
        <!-- <td class="text-center">
                                <?php echo $this->Html->link($employee['increment']['name'], array('controller' => 'increments', 'action' => 'view', $employee['increment']['id'])); ?>
    </td> -->
                                <td class="text-center">
                                    <?php echo $this->Html->link($employee['Designation']['name'], array('controller' => 'designations', 'action' => 'view', $employee['Designation']['id'])); ?>
                                </td>
                                <td class="text-center">
                                    <?php echo $this->Html->link($employee['Scale']['grade_basic'], array('controller' => 'scales', 'action' => 'view', $employee['Scale']['id'])); ?>
                                </td>
                                                                <!-- <td class="text-center">
                                <?php echo $this->Html->link($employee['NewBasic']['name'], array('controller' => 'new_basics', 'action' => 'view', $employee['NewBasic']['id'])); ?>
                                </td>
                                <td class="text-center"><?php echo h($employee['Employee']['date_of_birth']); ?></td> -->
                                <td class="text-center"><?php echo h($employee['Employee']['joining_date']); ?></td>
                                                                <!-- <td class="text-center">
                                <?php echo $this->Html->link($employee['Quota']['name'], array('controller' => 'quotas', 'action' => 'view', $employee['Quota']['id'])); ?>
                                </td> -->
                                                                <!-- <td class="text-center">
                                <?php echo $this->Html->link($employee['EmployeeType']['name'], array('controller' => 'employee_types', 'action' => 'view', $employee['EmployeeType']['id'])); ?>
                                </td> -->
                                <td class="text-center">
                                    <?php echo $this->Html->link($employee['Religion']['name'], array('controller' => 'religions', 'action' => 'view', $employee['Religion']['id'])); ?>
                                </td>
                                <td>
                                    <?php echo $this->Html->link($employee['Department']['name'], array('controller' => 'Departments', 'action' => 'view', $employee['Department']['id'])); ?>
                                </td>
                                <td class="text-center">
                                    <?php echo $this->Html->link($employee['JobStatus']['name'], array('controller' => 'job_statuses', 'action' => 'view', $employee['JobStatus']['id'])); ?>
                                </td>
                                                                <!-- <td class="text-center"><?php echo h($employee['Employee']['current_posting_place']); ?></td>
                                                                <td class="text-center"><?php echo h($employee['Employee']['account_number']); ?></td>
                                                                <td class="text-center">
                                <?php echo $this->Html->link($employee['BankInfo']['name'], array('controller' => 'BankInfos', 'action' => 'view', $employee['BankInfo']['id'])); ?>
                                </td>
                                                                <td class="text-center"><?php echo h($employee['Employee']['fathers_name']); ?></td>
                                                                <td class="text-center"><?php echo h($employee['Employee']['mothers_name']); ?></td>
                                                                <td class="text-center">
                                <?php echo $this->Html->link($employee['Sex']['name'], array('controller' => 'sexes', 'action' => 'view', $employee['Sex']['id'])); ?>
                                </td>
                                                                <td class="text-center">
                                <?php echo $this->Html->link($employee['MaritalStatus']['name'], array('controller' => 'marital_statuses', 'action' => 'view', $employee['MaritalStatus']['id'])); ?>
                                </td>
                                                                <td class="text-center"><?php echo h($employee['Employee']['spouse_name']); ?></td>
                                                                <td class="text-center">
                                <?php echo $this->Html->link($employee['LivingStatus']['name'], array('controller' => 'living_statuses', 'action' => 'view', $employee['LivingStatus']['id'])); ?>
                                </td>
                                                                <td class="text-center"><?php echo h($employee['Employee']['present_address']); ?></td>
                                                                <td class="text-center"><?php echo h($employee['Employee']['permanent_address']); ?></td>
                                                                <td class="text-center"><?php echo h($employee['Employee']['contact_no']); ?></td> -->
                                <td class="text-center">
                                    <?php
                                    if ($this->App->menu_permission('employees', 'admin_view')) {
                                        echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $employee['Employee']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'view'));
                                    }
                                    ?>
                                    <?php
                                    if ($this->App->menu_permission('employees', 'admin_edit')) {
                                        echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $employee['Employee']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'edit'));
                                    }
                                    ?>
                                    <?php
                                    if ($this->App->menu_permission('employees', 'admin_delete')) {
                                        echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $employee['Employee']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $employee['Employee']['id']));
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