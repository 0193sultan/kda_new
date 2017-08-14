<?php
//pr($sal);
?>

<style type="text/css">
    .select_width
    {
        width : 100px;
    }
</style>
<div class="box-body">		

    <table class="table table-bordered table-striped" style="width: 50%;" align="center">
        <?php
        echo $this->Form->create(false, array(
            'url' => array('controller' => 'SalaryCertificates', 'action' => 'admin_index'),
            'id' => 'admin_index'
        ));
        ?>
        <tr>
            <td>Department Name</td>
            <td>Designation</td>
            <td>Employee Name</td>
            <td>Fisal Year</td>
        </tr>

        <tr>
            <td>
                <?php
                $department = array('All') + $departments;
                echo $this->Form->input('department_id', array(
                    'options' => $department,
                    'class' => 'form-control select_width',
                    'label' => false
                ));
                ?>
            </td>
            <td>
                <?php
                $Designation = array('All') + $Designations;
                echo $this->Form->input('designation_id', array(
                    'options' => $Designation,
                    'class' => 'form-control select_width',
                    'label' => false
                ));
                ?>
            </td>

            <td>
                <select class="form-control select_width" id="name" name="name">
                    <?php
                    $Employee = array('All') + $Employees;

                    foreach ($Employee as $key => $value) {
                        echo "<option value= " . $key . ">" . $value . "</option>";
                    }
                    ?>

                </select>
            </td>
            <td>
                <?php
                echo $this->Form->input('fiscal_year_id', array(
                    'options' => $FiscalYears,
                    'class' => 'form-control select_width',
                    'label' => false
                ));
                ?>
            </td>
        </tr>

        <!-- js code for onclick -->

        <script type="text/javascript">
            var base_url = "<?php echo BASE_URL; ?>";
            $(document).ready(function () {
                $('#designation_id').change(function () {
                    var department_name = $("#department_id option:selected").val();
                    var designation = $("#designation_id option:selected").val();

                    if (department_name != 0 || designation != 0)
                        $.ajax({
                            url: base_url + "SalaryCertificates/get_call",
                            method: "POST",
                            data: {

                                department_name: department_name,
                                designation: designation

                            },

                            dataType: "text",
                            success: function (data) {
                                $('#name').html(data);
                                //$('#a').html(data);
                            }
                        });

                });

            });

        </script>

        <p id="a"></p>

        <tr>
            <td>Start Month :</td>
            <td>
                <?php
                echo $this->Form->input('start_month_id', array('options' => $Month, 'label' => false, 'class' => 'select_width'));
                ?>
            </td>
            <td rowspan="2">End Month :</td>
            <td>
                <?php
                echo $this->Form->input('end_month_id', array('options' => $Month, 'label' => false, 'class' => 'select_width'));
                ?>

            </td>

            <td>
                <input type="submit" name="search" value="search" class="btn btn-primary">
            </td>

        </tr>
        <?php echo $this->Form->end(); ?>

    </table>


    <?php if (!empty($sal)): ?>
        <p class="text-center">KDA Employee List</p>
        <table class="table table-bordered table-striped" style="width: 50%;" align="center">

            <thead>
                <tr>
                    <th>Employee Name</th>
                    <th>Code</th>
                    <th>Designation</th>
                    <th>Grade</th>
                    <th>Religion </th>
                    <th>Basic</th>
                    <th>Joinig Date</th>
                    <th>Department </th>
                    <th>Current Job Status</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <?php foreach ($sal as $v): ?>
                    <tr>
                        <td><?= isset($v['Employee']['name'])?$v['Employee']['name']:''; ?></td>
                        <td><?= isset($v['Employee']['employeeID'])?$v['Employee']['employeeID']:''; ?></td>
                        <td><?= isset($v['Employee']['Designation']['name'])?$v['Employee']['Designation']['name']:''; ?></td>
                        <td><?= isset($v['Employee']['EmployeeGrade']['name'])?$v['Employee']['EmployeeGrade']['name']:''; ?></td>
                        <td><?= isset($v['Employee']['Religion']['name'])?$v['Employee']['Religion']['name']:'';  ?></td>
                        <td><?= isset($v['Employee']['Basic']['name'])?$v['Employee']['Basic']['name']:''; ?></td>
                        <td><?= isset($v['Employee']['joining_date'])?$v['Employee']['joining_date']:''; ?></td>
                        <td><?= isset($v['Employee']['Department']['name'])?$v['Employee']['Department']['name']:''; ?></td>

                        <td>
                            <?php
                            if ($v['Employee']['job_status_id'] == 1) {
                                echo "Active";
                            } else if ($v['Employee']['job_status_id'] == 2) {
                                echo "InActive";
                            }
                            ?>
                        </td>

                        <td class="text-center">
                            <a href="<?php echo BASE_URL . "admin/SalaryCertificates/print_view/" . $v['EmployeeSalarySheet']['employee_id'] . '/' . $v['EmployeeSalarySheet']['fiscal_year_id']; ?>"><span class="glyphicon glyphicon-edit" style="font-size: 30px;"></span></a>

                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>


        </table>



    <?php endif; ?>

</div>