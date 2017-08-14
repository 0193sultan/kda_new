<?php
//echo '<pre>';print_r($employee);exit();
//pr($employee);
?>
<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php echo __('Employee'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Employee List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <?php
            //pr($employee);
            ?>
            <div class="box-body">
                <table id="Employees" class="table table-bordered table-striped">
                    <tbody>
                        <tr>		<td><strong><?php echo __('Id'); ?></strong></td>
                            <td>
                                <?php echo h($employee['Employee']['id']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Name'); ?></strong></td>
                            <td>
                                <?php echo h($employee['Employee']['name']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('EmployeeID'); ?></strong></td>
                            <td>
                                <?php echo h($employee['Employee']['employeeID']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Employee Grade'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($employee['EmployeeGrade']['name'], array('controller' => 'employee_grades', 'action' => 'view', $employee['EmployeeGrade']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Designation'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($employee['Designation']['name'], array('controller' => 'designations', 'action' => 'view', $employee['Designation']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Current Basic'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($employee['Scale']['grade_basic'], array('controller' => 'Scales', 'action' => 'view', $employee['Scale']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('New Basic'); ?></strong></td>
                            <td>
                                <?php echo h($employee['Employee']['new_basic']); ?>

                            </td>
                        </tr><tr>		<td><strong><?php echo __('Date Of Birth'); ?></strong></td>
                            <td>
                                <?php echo h($employee['Employee']['date_of_birth']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Joining Date'); ?></strong></td>
                            <td>
                                <?php echo h($employee['Employee']['joining_date']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Quota'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($employee['Quota']['name'], array('controller' => 'quotas', 'action' => 'view', $employee['Quota']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Employee Type'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($employee['EmployeeType']['name'], array('controller' => 'employee_types', 'action' => 'view', $employee['EmployeeType']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Religion'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($employee['Religion']['name'], array('controller' => 'religions', 'action' => 'view', $employee['Religion']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Job Status'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($employee['JobStatus']['name'], array('controller' => 'job_statuses', 'action' => 'view', $employee['JobStatus']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Current Posting Place'); ?></strong></td>
                            <td>
                                <?php echo h($employee['Location']['name']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Account Number'); ?></strong></td>
                            <td>
                                <?php echo h($employee['Employee']['account_number']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Bank'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($employee['BankInfo']['name'], array('controller' => 'BankInfos', 'action' => 'view', $employee['BankInfo']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Fathers Name'); ?></strong></td>
                            <td>
                                <?php echo h($employee['Employee']['fathers_name']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Mothers Name'); ?></strong></td>
                            <td>
                                <?php echo h($employee['Employee']['mothers_name']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Sex'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($employee['Sex']['name'], array('controller' => 'sexes', 'action' => 'view', $employee['Sex']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Marital Status'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($employee['MaritalStatus']['name'], array('controller' => 'marital_statuses', 'action' => 'view', $employee['MaritalStatus']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Spouse Name'); ?></strong></td>
                            <td>
                                <?php echo h($employee['Employee']['spouse_name']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Living Status'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($employee['LivingStatus']['name'], array('controller' => 'living_statuses', 'action' => 'view', $employee['LivingStatus']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Present Address'); ?></strong></td>
                            <td>
                                <?php echo h($employee['Employee']['present_address']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Permanent Address'); ?></strong></td>
                            <td>
                                <?php echo h($employee['Employee']['permanent_address']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Contact No'); ?></strong></td>
                            <td>
                                <?php echo h($employee['Employee']['contact_no']); ?>
                                &nbsp;
                            </td>
                        </tr>					</tbody>
                </table>
            </div>
        </div>

        <!-- child Information -->
        <div class="box box-primary" style="min-height: inherit">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php echo __('Employee Child'); ?></h3>
                <!-- <div class="box-tools pull-right">
                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Employee List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div> -->
            </div>
            <div class="box-body">
                <table id="Employees" class="table table-bordered table-striped">
                    <tbody>
                        <tr>
                            <th>Sl</th>
                            <th>Child Name</th>
                            <th>Dob</th>
                            <th>Education Status</th>
                            <th>File</th>
                        </tr>
                        <?php
                        $i = 1;
                        foreach ($employeechild as $data) {
                            ?>
                            <tr>
                                <td><?php echo $i++; ?></td>
                                <td><?= $data['EmployeeChild']['name'] ?></td>
                                <td><?= $data['EmployeeChild']['dob'] ?></td>
                                <td><?= $data['EduStatus']['name'] ?></td>
                                <td><a href="<?php echo BASE_URL ?>/app/webroot/uploads_files/birth_cirtificate/<?= $data['EmployeeChild']['file_path'] ?>">File</a></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Employee Allowence -->
        <div class="box box-primary" style="min-height: inherit">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php echo __('Employee Allowence'); ?></h3>

            </div>
            <div class="box-body">
                <table id="Employees" class="table table-bordered table-striped">
                    <tbody>
                        <tr class="text-center">
                            <td>House rent</td>
                            <td>Medical</td>
                            <td>Education</td>
                            <td>Convence</td>
                            <td>Tiffin</td>
                            <td>Wash</td>
                            <td>Mobile</td>
                            <td>D A</td>
                            <td>Charges</td>
                            <td>Others</td>
                            <td>PP</td>
                        </tr>
                        <tr class="text-center">
                            <td><?= $employee['EmployeeAllowance']['house_rent'] ?></td>
                            <td><?= $employee['EmployeeAllowance']['medical'] ?></td>
                            <td><?= $employee['EmployeeAllowance']['education'] ?></td>
                            <td><?= $employee['EmployeeAllowance']['convence'] ?></td>
                            <td><?= $employee['EmployeeAllowance']['tiffin'] ?></td>
                            <td><?= $employee['EmployeeAllowance']['wash'] ?></td>
                            <td><?= $employee['EmployeeAllowance']['mobile'] ?></td>
                            <td><?= $employee['EmployeeAllowance']['da'] ?></td>
                            <td><?= $employee['EmployeeAllowance']['charges'] ?><?= ($employee['EmployeeAllowance']['fix_charges'] == 0) ? '%' : 'Tk'; ?></td>
                            <td><?= $employee['EmployeeAllowance']['others'] ?></td>
                            <td><?= $employee['EmployeeAllowance']['pp'] ?></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>


        <!-- Employee Recovery -->

        <div class="box box-primary" style="min-height: inherit">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php echo __('Employee Recovery'); ?></h3>

            </div>
            <div class="box-body">
                <table id="Employees" class="table table-bordered table-striped">
                    <tbody>
                        <tr class="text-center">
                            <td>GPF</td>
                            <td>GPF Recovery</td>
                            <td>BF</td>
                            <td>GI</td>
                            <td>GI Recovery</td>
                            <td>Fixed House Rent</td>
                            <td>Water Supply</td>
                            <td>Tax</td>
                            <td>Tin Shed</td>
                        </tr>
                        <tr class="text-center">
                            <td><?= $employee['EmployeeRecovery']['gpf'] ?><?= ($employee['EmployeeRecovery']['gpf'] == 0) ? '%' : 'Tk'; ?></td>
                            <td><?= $employee['EmployeeRecovery']['gpf_recovery'] == 1 ? 'Yes' : 'No'; ?></td>
                            <td><?= $employee['EmployeeRecovery']['bf'] ?></td>
                            <td><?= $employee['EmployeeRecovery']['gi'] ?></td>
                            <td><?= $employee['EmployeeRecovery']['gi_recovery'] == 1 ? 'Yes' : 'No'; ?></td>
                            <td><?= $employee['EmployeeRecovery']['fixed_house_rent'] ?></td>
                            <td><?= $employee['EmployeeRecovery']['water_supply'] ?></td>
                            <td><?= $employee['EmployeeRecovery']['tax'] ?></td>
                            <td><?= $employee['EmployeeRecovery']['tin_shed'] ?></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

