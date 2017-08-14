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
<?php
//pr($employeeData);
?>
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
                <?php
                echo $this->Form->create('salarysheets', array('role' => 'form'));
                // pr($fiscalYearData);
                ?>
                <div  class="row">
                    <div class=" col-sm-12">
                        <table>
                            <tr>
                                <td><h5 class="box-title">Year :</h5></td>
                                <td><?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:200px', 'options' => array('' => 'Select Year', $fiscalYearData))); ?></td>
                                <td><h5 class="box-title">&nbsp;&nbsp;&nbsp;&nbsp;Month :</h5></td>
                                <td><?php echo $this->Form->input('month_id', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:200px')); ?></td>
                            </tr>
                        </table>
                        <br>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th  style="width: 20px">#</th>
                                <th>Employee Name</th>
                                <th>Department name</th>
                                <th>Designation</th>
                                <th>Current Basic</th>
                                <th>Code</th>
                                <th>Present Address</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                           // pr($employeeData);
                            foreach ($employeeData as $key => $employee) {
                                $emp_id = $employee['Employee']['id'];
                                ?>
                                <tr>
                                    <th scope="row"><?php echo $this->Form->input('', array('name' => "employee_id[$emp_id]", 'class' => 'form-control', 'label' => false, 'type' => 'checkbox', 'checked')); ?></th>
                                    <td><?php echo $employee['Employee']['name'] ?></td>
                                    <td><?php echo $employee['Department']['name'] ?></td>
                                    <td><?php echo $employee['Designation']['name'] ?></td>
                                    <td><?php echo $employee['Scale']['grade_basic'] ?></td>
                                    <td><?php echo $employee['Employee']['employeeID'] ?></td>
                                    <td><?php echo $employee['Employee']['present_address'] ?></td>
                                </tr>
                                <?php
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
                <br><br>
                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>

            </div>
        </div>
    </div>
</div>
<script>
    $('#salarysheetsFiscalYearId').change(function () {
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
                $('#salarysheetsMonthId').html(options);
                //for (var x in result) {
                // console.log(result.increment_list[x].Scale.grade_basic);
                //options += '<option value=' + '"' + result.increment_list[x].Scale.id + '">' + result.increment_list[x].Scale.grade_basic + '</option>'
                //}
                //$('.scale_id').html(options);
                /*if (result != '') {
                 $('#EmployeeAllowanceMobile').val(result[0].MobileBillSetting.mobile_bill); //console.log(result);
                 } else {
                 $('#EmployeeAllowanceMobile').val(0);
                 }*/
            }
        });
    });
</script>