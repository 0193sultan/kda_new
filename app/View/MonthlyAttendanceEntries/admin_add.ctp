
<style type="text/css">
    .select_width {
        width: 100%;
    }
    .u135_input {
        position: absolute;
        left: 0px;
        top: 0px;
        width: 72px;
        height: 25px;
        font-family: 'Arial Regular', 'Arial';
        font-weight: 400;
        font-style: normal;
        font-size: 13px;
        text-decoration: none;
        color: #000000;
        text-align: left;
    }

</style>

<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Monthly Attendance Entry'); ?></h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <?php echo $this->Form->create('MonthlyAttendanceEntry', array('role' => 'form')); ?>

                    <div class="col-md-offset-1 col-md-10" style="margin-top: 20px;">
                        <div class="table-responsive">
                            <table class="table  table-bordered">
                                <thead>

                                    <tr class="active">
                                        <th>Department Name</th>
                                        <th>Designation</th>
                                        <th>Emp. Name</th>
                                        <th>Fiscal Year</th>
                                        <th>Month</th>
                                        <th>Entry Type</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <?php echo $this->Form->input('departments', array('id' => 'department_name', 'label' => false, 'class' => 'form-control select_width', 'empty' => array('' => '------ Please Select ------'))); ?>
                                        </td>
                                        <td>
                                            <?php echo $this->Form->input('designations', array('id' => 'designation', 'label' => false, 'class' => 'form-control select_width', 'empty' => array('' => '------ Please Select ------'))); ?>
                                        </td>
                                        <td>
                                            <?php echo $this->Form->input('employee_id', array('id' => 'name', 'label' => false, 'class' => 'form-control select_width', 'empty' => array('' => '------ Please Select ------'))); ?>
                                        </td>
                                        <td style="width:180px">
                                            <?php echo $this->Form->input('fiscal_year_id', array('id' => 'fiscal_year', 'label' => false, 'class' => 'form-control', 'style' => 'width:90%', 'empty' => array('' => '------ Please Select ------'))); ?>
                                        </td>
                                        <td style="width:180px">
                                            <?php echo $this->Form->input('month_id', array('id' => 'month', 'label' => false, 'class' => 'form-control', 'style' => 'width:90%', 'empty' => array('' => '------ Please Select ------'))); ?>
                                        </td>
                                        <td style="width:180px">
                                            <?php echo $this->Form->input('monthly_attendance_entry_type_id', array('label' => false, 'class' => 'form-control', 'style' => 'width:90%', 'empty' => array('' => '------ Please Select ------'))); ?>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

            <!-- <p id="c"></p> -->
                    </div>

                    <div class="col-md-offset-1 col-md-11">
                        <h3>Attendance Entry</h3>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr class="active">
                                        <th>Employee Name</th>
                                        <th>Official Attendance</th>
                                        <th>Casual Leave</th>
                                        <th>Sick Leave</th>
                                        <th>Earned Leave</th>
                                        <th>Maternity leave</th>
                                        <th>Total Attendance</th>
                                        <th>Penalty</th>
                                        <th>New Basic</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td id="emName"></td>
                                        <td><?php echo $this->Form->input('official_attendence', array('type' => 'number', 'id' => 'official_attendence', 'label' => false, 'class' => 'form-control select_width', 'value' => 0)); ?>
                                        </td>
                                        <td><?php echo $this->Form->input('casual_leave', array('type' => 'number', 'id' => 'leave', 'label' => false, 'class' => 'form-control select_width leave', 'value' => 0)); ?>
                                        </td>
                                        <td><?php echo $this->Form->input('sick_leave', array('type' => 'number','label' => false, 'class' => 'form-control select_width leave', 'value' => 0)); ?></td>
                                        <td><?php echo $this->Form->input('earned_leave', array('type' => 'number','label' => false, 'class' => 'form-control select_width leave', 'value' => 0)); ?></td>
                                        <td><?php echo $this->Form->input('maternity_leave', array('type' => 'number','label' => false, 'class' => 'form-control select_width leave', 'value' => 0)); ?></td>
                                        <td><?php echo $this->Form->input('total_attendance', array('type' => 'number', 'id' => 'total_attendance','label' => false, 'class' => 'form-control select_width', 'value' => 0)); ?></td>
                                        <td><?php echo $this->Form->input('panalty', array('type' => 'number','label' => false, 'class' => 'form-control select_width', 'value' => 0)); ?></td>
                                        <td><?php echo $this->Form->input('new_basic', array('label' => false, 'class' => 'form-control select_width', 'value' => 0)); ?></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <br><br>
                        <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                    </div>
                    <?php echo $this->Form->end(); ?>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $('#month').change(function () {
        var fiscal_year_id = $('#fiscal_year option:selected').val();
        var month_id = $('#month option:selected').val();
        if (fiscal_year_id != '' && month_id != '') {
            get_working_days(fiscal_year_id, month_id);
        }

    });
    $('#fiscal_year').change(function () {
        var fiscal_year_id = $('#fiscal_year option:selected').val();
        var month_id = $('#month option:selected').val();
        if (fiscal_year_id != '' && month_id != 'select') {
            get_working_days(fiscal_year_id, month_id);
        }
    });
    //console.log('individualjjjj_total_qty');
    $(".leave").keyup(function () {

        var individual_total_qty = 0;
        $('.leave').each(function () {
            individual_total_qty = parseInt(individual_total_qty) + parseInt($(this).val());
        });
        console.log(individual_total_qty);
        var official_attendence = $('#official_attendence').val();
        if (official_attendence != 0) {
            $("#total_attendance").val(official_attendence - individual_total_qty);
        }
    });

    function get_working_days(fiscal_year_id, month_id) {

        // var parseGradeName = parseInt(gradeName);
        // console.log(gradeName);
        $.ajax({
            url: '<?php echo BASE_URL ?>admin/MonthlyAttendanceEntries/get_official_attendance',
            type: 'POST',
            data: {fiscal_year_id: fiscal_year_id, month_id: month_id},
            success: function (result) {
                //result = $.parseJSON(result);
                if (result != 0) {
                    $('#official_attendence').val(result);
                } else {
                    $('#official_attendence').val(0);
                }

                //  console.log(individual_total_qty);
                /*if (result != '') {
                 $('#official_attendence').val(result[0].MobileBillSetting.mobile_bill);                   //console.log(result);
                 } else {
                 $('#EmployeeAllowanceMobile').val(0);
                 }*/
            }
        });
    }


    var base_url = "<?php echo BASE_URL; ?>";
    $(document).ready(function () {
        $('#designation').change(function () {
            var department_name = $("#department_name option:selected").val();
            var designation = $("#designation option:selected").val();
            var employee = $("#employee option:selected").val();

            $.ajax({
                url: base_url + "MonthlyAttendanceEntries/get_call",
                method: "POST",
                data: {department_name: department_name, designation: designation, employee: employee},
                dataType: "text",
                success: function (data) {
                    $('#name').html(data);
                }
            });

        });

        //***************************************
        //fiscal year ajax code start here
        //***************************************

        $('#fiscal_year').change(function () {
            var fiscal_year = $("#fiscal_year option:selected").val();
            $.ajax({
                url: base_url + "MonthlyAttendanceEntries/get_months",
                method: "POST",
                data: {fiscal_year: fiscal_year},
                dataType: "text",
                success: function (data) {
                    $('#month').html(data);
                }
            });

        });

        //**********************************************
        //moth ajax code start here
        //**********************************************

        //                    $('#month').change(function () {
        //                        var month = $("#month option:selected").val();
        //                        $('#month_id').val(month); //for set it to hiddden input
        //                        $.ajax({
        //                            url: base_url + "MonthlyAttendanceEntries/attendance_entry_autoComplete",
        //                            method: "POST",
        //                            data: {month: month},
        //                            dataType: "text",
        //                            success: function (data) {
        //                                $('#official_attendence').val(data);
        //                                //$('#c').html(data);
        //                            }
        //                        });
        //
        //                    });

        //*******************************************
        //Auto complete Name field
        //*******************************************
        $('#name').change(function () {
            var name_id = $("#name option:selected").val();
            var name = $("#name option:selected").html();
            $('#emName').html(name);
            $('#employee_id').val(name_id);

        });



    });

</script>
<!-- End js code for onclick -->