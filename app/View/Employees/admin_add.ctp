<style>
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
    #parentTag{
        display: none;
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
                    <div class="col-sm-offset-1 col-sm-10">
                        <div class="row">
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
                                        <td><?php echo $this->Form->input('scale_id', array('class' => 'form-control scale_id', 'label' => false, 'options' => array('' => 'Select Grade Year First'))); ?></td>
                                        <td><?php echo $this->Form->label('joining_date', 'Joining Date :'); ?></td>
                                        <td><?php echo $this->Form->input('joining_date', array('class' => 'form-control datepicker', 'type' => 'text', 'label' => false)); ?></td>
                                    </tr>
                                    <tr>
                                       <!-- <td><?php //echo $this->Form->label('basic_id', 'Current Basic :');                                   ?></td>
                                        <td><?php //echo $this->Form->input('basic_id', array('class' => 'form-control basic_id', 'label' => false, 'options' => array('' => 'Select Grade Year First')));                                   ?></td>-->
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
                                        <td><?php echo $this->Form->label('religion_id', 'Religion :'); ?></td>
                                        <td><?php echo $this->Form->input('religion_id', array('class' => 'form-control', 'label' => false, 'empty' => array(0 => 'Please Select Religion'))); ?></td>
                                        <td><?php echo $this->Form->label('account_number', 'Account Number :'); ?></td>
                                        <td><?php echo $this->Form->input('account_number', array('class' => 'form-control', 'label' => false)); ?></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo $this->Form->label('location_id', 'location Name :'); ?></td>
                                        <td><?php echo $this->Form->input('location_id', array('class' => 'form-control', 'label' => false, 'empty' => array(0 => 'Please Select location'))); ?></td>
                                        <td><?php echo $this->Form->label('sex_id', 'Sex :'); ?></td>
                                        <td><?php echo $this->Form->input('sex_id', array('class' => 'form-control', 'label' => false, 'empty' => array(0 => 'Please Select Sex'))); ?></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo $this->Form->label('fathers_name', 'Father\'s Name :'); ?></td>
                                        <td><?php echo $this->Form->input('fathers_name', array('class' => 'form-control', 'label' => false)); ?></td>
                                        <td><?php echo $this->Form->label('marital_status_id', 'Marital Status :'); ?></td>
                                        <td><?php echo $this->Form->input('marital_status_id', array('class' => 'form-control', 'label' => false, 'empty' => array(0 => 'Please Select Marital Status'))); ?></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo $this->Form->label('mothers_name', 'Mother\'s Name :'); ?></td>
                                        <td><?php echo $this->Form->input('mothers_name', array('class' => 'form-control', 'label' => false)); ?></td>
                                        <td><?php echo $this->Form->label('spouse_name', 'Spouse Name :'); ?></td>
                                        <td><?php echo $this->Form->input('spouse_name', array('class' => 'form-control', 'label' => false)); ?></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo $this->Form->label('living_status_id', 'Living Status :'); ?></td>
                                        <td><?php echo $this->Form->input('living_status_id', array('class' => 'form-control', 'label' => false, 'empty' => array(0 => 'Please Select Living Status'))); ?></td>
                                        <td><?php echo $this->Form->label('child_number', 'Child Number :'); ?></td>
                                        <td>
                                            <?php
                                            echo $this->Form->input('child_number', array('class' => 'form-control child_number',
                                                //'id' => 'child-no',
                                                'label' => false,
                                                'options' => array("none", 1, 2)
                                                    )
                                            );
                                            ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><?php echo $this->Form->label('present_address', 'Present Address :'); ?></td>
                                        <td><?php echo $this->Form->input('present_address', array('class' => 'form-control', 'label' => false)); ?></td>
                                        <td><?php echo $this->Form->label('permanent_address', 'Permanent Address :'); ?></td>
                                        <td><?php echo $this->Form->input('permanent_address', array('class' => 'form-control', 'label' => false)); ?></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo $this->Form->label('contact_no', 'Contact No :'); ?></td>
                                        <td><?php echo $this->Form->input('contact_no', array('class' => 'form-control', 'label' => false)); ?></td>
                                        <td><?php echo $this->Form->label('festival_recovery', 'Festival Recovery :'); ?></td>
                                        <td><?php echo $this->Form->input('festival_recovery', array('class' => 'form-control', 'label' => false, 'options' => array("No", 'Yes'))); ?></td>
                                    </tr>
                                    <?php //echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary'));   ?>
                                </tbody>
                                <?php //echo $this->Form->end('save post');   ?>
                            </table>
                        </div>
                    </div>
                    <div class="row" id="parentTag">
                        <div id="child_info" class="col-sm-offset-2 col-md-8" style="margin-top:60px;">
                            <h3>child information </h3>

                            <table class="table table-bordered" id="child1">
                                <tbody>
                                    <tr>
                                        <td><?php echo $this->Form->label('EmployeeChild.name', '1st Child Name :'); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeChild.name', array('class' => 'form-control', 'label' => false, 'name' => 'data[EmployeeChild][name][]')); ?></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo $this->Form->label('EmployeeChild.dob', '1st Child Date of Birth :'); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeChild.dob', array('type' => 'text', 'class' => 'form-control datepicker', 'label' => false, 'name' => 'data[EmployeeChild][dob][]')); ?></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo $this->Form->label('EmployeeChild.edu_status_id', '1st Child Education Status :'); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeChild.edu_status_id', array('class' => 'form-control edu_status_1', 'label' => false, 'name' => 'data[EmployeeChild][edu_status_id][]')); ?></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo $this->Form->label('EmployeeChild.file', '1st Child Birth Cirtificate :'); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeChild.file', array('type' => 'file', 'class' => 'form-control', 'label' => false, 'name' => 'data[EmployeeChild][file][]')); ?></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-bordered" id="child2">
                                <tbody>
                                    <tr>
                                        <td><?php echo $this->Form->label('EmployeeChild.name', '2nd Child Name :'); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeChild.name', array('class' => 'form-control', 'label' => false, 'name' => 'data[EmployeeChild][name][]')); ?></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo $this->Form->label('EmployeeChild.dob', '2nd Child Date of Birth :'); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeChild.dob', array('type' => 'text', 'class' => 'form-control datepicker', 'label' => false, 'name' => 'data[EmployeeChild][dob][]')); ?></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo $this->Form->label('EmployeeChild.edu_status_id', '2nd Child Education Status :'); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeChild.edu_status_id', array('class' => 'form-control edu_status_2', 'label' => false, 'name' => 'data[EmployeeChild][edu_status_id][]')); ?></td>
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
                                        <td >Charges<br><?php echo $this->Form->checkbox('EmployeeAllowance.fix_charges', array('label' => false, 'div' => false, 'value' => '1', 'class' => 'fix_charges')); ?>&nbsp;&nbsp;<span>Fix charges</span></td>
                                        <td>Others</td>
                                        <td>PP</td>
                                    </tr>
                                    <tr class="text-center">
                                        <td><?php echo $this->Form->input('EmployeeAllowance.house_rent', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => '0')); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeAllowance.medical', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => '0')); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeAllowance.education', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => '0')); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeAllowance.convence', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => '0')); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeAllowance.tiffin', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => '0')); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeAllowance.wash', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => '0')); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeAllowance.mobile', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => '0')); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeAllowance.cycle', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => '0')); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeAllowance.da', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => '0')); ?></td>
                                        <td><div class="input-group"><?php echo $this->Form->input('EmployeeAllowance.charges', array('class' => 'form-control', 'label' => false, 'div' => false, 'style' => 'margin-left: 5px;', 'value' => '0')); ?><span class="input-group-addon fix_charges_per">%</span></div></td>
                                        <td><?php echo $this->Form->input('EmployeeAllowance.others', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => '0')); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeAllowance.pp', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => '0')); ?></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div id="employee_recover" class="col-sm-offset-1 col-sm-10">
                            <h3>Employee Recovery </h3>
                            <table class="table table-bordered">
                                <tbody>
                                    <tr class="text-center">
                                        <td>GPF Recovery</td>
                                        <td>GPF &nbsp;<br><?php echo $this->Form->checkbox('EmployeeRecovery.fix_gpf', array('label' => false, 'value' => '1', 'class' => 'form-control fix_gpf')); ?>&nbsp;<span>Fix GPF</span></td>
                                        <td>BF</td>
                                        <td>GI Recovery</td>
                                        <td>GI</td>
                                        <td>Fixed House Rent</td>
                                        <td>Water Supply</td>
                                        <td>Tax</td>
                                        <td>Tin Shed</td>
                                    </tr>
                                    <tr class="text-center">
                                        <td><?php echo $this->Form->input('EmployeeRecovery.gpf_recovery', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'default' => '1', 'options' => array("" => "Select", "1" => "YES", "0" => "NO"))); ?></td>
                                        <td><div class="input-group"><?php echo $this->Form->input('EmployeeRecovery.gpf', array('class' => 'form-control', 'label' => false, 'div' => false, 'style' => 'margin-left: 5px;', 'value' => 0)); ?><span class="input-group-addon fix_gpf_per">%</span></div></td>
                                        <td><?php echo $this->Form->input('EmployeeRecovery.bf', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => 0)); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeRecovery.gi_recovery', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'default' => '0', 'options' => array("" => "Select", "0" => "NO", "1" => "YES",))); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeRecovery.gi', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => 0)); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeRecovery.fixed_house_rent', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => 0)); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeRecovery.water_supply', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => 0)); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeRecovery.tax', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => 0)); ?></td>
                                        <td><?php echo $this->Form->input('EmployeeRecovery.tin_shed', array('class' => 'form-control', 'label' => false, 'style' => 'margin-left: 5px;', 'value' => 0)); ?></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br><br>
                    <div class="row">
                        <div class="col-sm-2">
                            <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                        </div>
                    </div>
                    <?php echo $this->Form->end(); ?>
                </div>

            </div>
        </div>
    </div>

    <script type="text/javascript">

        $(document).ready(function () {
            // getMeta('recovery_gi', '#EmployeeRecoveryGi');

            $('#EmployeeRecoveryGiRecovery').change(function () {
                var giStatus = $(this).val();
                if (giStatus == 1) {
                    getMeta('recovery_gi', '#EmployeeRecoveryGi');
                } else {
                    $('#EmployeeRecoveryGi').val(0)
                }
            });
            $(".edu_status").change(function () {

            })
            //$('#parentTag').hide();

            $(".child_number").change(function () {
                var childNumber = $(this).val();
                var edu_status_1 = $(".edu_status_1 option:selected").val();
                var edu_status_2 = $(".edu_status_2 option:selected").val();
                getedu('allowance_education', '#EmployeeAllowanceEducation', childNumber, edu_status_1, edu_status_2);
            });
            $(".edu_status_1").change(function () {
                var edu_status_1 = $(this).val();
                var childNumber = $(".child_number option:selected").val();
                var edu_status_2 = $(".edu_status_2 option:selected").val();
                getedu('allowance_education', '#EmployeeAllowanceEducation', childNumber, edu_status_1, edu_status_2);
            });
            $(".edu_status_2").change(function () {
                var edu_status_2 = $(this).val();
                var childNumber = $(".child_number option:selected").val();
                var edu_status_1 = $(".edu_status_1 option:selected").val();
                getedu('allowance_education', '#EmployeeAllowanceEducation', childNumber, edu_status_1, edu_status_2);
            });


            $('#EmployeeLivingStatusId').change(function () {
                //console.log('jjj');
                get_water_bills();
                house_rent();
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
            $('.fix_gpf').on('ifClicked', function (event) {
                $('.fix_gpf_per').toggle();
            });


            $('.grade').change(function () {
                var grade = $(this).val();
                var gradeName = $('#EmployeeEmployeeGradeId option:selected').text();
                var parseGradeName = parseInt(gradeName);
                // console.log(gradeName);
                $.ajax({
                    url: '<?php echo BASE_URL ?>admin/Employees/get_mobile_bills',
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

        function getedu(metaKey, id, childNumber, edu_status_1, edu_status_2) {
            $.ajax({
                url: '<?php echo BASE_URL ?>admin/Apis/getmeta/' + metaKey,
                type: 'POST',
                data: {},
                success: function (result) {
                    if (childNumber == 0) {
                        $(id).val(result * 0);
                        $('#parentTag').hide();
                    } else if (childNumber == 1) {
                        if (edu_status_1 == 1) {
                            $(id).val(result * 1);
                        } else if (edu_status_1 == 2) {
                            $(id).val(result * 0);
                        }
                        $('#parentTag').show();
                        $('#child1').show();
                        $('#child2').hide();
                    } else if (childNumber == 2) {
                        if (edu_status_1 == 1 && edu_status_2 == 1) {
                            $(id).val(result * 2);
                        } else if (edu_status_1 == 1 && edu_status_2 == 2) {
                            $(id).val(result * 1);
                        } else if (edu_status_1 == 2 && edu_status_2 == 1) {
                            $(id).val(result * 1);
                        } else if (edu_status_1 == 2 && edu_status_2 == 2) {
                            $(id).val(result * 0);
                        }
                        $('#parentTag').show();
                        $('#child1').show();
                        $('#child2').show();
                    }
                }
            });
        }


        function house_rent() {
            var location = $('#EmployeeLocationId option:selected').val();
            var basic = $('#EmployeeScaleId option:selected').text();
            var living_status = $('#EmployeeLivingStatusId option:selected').val();
            var gyear = 2015;
            if (living_status == 1) {
                $.ajax({
                    url: '<?php echo BASE_URL ?>admin/Apis/get_house_rent/' + parseInt(basic) + '/' + location + '/' + gyear,
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
            } else {
                $('#EmployeeAllowanceHouseRent').val(0);
            }
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



