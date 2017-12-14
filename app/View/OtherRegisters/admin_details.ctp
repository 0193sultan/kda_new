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
                                $id = isset($v['EmployeeSalarySheet']['employee_id']) ? $v['EmployeeSalarySheet']['employee_id'] : $v['GpfSubscription']['employee_id'];
                                $data = $obj->get_name_designation_byId($id);
                                //pr($data);


                                echo $data[0]['Employee']['name'];
                                ?>

                            </td>
                            <td><?= $data[0]['Designation']['name']; ?></td>
                            <td><?= $type; ?></td>
                            <td><?= isset($v[0]['ttl']) ? $v[0]['ttl'] : $v['GpfSubscription']['ttl']; ?></td>
                        </tr>
                    <?php endforeach; ?>

                </tbody>


            </table>

        <?php endif; ?>
        <?php if ($flag != 3): ?>
            <table id="EmployeeLoans" class="table table-bordered table-striped" align="center">

                <thead>
                <th>Recovery Date</th>
                <th>Recovery </th>
                </thead>

                <tbody>
                    <?php
                    //YYY pr($details);
                    foreach ($details as $va):
                        ?>
                        <tr>
                            <td><?= $va['EmployeeSalarySheet']['created_at']; ?></td>
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
        <?php endif; ?>
        <?php if ($flag == 3): ?>
            <table  class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th class="text-center" style="width:80px">Fiscal Year</th>
                        <th class="text-center">Month</th>
                        <th class="text-center">Date</th>
                        <th class="text-center">Subscription</th>
                        <th class="text-center">Subscription Balance</th>
                        <th class="text-center">Subscription Int.</th>
                        <th class="text-center">Loan Amt.</th>
                        <th class="text-center">Loan Recovery</th>
                        <th class="text-center">Loan Int. Amt.</th>
                        <th class="text-center">loan Int. Recovery</th>
                        <th class="text-center">Deposit Amt.</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    //  pr($res);
                    foreach ($gpfSubscription as $gpf):
                        ?>
                        <tr>
                            <td class="text-center"><?= $this->App->fiscal_year($gpf['GpfSubscription']['fiscal_year_id']); ?></td>
                            <td class="text-center"><?= $this->App->get_month($gpf['GpfSubscription']['month_id']); ?></td>
                            <td class="text-center"><?= ($gpf['GpfSubscription']['created_at'] != 0 ? $gpf['GpfSubscription']['created_at'] : '') ?></td>
                            <td class="text-center"><?= ($gpf['GpfSubscription']['subscription_recovery'] != 0 ? $gpf['GpfSubscription']['subscription_recovery'] : '') ?></td>
                            <td class="text-center"><?= ($gpf['GpfSubscription']['total_subscription_balance'] != 0 ? $gpf['GpfSubscription']['total_subscription_balance'] : '') ?></td>
                            <td class="text-center"><?= ($gpf['GpfSubscription']['subscription_interest'] != 0 ? $gpf['GpfSubscription']['subscription_interest'] : '') ?></td>
                            <td class="text-center"><?= ($gpf['GpfSubscription']['loan_amount'] != 0 ? $gpf['GpfSubscription']['loan_amount'] : '') ?></td>
                            <td class="text-center"><?= ($gpf['GpfSubscription']['loan_recovery'] != 0 ? $gpf['GpfSubscription']['loan_recovery'] : '') ?></td>
                            <td class="text-center"><?= ($gpf['GpfSubscription']['loan_interest_amount'] != 0 ? $gpf['GpfSubscription']['loan_interest_amount'] : '') ?></td>
                            <td class="text-center"><?= ($gpf['GpfSubscription']['loan_interest_recovery'] != 0 ? $gpf['GpfSubscription']['loan_interest_recovery'] : '') ?></td>
                            <td class="text-center"><?= ($gpf['GpfSubscription']['deposit_loan_amount'] != 0 ? $gpf['GpfSubscription']['deposit_loan_amount'] : '') ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php endif; ?>


        <?php if ($flag != 3): ?>
            <p class="col-md-offset-8"> Total = <?= $res[0][0]['ttl']; ?> </p>
        <?php endif; ?>

        <?php if ($flag == 3): ?>
            <p class="col-md-offset-8"> Current Subscription Balance = <?= $res[0]['GpfSubscription']['ttl']; ?> </p>
        <?php endif; ?>
    </div>

    <p class="pull-right btn btn-primary" id="print">Print</p>
    <script type="text/javascript">
        $('#print').click(function () {
            $("#print_me").print();
        });
    </script>

</div>