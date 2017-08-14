<?php
// echo '<pre>';
// pr($this->request->data);
// echo '</pre>';
?><style>
    label {
        float: left;
        width: 80%;
        text-align: right;
        padding: 5px;
    }
    .form-control {
        float: left;
        width: 90%;
        font-size: 13px;
        height: 28px;
        padding: 5px;
        margin-left: 10px;
    }
    .input-group .form-control {
        float: left;
        width: 90%;
        font-size: 13px;
        height: 28px;
        padding: 5px;
        margin-left: 10px;
    }
</style>
<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Employee'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Employee List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('Employee', array('role' => 'form', 'class' => 'form', 'type' => 'file')); ?>
                <div class="row">
                    <div class="col-md-offset-1 col-sm-offset-1  col-lg-offset-1 col-md-10 col-sm-10 col-xs-12 col-lg-10">
                        <?php
                        //  pr($employeeGrades);
                        ?>
                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <td><?php echo $this->Form->label('name', 'Employee  Name :'); ?></td>
                                    <td><?php echo $this->Form->input('name', array('label' => false, 'class' => 'form-control')); ?></td>
                                    <td><?php echo $this->Form->label('employeeID', 'Employee ID :'); ?></td>
                                    <td><?php echo $this->Form->input('employeeID', array('label' => false, 'class' => 'form-control')); ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('employee_name_bengali', 'Employee Name Bengali:'); ?></td>
                                    <td><?php echo $this->Form->input('employee_name_bengali', array('label' => false, 'class' => 'form-control')); ?></td>
                                    <td><?php echo $this->Form->label('designation_id', 'Designation :'); ?></td>
                                    <td><?php echo $this->Form->input('designation_id', array('class' => 'form-control', 'label' => false, 'empty' => array(0 => 'Please Select Designation'))); ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('employee_grade_id', 'Employee Grade:'); ?></td>
                                    <td><?php echo $this->Form->input('employee_grade_id', array('class' => 'form-control grade', 'label' => false, 'options' => array('' => 'Select Grade', $employeeGrades))); ?></td>
                                    <td><?php echo $this->Form->label('new_basic', 'New Basic :'); ?></td>
                                    <td><?php echo $this->Form->input('new_basic', array('class' => 'form-control', 'label' => false)); ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('scale_id', 'Current Basic :'); ?></td>
                                    <td><?php echo $this->Form->input('scale_id', array('class' => 'form-control scale_id', 'label' => false, 'options' => array('' => 'Select Grade Year First'))); ?>
                                        <input type="hidden" value="<?= $scale_option[0] ?>" id="catch_scale_id">
                                    </td>
                                    <td><?php echo $this->Form->label('joining_date', 'Joining Date :'); ?></td>
                                    <td><?php echo $this->Form->input('joining_date', array('class' => 'form-control datepicker', 'type' => 'text', 'label' => false)); ?></td>
                                </tr>

                                <tr>
                                   <!-- <td><?php //echo $this->Form->label('basic_id', 'Current Basic :');                   ?></td>
                                    <td><?php //echo $this->Form->input('basic_id', array('class' => 'form-control basic_id', 'label' => false, 'options' => array('' => 'Select Grade Year First')));                   ?></td>-->
                                    <td><?php echo $this->Form->label('department_id', 'Department :'); ?></td>
                                    <td><?php echo $this->Form->input('department_id', array('class' => 'form-control', 'label' => false, 'empty' => array(0 => 'Please Select Department'))); ?></td>
                                    <td><?php echo $this->Form->label('employee_type_id', 'Employee Type :'); ?></td>
                                    <td><?php echo $this->Form->input('employee_type_id', array('class' => 'form-control', 'label' => false, 'empty' => array(0 => 'Please Select Employee Type'))); ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('date_of_birth', 'Date of Birth :'); ?></td>
                                    <td><?php echo $this->Form->input('date_of_birth', array('class' => 'form-control datepicker', 'type' => 'text', 'label' => false)); ?></td>
                                    <td><?php echo $this->Form->label('job_status_id', 'Job Status :'); ?></td>
                                    <td><?php echo $this->Form->input('job_status_id', array('class' => 'form-control', 'label' => false)); ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('quota_id', 'Quota Id :'); ?></td>
                                    <td><?php echo $this->Form->input('quota_id', array('class' => 'form-control', 'label' => false, 'empty' => array(0 => 'Please Select Quota'))); ?></td>
                                    <td><?php echo $this->Form->label('bank_info_id', 'Bank Name :'); ?></td>
                                    <td><?php echo $this->Form->input('bank_info_id', array('class' => 'form-control', 'label' => false, 'empty' => array(0 => 'Please Select Bank Name'))); ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('location_id', 'location Name :'); ?></td>
                                    <td><?php echo $this->Form->input('location_id', array('class' => 'form-control', 'label' => false, 'empty' => array(0 => 'Please Select location'))); ?></td>
                                    <td><?php echo $this->Form->label('sex_id', 'Sex :'); ?></td>
                                    <td><?php echo $this->Form->input('sex_id', array('class' => 'form-control', 'label' => false, 'empty' => array(0 => 'Please Select Sex'))); ?></td>

                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('marital_status_id', 'Marital Status :'); ?></td>
                                    <td><?php echo $this->Form->input('marital_status_id', array('class' => 'form-control', 'label' => false, 'empty' => array(0 => 'Please Select Marital Status'))); ?></td>
                                    <td><?php echo $this->Form->label('spouse_name', 'Spouse Name :'); ?></td>
                                    <td><?php echo $this->Form->input('spouse_name', array('class' => 'form-control', 'label' => false)); ?></td>

                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('present_address', 'Present Address :'); ?></td>
                                    <td><?php echo $this->Form->input('present_address', array('class' => 'form-control', 'label' => false)); ?></td>
                                    <td><?php echo $this->Form->label('permanent_address', 'Permanent Address :'); ?></td>
                                    <td><?php echo $this->Form->input('permanent_address', array('class' => 'form-control', 'label' => false)); ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('living_status_id', 'Living Status :'); ?></td>
                                    <td><?php echo $this->Form->input('living_status_id', array('class' => 'form-control', 'label' => false, 'empty' => array(0 => 'Please Select Living Status'))); ?></td>
                                    <td><?php echo $this->Form->label('child_number', 'Child Number :'); ?></td>
                                    <td>
                                        <?php
                                        echo $this->Form->input('child_number', array('class' => 'form-control',
                                            'id' => 'child-no',
                                            'label' => false,
                                            'options' => array("none", 1, 2)
                                                )
                                        );
                                        ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('contact_no', 'Contact No :'); ?></td>
                                    <td><?php echo $this->Form->input('contact_no', array('class' => 'form-control', 'label' => false)); ?></td>
                                </tr>
                                <?php //echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary'));  ?>
                            </tbody>
                            <?php //echo $this->Form->end('save post'); ?>
                        </table>
                    </div>
                </div>
                <div class="row" id="parentTag">

                    <div id="child_info" class="col-sm-offset-2 col-sm-8" style="margin-top:60px;">
                        <h3>child information </h3>
                        <?php
                        $i = 0;
                        for ($i = 0; $i < 2; $i++) {
                            $file_path[$i] = '';
                            $id[$i] = '';
                            $name[$i] = '';
                            $dob[$i] = '';
                            $edu_status_id[$i] = '';
                        }
                        $i = 0;
                        foreach ($this->request->data['EmployeeChild'] as $employeechild) {
                            $file_path[$i] = $this->request->data['EmployeeChild'][$i]['file_path'];
                            $id[$i] = $this->request->data['EmployeeChild'][$i]['id'];
                            $name[$i] = $this->request->data['EmployeeChild'][$i]['name'];
                            $dob[$i] = date('d-m-Y', strtotime($this->request->data['EmployeeChild'][$i]['dob']));
                            $edu_status_id[$i] = $this->request->data['EmployeeChild'][$i]['file_path'];
                            $i++;
                        }
                        ?>
                        <table class="table table-bordered" id="child1">
                            <tbody>
                                <tr>
                                    <?php echo $this->Form->input('EmployeeChild.file_path', array('class' => 'hidden', 'type' => 'hidden', 'label' => false, 'name' => 'data[EmployeeChild][file_path][]', 'default' => $file_path[0])); ?>
                                    <?php echo $this->Form->input('EmployeeChild.id', array('class' => 'hidden', 'type' => 'hidden', 'label' => false, 'name' => 'data[EmployeeChild][id][]', 'default' => $id[0])); ?>
                                    <td><?php echo $this->Form->label('EmployeeChild.name', '1st Child Name :'); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeChild.name', array('class' => 'form-control', 'label' => false, 'name' => 'data[EmployeeChild][name][]', 'default' => $name[0])); ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('dob', '1st Child Date of Birth :'); ?></td>
                                    <td><?php echo $this->Form->input('dob', array('type' => 'text', 'class' => 'form-control datepicker', 'label' => false, 'name' => 'data[EmployeeChild][dob][]', 'default' => $dob[0])); ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('edu_status_id', '1st Child Education Status :'); ?></td>
                                    <td><?php echo $this->Form->input('edu_status_id', array('class' => 'form-control', 'label' => false, 'name' => 'data[EmployeeChild][edu_status_id][]', 'options' => $eduStatuses, 'default' => $edu_status_id[0])); ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('file', '1st Child Birth Cirtificate :'); ?></td>
                                    <td><?php echo $this->Form->input('file', array('type' => 'file', 'class' => 'form-control', 'label' => false, 'name' => 'data[EmployeeChild][file][]')); ?></td>
                                </tr>
                            </tbody>
                        </table>
                        <table class="table table-bordered" id="child2">
                            <tbody>
                                <tr>
                                    <?php echo $this->Form->input('EmployeeChild.file_path', array('class' => 'hidden', 'type' => 'hidden', 'label' => false, 'name' => 'data[EmployeeChild][file_path][]', 'default' => $file_path[1])); ?>
                                    <?php echo $this->Form->input('EmployeeChild.id', array('class' => 'hidden', 'type' => 'hidden', 'label' => false, 'name' => 'data[EmployeeChild][id][]', 'default' => $id[1])); ?>
                                    <td><?php echo $this->Form->label('EmployeeChild.name', '2nd Child Name :'); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeChild.name', array('class' => 'form-control', 'label' => false, 'name' => 'data[EmployeeChild][name][]', 'default' => $name[1])); ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('EmployeeChild.dob', '2nd Child Date of Birth :'); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeChild.dob', array('type' => 'text', 'class' => 'form-control datepicker', 'label' => false, 'name' => 'data[EmployeeChild][dob][]', 'default' => $dob[1])); ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('EmployeeChild.edu_status_id', '2nd Child Education Status :'); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeChild.edu_status_id', array('class' => 'form-control', 'label' => false, 'name' => 'data[EmployeeChild][edu_status_id][]', 'default' => $edu_status_id[1])); ?></td>
                                </tr>
                                <tr>
                                    <td><?php echo $this->Form->label('EmployeeChild.file', '2nd Child Birth Cirtificate :'); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeChild.file', array('type' => 'file', 'class' => 'form-control', 'label' => false, 'name' => 'data[EmployeeChild][file][]')); ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div id="employee_allowence" class="col-md-offset-1 col-sm-offset-1  col-lg-offset-1 col-md-10 col-sm-10 col-xs-12 col-lg-10">
                        <h3>Employee Allowance </h3>
                        <table class="table table-bordered">
                            <tbody style="background: #ccc;">
                                <tr class="text-center">
                                    <td>House rent</td>
                                    <td>Medical</td>
                                    <td>Education</td>
                                    <td>Convence</td>
                                    <td>Tiffin</td>
                                    <td>Wash</td>
                                    <td>Mobile</td>
                                    <td>Cycle</td>
                                    <td>D A</td>
                                    <td>Charges<br><?php echo $this->Form->checkbox('EmployeeAllowance.fix_charges', array('type' => 'checkbox', 'class' => 'form-control fix_charges', 'label' => false)); ?><span>Fix Charges</span></td>
                                    <td>Others</td>
                                    <td>PP</td>
                                </tr>
                                <tr class="text-center">
                                    <?php echo $this->Form->input('EmployeeAllowance.id', array('class' => 'hidden', 'type' => 'hidden', 'label' => false, 'style' => 'margin-left: 5px;')); ?>
                                    <td><?php echo $this->Form->input('EmployeeAllowance.house_rent', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeAllowance.medical', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeAllowance.education', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeAllowance.convence', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeAllowance.tiffin', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeAllowance.wash', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeAllowance.mobile', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeAllowance.cycle', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => '0')); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeAllowance.da', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                    <td><div class="input-group"><?php echo $this->Form->input('EmployeeAllowance.charges', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?><span class="input-group-addon fix_charges_per">%</span></td>
                                    <td><?php echo $this->Form->input('EmployeeAllowance.others', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeAllowance.pp', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div id="employee_recover" class="col-md-offset-1 col-sm-offset-1  col-lg-offset-1 col-md-10 col-sm-10 col-xs-12 col-lg-10">
                        <h3>Employee Recovery </h3>
                        <table class="table table-bordered">
                            <tbody>
                                <tr class="text-center">
                                    <td>GPF <br><?php echo $this->Form->checkbox('EmployeeRecovery.fix_gpf', array('label' => false, 'value' => '1', 'class' => 'fix_gpf form-control')); ?>&nbsp;<span>Fix GPF</span></td>
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
                                    <?php echo $this->Form->input('EmployeeRecovery.id', array('class' => 'hidden', 'type' => 'hidden', 'label' => false, 'style' => 'margin-left: 5px;')); ?>
                                    <td><div class="input-group"><?php echo $this->Form->input('EmployeeRecovery.gpf', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'div' => false)); ?><span class="input-group-addon fix_gpf_per">%</span></td>
                                    <td><?php echo $this->Form->input('EmployeeRecovery.gpf_recovery', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'options' => array("" => "Select", "1" => "YES", "0" => "NO"))); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeRecovery.bf', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeRecovery.gi_recovery', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'options' => array("" => "Select", "0" => "NO", "1" => "YES"))); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeRecovery.gi', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeRecovery.fixed_house_rent', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeRecovery.water_supply', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeRecovery.tax', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                    <td><?php echo $this->Form->input('EmployeeRecovery.tin_shed', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;')); ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    $(window).load(function () {
        var grade_id = $('#EmployeeEmployeeGradeId option:selected').val();
        var catch_scale_id = $('#catch_scale_id').val();
        //console.log(catch_scale_id);
        $.ajax({
            url: '<?php echo BASE_URL ?>admin/employees/get_increment_list',
            type: 'POST',
            data: {grade_id: grade_id},
            success: function (result) {
                result = $.parseJSON(result);
                //console.log(result);
                var options = '<option value="0">Select current Basic</option>'
                for (var x in result.increment_list) {
                    if (result.increment_list[x].Scale.id == catch_scale_id) {
                        options += '<option value=' + '"' + result.increment_list[x].Scale.id + '" selected>' + result.increment_list[x].Scale.grade_basic + '</option>'
                    } else {
                        options += '<option value=' + '"' + result.increment_list[x].Scale.id + '">' + result.increment_list[x].Scale.grade_basic + '</option>'
                    }
                }
                $('.scale_id').html(options);

            }
        });
    });
    $(document).ready(function () {

        $('#EmployeeRecoveryGiRecovery').change(function () {
            var giStatus = $(this).val();
            if (giStatus == 1) {
                getMeta('recovery_gi', '#EmployeeRecoveryGi');
            } else {
                $('#EmployeeRecoveryGi').val(0)
            }
        });

        // console.log(childNumber);
        function child_number(childNumber) {
            if (childNumber == 0) {
                $('#parentTag').hide();
            } else if (childNumber == 1) {
                $('#parentTag').show();
                $('#child1').show();
                $('#child2').hide();
            } else {
                $('#parentTag').show();
                $('#child2').show();
            }
            getedu('allowance_education', '#EmployeeAllowanceEducation', childNumber);
        }
        child_number($('#child-no option:selected').val());
        // $('#parentTag').hide();
        $('#child-no').change(function () {
            var childNumber = $('#child-no option:selected').val();
            child_number(childNumber);
            getedu('allowance_education', '#EmployeeAllowanceEducation', childNumber);


        });

        $('#EmployeeLivingStatusId').change(function () {
            get_water_bills();
        });


        $('#EmployeeScaleId').change(function () {
            get_tax();
            house_rent();
        });

        $('#EmployeeLocationId').change(function () {
            get_tax();
            house_rent();
        });
        $('.grade').change(function () {
            get_water_bills();
            house_rent();
            getMeta('allowance_medical', '#EmployeeAllowanceMedical');

            var grade = parseInt($('#EmployeeEmployeeGradeId option:selected').text());
            if (grade >= 11 && grade <= 20) {
                getMeta('allowance_convence', '#EmployeeAllowanceConvence');
                getMeta('allowance_tiffin', '#EmployeeAllowanceTiffin');
            } else {
                $('#EmployeeAllowanceConvence').val(0);
                $('#EmployeeAllowanceTiffin').val(0);
            }
            getMeta('allowance_medical', '#EmployeeAllowanceMedical');
            getMeta('recovery_beneficiary_fund', '#EmployeeRecoveryBf');
            //getMeta('recovery_gi', '#EmployeeRecoveryGi');

        });
        $('.fix_charges').on('ifClicked', function (event) {
            $('.fix_charges_per').toggle();
        });
        if ($('.fix_charges').is(':checked')) {
            $('.fix_charges_per').hide();
        } else {
            $('.fix_charges_per').show();
        }
        $('.fix_gpf').on('ifClicked', function (event) {
            $('.fix_gpf_per').toggle();
        });
        if ($('.fix_gpf').is(':checked')) {
            $('.fix_gpf_per').hide();
        } else {
            $('.fix_gpf_per').show();
        }
        $('.grade').change(function () {
            var grade = $(this).val();
            var gradeName = $('#EmployeeEmployeeGradeId option:selected').text();
            var parseGradeName = parseInt(gradeName);
            // console.log(gradeName);
            $.ajax({
                url: '<?php echo BASE_URL ?>admin/employees/get_mobile_bills',
                type: 'POST',
                data: {gradeName: gradeName},
                success: function (result) {
                    result = $.parseJSON(result);
                    if (result != '') {
                        $('#EmployeeAllowanceMobile').val(result[0].MobileBillSetting.mobile_bill);                   //console.log(result);
                    } else {
                        $('#EmployeeAllowanceMobile').val(0);
                    }
                }
            });
            $.ajax({
                url: '<?php echo BASE_URL ?>admin/employees/get_increment_list',
                type: 'POST',
                data: {grade_id: grade},
                success: function (result) {
                    result = $.parseJSON(result);
                    //console.log(result);
                    var options = '<option value="0">Select current Basic</option>'
                    for (var x in result.increment_list) {
                        var y = parseInt(x) + 1;
                        // console.log(result.increment_list[x].Scale.grade_basic);
                        options += '<option value=' + '"' + result.increment_list[x].Scale.id + '">' + result.increment_list[x].Scale.grade_basic + '</option>'
                    }
                    $('.scale_id').html(options);
                    var scale = '';
                    /*if (result.increment_range[0].min == result.increment_range[0].max) {
                     scale = result.increment_range[0].min;
                     } else
                     scale = result.increment_range[0].min + '-' + result.increment_range[0].max;
                     $('.scale').val(scale);*/
                }
            });

        });
    });


    function getMeta(metaKey, id) {
        $.ajax({
            url: '<?php echo BASE_URL ?>admin/Apis/getmeta/' + metaKey,
            type: 'POST',
            data: {},
            success: function (result) {
                //result = $.parseJSON(result);
                //console.log(childNumber);
                //console.log(result);
                $(id).val(result);
            }
        });
    }

    function getedu(metaKey, id, childNumber) {
        $.ajax({
            url: '<?php echo BASE_URL ?>admin/Apis/getmeta/' + metaKey,
            type: 'POST',
            data: {},
            success: function (result) {
                //result = $.parseJSON(result);
                //console.log(childNumber);
                //console.log(result);
                $(id).val(result * childNumber);
            }
        });
    }


    function house_rent() {
        var location = $('#EmployeeLocationId option:selected').val();
        var basic = $('#EmployeeScaleId option:selected').text();
        var gyear = 2015;
        $.ajax({
            url: '<?php echo BASE_URL ?>admin/Apis/get_house_rent/' + basic + '/' + location + '/' + gyear,
            type: 'POST',
            data: {},
            success: function (result) {
                //result = $.parseJSON(result);
                if (result != -200) {
                    $('#EmployeeAllowanceHouseRent').val(result);
                } else {
                    $('#EmployeeAllowanceHouseRent').val(0);
                }


            }
        });
    }

    function get_tax() {
        var location = $('#EmployeeLocationId option:selected').val();
        var basic_salary = $('#EmployeeScaleId option:selected').text();
        $.ajax({
            url: '<?php echo BASE_URL ?>admin/Apis/get_tax/' + basic_salary + '/' + location,
            type: 'POST',
            data: {},
            success: function (result) {
                $('#EmployeeRecoveryTax').val(result);
            }
        });
    }
    function get_water_bills() {
        var grade = $('#EmployeeEmployeeGradeId option:selected').text();
        var living_status = $('#EmployeeLivingStatusId option:selected').val();
        $.ajax({
            url: '<?php echo BASE_URL ?>admin/Apis/get_water_bills/' + grade + '/' + living_status,
            type: 'POST',
            data: {},
            success: function (result) {
                $('#EmployeeRecoveryWaterSupply').val(result);
            }
        });
    }
