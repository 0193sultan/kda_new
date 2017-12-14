<?php
$obj = new EmployeeBonusesController();
?>

<div class="box-body">
    <!-- search Start -->

    <?php
    echo $this->Form->create(false, array(
        'url' => array('controller' => 'MonthlySalaryNotes', 'action' => 'admin_index'),
        'id' => 'admin_index'
    ));
    ?>

    <table class="table table-bordered" style="width: 40%;" align="center">
        <tr>
            <td>Bank Name</td>
            <td>
                <select name="bank_name" id="bank_name" style="width: 110px" required>
                    <?php
//echo "<option value=0>All</option>";
                    foreach ($banks as $key => $value) {
                        echo "<option value=$key>$value</option>";
                    }
                    ?>
                </select>
            </td>
        </tr>

        <tr>
            <td>Fiscal Year</td>
            <td>
                <select name="fiscal_year" id="fiscal_year" style="width: 110px" required>
                    <?php
//echo "<option value=0>All</option>";
                    foreach ($fiscalyears as $key => $value) {
                        echo "<option value=$key>$value</option>";
                    }
                    ?>
                </select>
            </td>
        </tr>

        <tr>
            <td>Month</td>
            <td>
                <select name="month_id" id="month_id" style="width: 110px" required>
                    <?php
//echo "<option value=0>All</option>";
                    foreach ($months as $key => $value) {
                        echo "<option value=$key>$value</option>";
                    }
                    ?>
                </select>
            </td>
        </tr>

        <tr>
            <td></td>
            <td>
                <input type="submit" name="btn" id="btn" value="search" class="btn btn-primary"></td>
        </tr>
    </table>

    <?php echo $this->Form->end(); ?>

</div>
<!-- Search End -->

<?php
echo $this->Form->create(false, array(
    'url' => array('controller' => 'MonthlySalaryNotes', 'action' => 'admin_print_view'),
    'id' => 'admin_index'
));
?>

<?php
//pr($data);die();

if (!empty($data)) {
    ?>
    <div id="print_me">

        <h3 style="text-align: center;">Monthly Salary Note</h3>

        <table class="table table-bordered text-success text-center" style="width: 40%;" align="center">
            <tr>
                <td>Bank Name</td>
                <td><?=!empty($bank_id)?$this->App->get_bank_name($bank_id):'' ?> </td>
            </tr>

            <tr>
                <td>Fiscal Year</td>
                <td><?=!empty($fiscal_year_id)?$this->App->fiscal_year($fiscal_year_id):'' ?> </td>
            </tr>

            <tr>
                <td>Month</td>
                <td><?=!empty($month_id)?$this->App->get_month($month_id):'' ?> </td>
            </tr>

        </table>

        <table id="" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Department</th>
                    <th>Designation</th>
                    <th>Employee Name</th>
                    <th>Account No</th>
                    <th>Net Pay</th>
                </tr>
            </thead>

            <tbody>
                <?php
                // pr($save_data_ready_for_print);
                foreach ($data as $v):
                    ?>
                    <tr>
                        <td><?= $obj->get_department($v['Employee_tb']['department_id']); ?></td>
                        <td><?= $obj->get_designation($v['Employee_tb']['designation_id']); ?></td>
                        <td><?= $v['Employee_tb']['employee_name_bengali']; ?></td>
                        <td><?= $v['Employee_tb']['account_number']; ?> </td>
                        <td><?= $v['EmployeeSalarySheet']['net_pay']; ?> </td>
                    </tr>

                <?php endforeach; ?>
            </tbody>

        </table>
    </div>

    <p class="pull-right btn btn-primary" id="print">Print</p>
    <script type="text/javascript">
        $('#print').click(function () {
            $("#print_me").print();
        });
    </script>

<?php } else if (!empty($res)) { ?>
    <table id="" class="table table-bordered table-striped">
        <thead>
            <tr>
                <th></th>
                <th>Employee Name</th>
                <th>Code</th>
                <th>Designation</th>
                <th>Account No</th>
                <th>Net Pay</th>
            </tr>
        </thead>

        <tbody>
            <?php foreach ($res as $v): ?>
                <tr>

                    <td> <input type="checkbox" name="EmployeeSalarySheet_id[]" value="<?= $v['EmployeeSalarySheet']['id']; ?>" id="all" checked> </td>
                    <td><?= $v['Employee']['name']; ?></td>
                    <td><?= $v['Employee']['employeeID']; ?> </td>
                    <td><?= $v['Employee']['Designation']['name']; ?> </td>
                    <td><?= $v['Employee']['account_number']; ?> </td>
                    <td><?= $v['EmployeeSalarySheet']['total_payable']; ?> </td>

                </tr>
            <?php endforeach; ?>
        </tbody>

    </table>
    <input type="submit" name="Create Note" value="Create Note" class="btn btn-primary pull-right">
    <?php echo $this->Form->end(); ?>



<?php } ?>