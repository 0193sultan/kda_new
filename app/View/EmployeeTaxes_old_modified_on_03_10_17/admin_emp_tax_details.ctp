<?php
$obj = new EmployeeTaxesController();
/* 	pr($details);
  exit(); */
?>
<div class="box-body">
    <br><br>
    <div id="print_me">

        <?php
        // pr($details);
        if (!empty($details)):
            ?>
            <p style="text-align: center;">
                <strong style="font-size: 18px;padding-bottom: 5px">Khulna Development Authority</strong><br>
                Employee tax Details of Fiscal Year <?= $obj->get_fiscal_year($details[0]['EmployeeSalarySheet']['fiscal_year_id']); ?>
            </p>
            <table id="tax-search" class="table table-bordered table-striped" style="width: 50%;" align="center">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Designation</th>
                        <th>Join date</th>
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <td><?= $details[0]['Employee']['name']; ?></td>
                        <td><?= $details[0]['Employee']['Designation']['name']; ?></td>
                        <td><?php
                            $date = date_create($details[0]['Employee']['joining_date']);
                            echo date_format($date, "d-m-Y");

                            // $details[0]['Employee']['joining_date'];
                            ?></td>
                    </tr>

                </tbody>


            </table>

            <table id="tax-search" class="table table-bordered table-striped" style="width: 50%;" align="center">
                <thead>

                    <tr>
                        <th>Month Name</th>
                        <th>Department</th>
                        <th>Tax Recovery</th>
                    </tr>


                </thead>

                <tbody>

                    <?php
                    $initial = 0;
                    foreach ($details as $v):
                        ?>
                        <tr>
                            <td><?= $obj->get_month($v['EmployeeSalarySheet']['month_id']); ?></td>
                            <td><?= $v['Employee']['Department']['name']; ?></td>
                            <td class="align-middle"><?php
                                $sum = $initial + $v['EmployeeSalarySheet']['emp_tax'];
                                echo $v['EmployeeSalarySheet']['emp_tax'];
                                $initial = $v['EmployeeSalarySheet']['emp_tax'];
                                ?>
                            </td>
                        </tr>

                    <?php endforeach; ?>
                    <tr>
                        <td colspan="3">
                            <p class="col-md-5 pull-right">
                                <?= "Total = " . $sum . '.00'; ?>
                            </p>
                        </td>
                    </tr>

                </tbody>


            </table>

        <?php endif; ?>

    </div>

    <p class="col-md-offset-9 btn btn-primary" id="print" style="">Print</p>
    <script type="text/javascript">
        $('#print').click(function () {
            $("#print_me").print();
        });
    </script>

</div>