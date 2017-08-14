<?php
//pr($details);
$obj = new OtherRegistersController();
//exit();
?>
<div class="box-body">

    <div id="print_me">
        <?php if ($res): ?>

            <table id="EmployeeLoans" class="table table-bordered table-striped" align="center">

                <thead>
                <th>Name</th>
                <th>Designation</th>
                <th>Register type </th>
                <th>Total Balance</th>
                </thead>

                <tbody>
                    <?php
                    foreach ($res as $v):
                        ?>
                        <tr>
                            <td>

                                <?php
                                $id = $v['EmployeeSalarySheet']['employee_id'];
                                $data = $obj->get_name_designation_byId($id);
                                //pr($data);


                                echo $data[0]['Employee']['name'];
                                ?>

                            </td>
                            <td><?= $data[0]['Designation']['name']; ?></td>
                            <td><?= $type; ?></td>
                            <td><?= $v[0]['ttl']; ?></td>
                        </tr>
                    <?php endforeach; ?>

                </tbody>


            </table>
        <?php endif; ?>

        <table id="EmployeeLoans" class="table table-bordered table-striped" align="center">

            <thead>
            <th>Fiscal Year</th>
            <th>Month</th>
            <th>Recovery </th>
            </thead>

            <tbody>
                <?php
               //YYY pr($details);
                foreach ($details as $va):
                    ?>
                    <tr>
                        <td><?= $va['EmployeeSalarySheet']['fiscal_year_id']; ?></td>
                        <td><?= $va['EmployeeSalarySheet']['month_id']; ?></td>
                        <td>
                            <?php
                            if ($type == 'GPF Subcription') {
                                echo $va['EmployeeSalarySheet']['gpf'];
                            } else if ($type == 'BF') {
                                echo $va['EmployeeSalarySheet']['bf_recovery'];
                            } else {
                                echo $va['EmployeeSalarySheet']['gi'];
                            }
                            ?>
                        </td>
                    </tr>
<?php endforeach; ?>
            </tbody>


        </table>

        <p class="col-md-offset-8"> Total = <?= $res[0][0]['ttl']; ?> </p>

    </div>

    <p class="pull-right btn btn-primary" id="print">Print</p>
    <script type="text/javascript">
        $('#print').click(function () {
            $("#print_me").print();
        });
    </script>

</div>