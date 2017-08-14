<?php
/* pr($res);
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
            <div class="box-body">
                <!-- search Start -->

                <div class="col-md-offset-1" style="float:left; width: 80%; height: auto; border: 1px solid black; box-sizing: border-box;  margin-bottom: 20px; padding: 10px;">

                    <?php
                    echo $this->Form->create(false, array(
                        'url' => array('controller' => 'LoanRecoveries', 'action' => 'recovery_search'),
                        'id' => 'recovery_search'
                    ));
                    ?>
                    <div class="col-lg-6 col-md-6">

                        <div style="margin-bottom: 20px;" class="col-md-12">
                            <span style="font-weight: 700;" >Department Name : </span>
                            <select name="department_id" id="EmployeeLoanDepartment" style="width: 110px" required>
                                <?php
                                echo "<option value=0>All</option>";
                                foreach ($dprtmnts as $key => $value) {
                                    echo "<option value=$key>$value</option>";
                                }
                                ?>
                            </select>

                        </div>

                        <div style="margin-bottom: 20px; margin-left: 12.5%;" class="col-md-12">
                            <span style="font-weight: 700;" >Loan Type : </span>
                            <select name="loan_type_id" style="width: 110px" required>
                                <?php
                                echo "<option value=0>All</option>";
                                foreach ($lntype as $key => $value) {
                                    echo "<option value=$key>$value</option>";
                                }
                                ?>
                            </select>

                        </div>

                        <div style="margin-bottom: 20px; margin-left: 11%;" class="col-md-12">
                            <span style="font-weight: 700;" >Loan Name : </span>
                            <select name="loan_id" style="width: 110px"  required>
                                <?php
                                echo "<option value=0>All</option>";
                                foreach ($ln as $key => $value) {
                                    echo "<option value=$key>$value</option>";
                                }
                                ?>
                            </select>
                        </div>

                    </div>

                    <div class="col-lg-6 col-md-6">

                        <div style="margin-bottom: 20px; margin-left: 7%;" class="col-md-12">
                            <span style="font-weight: 700;">Designation : </span>
                            <select name="designation_id" style="width: 110px" id="EmployeeLoanDesignation" required>
                                <?php
                                echo "<option value=0>All</option>";
                                foreach ($dgntons as $key => $value) {
                                    echo "<option value=$key>$value</option>";
                                }
                                ?>
                            </select>
                        </div>

                        <!--  jquery code start here -->

                        <script type="text/javascript">
                            var base_url = "<?php echo BASE_URL; ?>";
                            $(document).ready(function () {

                                $('#EmployeeLoanDesignation').change(function () {

                                    var department_id = $("#EmployeeLoanDepartment option:selected").val();
                                    var designation_id = $("#EmployeeLoanDesignation option:selected").val();

                                    if (department_id != 0 && designation_id != 0)
                                    {
                                        $.ajax({
                                            url: base_url + "admin/LoanRecoveries/get_lName_lType_eName",
                                            method: "POST",
                                            data: {department_id: department_id, designation_id: designation_id},
                                            dataType: "text",
                                            success: function (data)
                                            {
                                                $("#set").html(data);
                                                //$("#a").html(data);
                                            }
                                        });
                                    }

                                });


                            });
                        </script>
                        <p id="a"></p>

                        <!--  jquery code end here -->

                        <div style="margin-bottom: 20px;" class="col-md-12">
                            <span style="font-weight: 700;">Employee Name : </span>
                            <select name="employee_id" style="width: 110px" id="set" required>
                                <?php
                                echo "<option value=0>All</option>";
                                foreach ($emp as $key => $value) {
                                    echo "<option value=$key>$value</option>";
                                }
                                ?>
                            </select>
                        </div>
                        <div style="margin-bottom: 20px;" class="col-md-12">
                            <input type="submit" name="btn" value="search" class="col-md-offset-3 btn btn-primary">
                        </div>


                    </div>

                    <?php echo $this->Form->end(); ?>

                </div>

                <!-- Search End -->
                <table id="LoanRecoveries" class="table table-bordered table-striped">
                    <thead>
                        <!-- <?php echo $this->Paginator->sort('id'); ?> -->
                        <tr>
                            <th class="text-center">Employee Name(Designation)</th>
                            <th class="text-center">Loan Name</th>
                            <!--<th class="text-center">Loan Type</th>-->
                            <th class="text-center">Loan Starting Date</th>
                            <th class="text-center">Interest Rate</th>
                            <th class="text-center">Total Loan Amount</th>
                            <th class="text-center">Interest Amount</th>
                            <th class="text-center">Recovery Loan</th>
                            <th class="text-center">Due Loan</th>
                            <th class="text-center">Status</th>
                            <th width="120" class="text-center"><?php echo __('Actions'); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        foreach ($res as $loanRecovery):
                            //pr($loanRecovery);
                            $id = $loanRecovery['EmployeeLoan']['id'];

                            $rcvry_qnqty = $obj->ttl_recovery_by_employeeLoanId($id);

                            if ($rcvry_qnqty > 0):
                                ?>
                                <tr>
                                    <td class="text-center">
                                        <?php echo h($loanRecovery['Employee']['name']); ?>
                                    </td>

                                    <td class="text-center">
                                        <?php echo h($loanRecovery['Loan']['name']); ?>
                                    </td>

                                    <!--<td class="text-center">
                                        <?php //echo h($loanRecovery['LoanType']['name']); ?>
                                    </td>-->

                                    <td class="text-center">
                                        <?php echo h($loanRecovery['EmployeeLoan']['loan_approved_date']); ?>
                                    </td>

                                    <td class="text-center">
                                        <?php echo h($loanRecovery['LoanType']['interest_rate']) . "%"; ?>
                                    </td>

                                    <td class="text-center">
                                        <?php echo h($loanRecovery['EmployeeLoan']['loan_amount']); ?>
                                    </td>
                                    <td class="text-center">
                                        <?php echo h($loanRecovery['EmployeeLoan']['interest_amount']); ?>
                                    </td>
                                    <td class="text-center">
                                        <?php
                                        $amnt = $loanRecovery['EmployeeLoan']['installment_amount'] * $rcvry_qnqty;

                                        echo $amnt;
                                        ?>
                                    </td>
                                    <td class="text-center">
                                        <?php
                                        $due = $loanRecovery['EmployeeLoan']['loan_amount'] - $amnt;
                                        echo $due;
                                        ?>
                                    </td>
                                    <td class="text-center">
                                        <?php
                                        if ($loanRecovery['EmployeeLoan']['status'] == 0) {
                                            echo "Active";
                                        } else if ($loanRecovery['EmployeeLoan']['status'] == 1) {
                                            echo "InActive";
                                        }
                                        ?>
                                    </td>

                                    <td class="text-center">
                                        <a href="<?php echo BASE_URL . "admin/loanrecoveries/loan_recovery_details/" . $loanRecovery['EmployeeLoan']['id']; ?>"><span class="btn btn-primary">Details</span></a>
                                    </td>
                                </tr>
                            <?php
                            endif;
                        endforeach;
                        ?>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>