</script>
<!--<script type="text/javascript">
$(document).ready(function(){
    if($('.fix_charges').is(':checked')){
        $('.fix_charges_per').hide();
    }
    else {
        $('.fix_charges_per').show();
    }
    if($('.fix_gpf').is(':checked')){
        $('.fix_gpf_per').hide();
    }
    else {
        $('.fix_gpf_per').show();
    }
     $('.fix_charges').on('ifClicked', function (event) {
    $('.fix_charges_per').toggle();
});
$('.fix_gpf').on('ifClicked', function (event) {
    $('.fix_gpf_per').toggle();
});
$('.grade').change(function(){
var grade=$(this).val();
$.ajax({
    url:'<?php //echo BASE_URL                 ?>admin/employees/get_increment_list',
    type:'POST',
    data:{grade_id:grade},
    success:function(result){
      result=$.parseJSON(result);
        var options='<option value="0">Select current Basic</option>'
        for(var x in result.increment_list){
            options+='<option value='+'"'+x+'">'+result.increment_list[x]+'</option>'
        }
        $('.basic_id').html(options);
        var scale='';
        if(result.increment_range[0].min==result.increment_range[0].max){
            scale=result.increment_range[0].min;
        }
        else
        scale=result.increment_range[0].min+'-'+result.increment_range[0].max;
        $('.scale').val(scale);
    }
});
});
});
</script>

</script>
<script type="text/javascript">
$(document).ready(function(){
    $('#child_info').hide();
    $('#child-no').change(function(){
       $('#child_info').show();
       var child_no=$(this).val();
       var i;
       for(i=2;i<=child_no;i++){
        $('#child_info_reg').clone().appendTo('#child_info');
        $('.datepicker').datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,
            todayHighlight: true
        });
       }
   });
});
</script> -->