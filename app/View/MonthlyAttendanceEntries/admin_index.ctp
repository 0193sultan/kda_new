<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Monthly Attendance Entries'); ?></h3>
                <div class="box-tools pull-right">
                    <?php /* if($this->App->menu_permission('monthlyAttendanceEntries','admin_add')){ */ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Monthly Attendance Entry'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); /* } */ ?>
                </div>
            </div>
            <div class="box-body">
                <table id="MonthlyAttendanceEntries" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('employee_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('official_attendence'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('casual_leave'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('sick_leave'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('earned_leave'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('maternity_leave'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('total_attendance'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('panalty'); ?></th>
                            <th width="120" class="text-center"><?php echo __('Actions'); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($monthlyAttendanceEntries as $monthlyAttendanceEntry): ?>
                            <tr>
                                <td class="text-center"><?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['id']); ?></td>
                                <td class="text-center">
                                    <?php echo $this->Html->link($monthlyAttendanceEntry['Employee']['name'], array('controller' => 'employees', 'action' => 'view', $monthlyAttendanceEntry['Employee']['id'])); ?>
                                </td>
                                <td class="text-center"><?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['official_attendence']); ?></td>
                                <td class="text-center"><?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['casual_leave']); ?></td>
                                <td class="text-center"><?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['sick_leave']); ?></td>
                                <td class="text-center"><?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['earned_leave']); ?></td>
                                <td class="text-center"><?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['maternity_leave']); ?></td>
                                <td class="text-center"><?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['total_attendance']); ?></td>
                                <td class="text-center"><?php echo h($monthlyAttendanceEntry['MonthlyAttendanceEntry']['panalty']); ?></td>
                                <td class="text-center">
                                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $monthlyAttendanceEntry['MonthlyAttendanceEntry']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'view')); ?>

                                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $monthlyAttendanceEntry['MonthlyAttendanceEntry']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'edit')); ?>


                                    <?php echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $monthlyAttendanceEntry['MonthlyAttendanceEntry']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $monthlyAttendanceEntry['MonthlyAttendanceEntry']['id'])); ?>
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