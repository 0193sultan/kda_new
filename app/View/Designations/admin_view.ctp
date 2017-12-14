<div class="row">
    <div class="col-xs-12">		
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php echo __('Designation'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Designation List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <table id="Designations" class="table table-bordered table-striped">
                    <tbody>
                        <tr>		<td><strong><?php echo __('Id'); ?></strong></td>
                            <td>
                                <?php echo h($designation['Designation']['id']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Name'); ?></strong></td>
                            <td>
                                <?php echo h($designation['Designation']['name']); ?>
                                &nbsp;
                            </td>
                        </tr>					</tbody>
                </table>
            </div>
        </div>


        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><?php echo __('Related Employees'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link('<i class="glyphicon glyphicon-plus"></i> ' . __('New Employee'), array('controller' => 'employees', 'action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); ?>					</div><!-- /.actions -->
            </div>
            <?php if (!empty($designation['Employee'])): ?>

                <div class="box-body table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th class="text-center"><?php echo __('Id'); ?></th>
                                <th class="text-center"><?php echo __('Name'); ?></th>
                                <th class="text-center"><?php echo __('EmployeeID'); ?></th>
                                <th class="text-center"><?php echo __('Employee Grade Id'); ?></th>
                                <th class="text-center"><?php echo __('Scale Id'); ?></th>
                                <th class="text-center"><?php echo __('Designation Id'); ?></th>
                                <th class="text-center"><?php echo __('Basic Id'); ?></th>
                                <th class="text-center"><?php echo __('New Basic Id'); ?></th>
                                <th class="text-center"><?php echo __('Date Of Birth'); ?></th>
                                <th class="text-center"><?php echo __('Joining Date'); ?></th>
                                <th class="text-center"><?php echo __('Quota Id'); ?></th>
                                <th class="text-center"><?php echo __('Employee Type Id'); ?></th>
                                <th class="text-center"><?php echo __('Religion Id'); ?></th>
                                <th class="text-center"><?php echo __('Job Status Id'); ?></th>
                                <th class="text-center"><?php echo __('Current Posting Place'); ?></th>
                                <th class="text-center"><?php echo __('Account Number'); ?></th>
                                <th class="text-center"><?php echo __('Bank Id'); ?></th>
                                <th class="text-center"><?php echo __('Fathers Name'); ?></th>
                                <th class="text-center"><?php echo __('Mothers Name'); ?></th>
                                <th class="text-center"><?php echo __('Sex Id'); ?></th>
                                <th class="text-center"><?php echo __('Marital Status Id'); ?></th>
                                <th class="text-center"><?php echo __('Spouse Name'); ?></th>
                                <th class="text-center"><?php echo __('Living Status Id'); ?></th>
                                <th class="text-center"><?php echo __('Present Address'); ?></th>
                                <th class="text-center"><?php echo __('Permanent Address'); ?></th>
                                <th class="text-center"><?php echo __('Contact No'); ?></th>
                                <th class="text-center"><?php echo __('Actions'); ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $i = 0;
                            foreach ($designation['Employee'] as $employee):
                                ?>
                                <tr>
                                    <td class="text-center"><?php echo $employee['id']; ?></td>
                                    <td class="text-center"><?php echo $employee['name']; ?></td>
                                    <td class="text-center"><?php echo $employee['employeeID']; ?></td>
                                    <td class="text-center"><?php echo $employee['employee_grade_id']; ?></td>
                                    <td class="text-center"><?php echo $employee['scale_id']; ?></td>
                                    <td class="text-center"><?php echo $employee['designation_id']; ?></td>
                                    <td class="text-center"><?php echo $employee['basic_id']; ?></td>
                                    <td class="text-center"><?php echo $employee['new_basic_id']; ?></td>
                                    <td class="text-center"><?php echo $employee['date_of_birth']; ?></td>
                                    <td class="text-center"><?php echo $employee['joining_date']; ?></td>
                                    <td class="text-center"><?php echo $employee['quota_id']; ?></td>
                                    <td class="text-center"><?php echo $employee['employee_type_id']; ?></td>
                                    <td class="text-center"><?php echo $employee['religion_id']; ?></td>
                                    <td class="text-center"><?php echo $employee['job_status_id']; ?></td>
                                    <td class="text-center"><?php echo $employee['current_posting_place']; ?></td>
                                    <td class="text-center"><?php echo $employee['account_number']; ?></td>
                                    <td class="text-center"><?php echo $employee['bank_id']; ?></td>
                                    <td class="text-center"><?php echo $employee['fathers_name']; ?></td>
                                    <td class="text-center"><?php echo $employee['mothers_name']; ?></td>
                                    <td class="text-center"><?php echo $employee['sex_id']; ?></td>
                                    <td class="text-center"><?php echo $employee['marital_status_id']; ?></td>
                                    <td class="text-center"><?php echo $employee['spouse_name']; ?></td>
                                    <td class="text-center"><?php echo $employee['living_status_id']; ?></td>
                                    <td class="text-center"><?php echo $employee['present_address']; ?></td>
                                    <td class="text-center"><?php echo $employee['permanent_address']; ?></td>
                                    <td class="text-center"><?php echo $employee['contact_no']; ?></td>
                                    <td class="text-center">
                                        <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('controller' => 'employees', 'action' => 'view', $employee['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'view')); ?>
                                        <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('controller' => 'employees', 'action' => 'edit', $employee['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'edit')); ?>
                                        <?php echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('controller' => 'employees', 'action' => 'delete', $employee['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $employee['id'])); ?>
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

