<style type="text/css">
    .a{
        display: none;
    }

    .b{
        display: inline;
    }
    .submit {
        margin-left: 0% !important;
    }
</style>
<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Monthly Others Enty'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Monthly Others Enty List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php
                echo $this->Form->create(false, array(
                    'url' => array('controller' => 'MonthlyOthersEnties', 'action' => 'admin_add'),
                    'id' => 'admin_index'
                ));
                ?>
                <br>
                <table style="width:310px">
                    <tr>
                        <th>Entry Type :</th>
                        <th><?php echo $this->Form->input('entryType', array('options' => $monthlyOthersEntiesSetting, 'class' => 'form-control', 'legend' => false, 'label' => false, 'style' => 'width:180px;')); ?></th>
                    </tr>
                </table>

                <?php //echo $this->Form->input('monthlyOthersEntiesSetting', array('class' => 'form-control', 'label' => false, 'style' => 'width:180px', 'empty' => array(0 => 'ALL')));  ?>
                <br>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <tr>
                            <th>Designation</th>
                            <th>Departments</th>
                            <th>Employee Name</th>
                            <th>Fiscal Year</th>
                            <th>Month Name</th>
                        </tr>
                        <tr>
                            <td >
                                <div class="form-group">
                                    <?php echo $this->Form->input('designation_id', array('class' => 'form-control', 'label' => false, 'style' => 'width:180px', 'empty' => array(0 => 'ALL'))); ?>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <?php echo $this->Form->input('department_id', array('class' => 'form-control', 'label' => false, 'style' => 'width:180px', 'empty' => array(0 => 'ALL'))); ?>
                                </div></td>
                            <td>
                                <div class="form-group">
                                    <?php echo $this->Form->input('employee_id', array('class' => 'form-control', 'label' => false, 'style' => 'width:180px', 'empty' => array(0 => 'ALL'))); ?>
                                </div></td>
                            <td>
                                <div class="form-group">
                                    <?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control', 'label' => false, 'style' => 'width:180px', 'empty' => array('' => 'Please Select Fiscal Year'))); ?>
                                </div></td>
                            <td>
                                <div class="form-group">
                                    <?php echo $this->Form->input('month_id', array('class' => 'form-control', 'label' => false, 'style' => 'width:180px', 'empty' => array('' => 'Please Select Month'))); ?>
                                </div></td>
                        </tr>

                    </table>
                    <br>
                    <?php echo $this->Form->submit('Search', array('class' => 'btn btn-large btn-primary')); ?>
                    <br>
                </div>
                <?php if (!empty($employeeList)): ?>
                    <div class="table-responsive">
                        <table class="table table-bordered" >
                            <thead>
                                <tr>
                                    <th > <a id="test1" style="cursor:pointer">Check All</a> </th>
                                    <th>Employee Code</th>
                                    <th>Employee Name</th>
                                    <th>Department</th>
                                    <th>Designation</th>
                                    <th>Contact No</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                //pr($employeeList);
                                foreach ($employeeList as $key => $employee) {
                                    ?>
                                    <tr>
                                        <th><input type="checkbox" class="form-control check_all" name="emp_id[]" value="<?php echo $employee_id=$employee['Employee']['id']; ?>"></th>
                                       <!-- <th scope="row"><?php //echo $this->Form->input('', array('name' => "emp_id[]", 'value'=>$key, 'class' => 'form-control check_all', 'label' => false, 'type' => 'checkbox'/* , 'checked' */));        ?></th>-->
                                        <td><?= $employee['Employee']['employeeID']; ?></td>
                                        <td><?= $employee['Employee']['employee_name_bengali']; ?></td>
                                        <td><?= $employee['Department']['name']; ?></td>
                                        <td><?= $employee['Designation']['name']; ?></td>
                                        <td><?= $employee['Employee']['contact_no']; ?></td>
                                        <td><?php echo $this->Form->input("amount", array('name' => "data[MonthlyOthersEnty][amount][$employee_id]", 'class' => 'form-control', 'label' => false, 'style' => 'width:180px')); ?></td>
                                    </tr>
                                    <?php
                                }
                                ?>
                            </tbody>
                        </table>
                        <br>
                        <?php echo $this->Form->submit('Save', array('class' => 'btn btn-large btn-primary')); ?>
                    </div>
                <?php endif; ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>
<script>
    $(window).load(function () {
        $.ajax({
            url: '<?php echo BASE_URL ?>admin/MonthlyOthersEnties/get_all_employee_list',
            type: 'POST',
            data: {},
            success: function (result) {
                result = $.parseJSON(result);
                //console.log(result);
                // for (var x in result.employee_list) {
                // console.log(result.employee_list[x]);


                // }


                /* var options = '<option value="0">Select current Basic</option>'
                 for (var x in result.increment_list) {
                 if (result.increment_list[x].Scale.id == catch_scale_id) {
                 options += '<option value=' + '"' + result.increment_list[x].Scale.id + '" selected>' + result.increment_list[x].Scale.grade_basic + '</option>'
                 } else {
                 options += '<option value=' + '"' + result.increment_list[x].Scale.id + '">' + result.increment_list[x].Scale.grade_basic + '</option>'
                 }
                 }*/
                // $('.scale_id').html(options);

            }
        });
    });
    $(document).ready(function () {
        $('#test1').click(function () {
            $('.icheckbox_minimal').toggleClass('checked');
            var checkBoxes = $(".check_all");
            checkBoxes.prop("checked", !checkBoxes.prop("checked"));

            //$('.check_all').prop('checked', true)

        });
    });
</script>