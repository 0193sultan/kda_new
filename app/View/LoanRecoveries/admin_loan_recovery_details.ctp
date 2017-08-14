<?php
/* pr($loanRecoveries);
  exit(); */
$obj = new LoanRecoveriesController(); //add this for count ttl recovery
?>

<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Loan Recoveries'); ?></h3>
                <div class="box-tools pull-right">
                    <?php
                    if ($this->App->menu_permission('loanRecoveries', 'admin_add')) {
                        echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Loan Recovery'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false));
                    }
                    ?>
                </div>
            </div>
            <div class="box-body" id="printTag">
                <p>Employee Loan List</p><br/>
                <table id="LoanRecoveries" class="table table-bordered table-striped" style="margin-bottom: 50px;">
                    <thead>
                        <tr>
                            <th class="text-center">Employee Name</th>
                            <th class="text-center">Loan Name</th>
                            <th class="text-center">Loan Amount</th>
                            <th class="text-center">Interest Amount</th>
                            <th class="text-center">Total Recovery Amount</th>
                            <th class="text-center">Due Amount</th>
                            <th class="text-center">Installment Qty</th>
                            <th class="text-center">First Installment Amount</th>
                            <th class="text-center">Second Installment Amount</th>

                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        foreach ($dta as $loanRecovery):
                           // pr($loanRecovery);
                            ?>
                            <tr>
                                <td class="text-center">
                                    <?php echo h($loanRecovery['EmployeeLoan']['Employee']['name']); ?>
                                </td>

                                <td class="text-center">
                                    <?php echo $loanRecovery['EmployeeLoan']['Loan']['name']; ?>
                                </td>

                                <td class="text-center">
                                    <?php echo $loanRecovery['EmployeeLoan']['loan_amount']; ?>
                                </td>
                                <td class="text-center">
                                    <?php echo h($loanRecovery['EmployeeLoan']['interest_amount']); ?>
                                </td>
                                <td class="text-center">
                                    <?php
                                    $id = $loanRecovery['EmployeeLoan']['id'];
                                    $ttl_rcvry = $obj->ttl_recovery_by_employeeLoanId($id);
                                    $res = $obj->ttl_instlmnt_qty_loanAmount_installmentAmount($id);

                                    $amnt = $res[0]['EmployeeLoan']['installment_amount'] * $ttl_rcvry;

                                    echo $amnt;
                                    ?>
                                </td>
                                <td class="text-center">
                                    <?php
                                    echo $loanRecovery['EmployeeLoan']['current_due'];
                                    ?>
                                </td>
                                <td class="text-center">
                                    <?php
                                    $ins_qty = $res[0]['EmployeeLoan']['number_of_installment'];
                                    echo $ins_qty;
                                    ?>
                                </td>
                                <td class="text-center"><?=$loanRecovery['EmployeeLoan']['first_installment_amount'] ?><br>(<?=$loanRecovery['EmployeeLoan']['first_installment_date'] ?>)</td>
                                <td class="text-center"><?=$loanRecovery['EmployeeLoan']['second_installment_amount'] ?><br><?=$loanRecovery['EmployeeLoan']['second_installment_date'] ?></td>

                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>

                <p>Loan Recovery Lists</p><br/>
                <table id="LoanRecoveries" class="table table-bordered table-striped" style="width: 40%;">
                    <thead>
                        <tr>
                            <th>Recovery Year</th>
                            <th>Recovery Month</th>
                            <th>Recovery Amount</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php
                        /* pr($arr); exit(); */
                        foreach ($arr as $res):
                            ?>
                            <tr>
                                <td><?php echo $res['FiscalYear']['name']; ?></td>
                                <td><?php echo $res['Month']['name']; ?></td>
                                <td><?php echo $res['EmployeeLoan']['installment_amount']; ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
                            <button id="print" class="btn btn-sm btn-primary" >Print</button>
        </div>
    </div>
</div>
<script>
    $('#print').click(function () {
        $("#printTag").print();
    });
    </script>