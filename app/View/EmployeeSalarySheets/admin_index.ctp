<style>
    table {
        border-top:solid 1px #000;
        border-left:solid 1px #000;
        border-spacing:0;

    }

    table td{
        border-bottom:solid 1px #eee;
        border-right:solid 1px #eee;
    }

    table tbody td{
        height:40px;
        position:relative;
    }

    td .half-height-top{
        position:absolute;
        border-bottom:solid 1px #eee;
        height:50%;
        top:0;
        left:0;
        width:100%;
        display: flex;
        justify-content: center; /* align horizontal */
        align-items: center; /* align vertical */

    }

    td .half-height-down{
        position:absolute;
        height:50%;
        top:51%;
        left:0;
        width:100%;
        display: flex;
        justify-content: center; /* align horizontal */
        align-items: center; /* align vertical */

    }

</style>
<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Employee Salary Sheets'); ?></h3>
                <div class="box-tools pull-right">
                    <?php
                    if ($this->App->menu_permission('employeeSalarySheets', 'admin_add')) {
                        echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Employee Salary Sheet'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false));
                    }
                    ?>
                </div>
            </div>
            <div class="box-body">

                <?php
                echo $this->Form->create('employeesalarysheets', array('role' => 'form'));
                ?>
                <br>
                <div  class="row">
                    <div class=" col-sm-1" style=" padding-right: 0px !important;">
                        Fiscal Year:
                    </div>
                    <div class=" col-sm-2" style=" padding-left: 5px !important;padding-right: 0px !important;">
                        <?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:100%', 'options' => array('' => 'Select Year', $fiscalYearData))); ?>
                    </div>
                    <div class=" col-sm-1" style=" padding-right: 0px !important; text-align: right">
                        Month :
                    </div>
                    <div class="col-sm-2" style=" padding-left: 5px !important;padding-right: 0px !important;">
                        <?php echo $this->Form->input('month_id', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:100%')); ?>
                    </div>
                    <div class="col-sm-1">
                        <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-sm btn-primary')); ?>
                    </div>
                </div>
                <br><br>
                <div  class="row">
                    <div class=" col-sm-12">
                        <div style="margin-left:auto; margin-right:auto; width:25%; text-align: center; margin-bottom: 30px">KHULNA DEVELOPMENT AUTHOTIRY<br/>Staff Salary for the month of
                            <?php
                            if (!empty($month_id)):
                                echo $this->App->get_month($month_id);
                            endif;
                            ?>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <table width="100%"  id="printTag" class="table table-bordered" border="0px" >
                        <thead >
                            <tr align="center">
                                <td width="3%" rowspan="2">SL</td>
                                <td width="9%" rowspan="5">Employee Name<br />
                                    Designation <br/> Pay Scale</td>
                                <td colspan="5">Pay and Allowance</td>
                                <td width="4%" rowspan="5">Gross Pay</td>
                                <td colspan="11">Recovery</td>
                                <td width="5%" rowspan="5">Total Recov.</td>
                                <td width="5%" rowspan="5">Net Payable</td>
                            </tr>
                            <tr align="center">
                                <td width="3%">Basic</td>
                                <td width="5%">PP</td>
                                <td width="3%">H_R</td>
                                <td width="4%">Conv.</td>
                                <td width="8%">Charge Allow</td>
                                <td width="6%" rowspan="4">GPF/CPF</td>
                                <td width="6%" rowspan="2">House Recovery</td>
                                <td width="6%" rowspan="2">Tel<br>+</td>
                                <td width="6%" rowspan="2">GPF/CPF Loan</td>
                                <td width="4%" rowspan="2">House Build Loan</td>
                                <td width="6%" rowspan="2">By Cycle Adv.</td>
                                <td width="4%" rowspan="2">M.car Adv.</td>
                                <td width="6%" rowspan="2">Fixed House Rent</td>
                                <td width="5%" rowspan="2">Water Supply <br>
                                    + </td>
                                <td width="4%" rowspan="2">B.F <br/>+<br/>Tax <br>
                                    +</td>
                                <td width="4%" rowspan="2">Tin Shed</td>
                            </tr>

                            <tr align="center">
                                <td width="3%" rowspan="3">Code</td>
                                <td>N. Basic</td>
                                <td>Medical</td>
                                <td>+</td>
                                <td>+</td>
                                <td>+</td>
                            </tr>
                            <tr align="center">
                                <td>+</td>
                                <td>+</td>
                                <td>Tiffin</td>
                                <td>Wash</td>
                                <td rowspan="2">Others Add </td>
                                <td rowspan="2">Vehicle</td>
                                <td rowspan="2">&nbsp;</td>
                                <td rowspan="2">M.Cycle Loan</td>
                                <td rowspan="2">House Repair</td>
                                <td rowspan="2">Computer Adv.</td>
                                <td rowspan="2">Loan8 Adv</td>
                                <td rowspan="2">Health Insurance</td>
                                <td rowspan="2">Electri city</td>
                                <td rowspan="2">GI</td>
                                <td rowspan="2">Other Sub</td>
                            </tr>
                            <tr align="center">
                                <td>DA</td>
                                <td>Cycle</td>
                                <td>Edu</td>
                                <td>Mobile</td>
                            </tr>
                        </thead>


                        <tbody>
                            <?php
                            $i = 1;
                            //$obj = new EmployeeSalarySheet();
                            // echo $obj->get_scale('kkkk');
                            // pr($emp_salary_sheet);
                            // pr($this->App->get_scale($i));
                            // echo $this->EmployeeSalarySheet->get_scale('kkkk');
                            if (!empty($emp_salary_sheet)):
                                // pr($emp_salary_sheet);
                                //die();
                                $gros_pay = 0;
                                $total_recovery = 0;
                                $net_pay = 0;
                                foreach ($emp_salary_sheet as $key => $value) {
                                    //pr($value);

                                    if ($value['EmployeeSalarySheet']['gpf_recovery'] == 0) {
                                        $gpf = 0;
                                    } else {
                                        $gpf = $value['EmployeeSalarySheet']['gpf'];
                                    }
                                    //  pr($value);
                                    ?>
                                    <tr align="center" >
                                        <td height="25"><?= $i ?></td>
                                        <td width="9%" rowspan="3">
                                            <?= $this->App->get_scale($value['EmployeeSalarySheet']['employee_id']) ?>
                                            <!--Code Employee Name--><br />
                                            <!--Designation Pay Scale-->
                                        </td>
                                        <td width="3%"><!--N. Basic-->
                                            <?= number_format($value['EmployeeSalarySheet']['current_basic'], 2) ?></td>
                                        <td width="5%"><!--PP-->                                          <!--Medical-->
                                            <?= number_format($value['EmployeeSalarySheet']['pp'], 2) ?>
                                        </td>
                                        <td width="3%"><!--hr-->
                                            <?= isset($value['EmployeeSalarySheet']['house_rent']) ? number_format($value['EmployeeSalarySheet']['house_rent'], 2) : 0 ?>
                                        </td>
                                        <td width="4%"><!--Wash-->
                                            <?= number_format($value['EmployeeSalarySheet']['convance'], 2) ?>
                                        </td>
                                        <td width="8%">
                                            <!--Other-->
                                            <?= number_format($value['EmployeeSalarySheet']['charge'], 2) ?>
                                        </td>
                                        <td width="4%" rowspan="3">
                                            <?php
                                            $total_gros_pay = $gros_pay + $value['EmployeeSalarySheet']['gross_pay'];
                                            $gros_pay = $total_gros_pay;
                                            echo number_format($value['EmployeeSalarySheet']['gross_pay'], 2);
                                            ?><!--Gross Pay-->
                                        </td>
                                        <td rowspan="3"><?= number_format($value['EmployeeSalarySheet']['gpf'], 2) ?><!--GPF-->
                                            <!--House Recovery-->                                          <!--Vehicle-->
                                        </td>
                                        <td width="6%" rowspan="3">
                                            <div class="half-height-top"><?= 0 ?></div>
                                            <div class="half-height-down"><?= number_format($value['EmployeeSalarySheet']['vehicle_recovery'], 2) ?>
                                            </div>
                                        </td>
                                        <td width="6%" rowspan="3">
                                            <div class="half-height-top"><?= number_format($value['EmployeeSalarySheet']['telephone_recovery'], 2) ?><!--Tel--></div>
                                            <div class="half-height-down"></div>
                                        </td>
                                        <td width="6%" rowspan="3"><!--GPF/CPF Loan-->
                                            <div class="half-height-top">
                                                <?= number_format($value['EmployeeSalarySheet']['gpf_loan'], 2) ?>
                                            </div>

                                            <div class="half-height-down">
                                                <?= number_format($value['EmployeeSalarySheet']['motorcycle_loan'], 2) ?>
                                            </div>                                       <!--M.Cycle Loan-->
                                        </td>
                                        <td width="4%" rowspan="3">
                                            <div class="half-height-top">
                                                <?= number_format($value['EmployeeSalarySheet']['house_build_recovery'], 2) ?><!--House Build-->
                                            </div>

                                            <div class="half-height-down">
                                                <?= number_format($value['EmployeeSalarySheet']['house_repair_recovery'], 2) ?>
                                            </div>                                        <!--House Repair-->
                                        </td>
                                        <td width="6%" rowspan="3">
                                            <div class="half-height-top">
                                                <?= number_format($value['EmployeeSalarySheet']['bycycle_loan'], 2) ?><!--By Cycle Adv.-->
                                            </div>

                                            <div class="half-height-down">
                                                <?= number_format($value['EmployeeSalarySheet']['computer_loan'], 2) ?> <!--Computer Adv.-->
                                            </div>
                                        </td>
                                        <td width="4%" rowspan="3">
                                            <div class="half-height-top">
                                                <?= number_format($value['EmployeeSalarySheet']['car_loan'], 2) ?><!--M.car Adv.-->
                                            </div>
                                            <div class="half-height-down">
                                                <?= 0 ?>                                          <!--Loan8 Adv-->
                                            </div>
                                        </td>
                                        <td width="6%" rowspan="3">
                                            <div class="half-height-top">
                                                <?= number_format($value['EmployeeSalarySheet']['fixed_house_rent_recovery'], 2) ?><!--Fixed House Rent-->
                                            </div>
                                            <div class="half-height-down">
                                                <?= number_format($value['EmployeeSalarySheet']['health_insurance'], 2) ?><!--Health Insurance-->
                                            </div>
                                        </td>
                                        <td width="5%" rowspan="3">
                                            <div class="half-height-top">
                                                <?= number_format($value['EmployeeSalarySheet']['water_supply_recovery'], 2) ?><!--Water Supply +-->
                                            </div>
                                            <div class="half-height-down">
                                                <?= number_format($value['EmployeeSalarySheet']['electricity_recovery'], 2) ?> <!--Electri city-->
                                            </div>
                                        </td>
                                        <td width="4%"><!--B.F Tax +--><!--GI-->
                                            <?= number_format($value['EmployeeSalarySheet']['bf_recovery'], 2) ?>
                                        </td>
                                        <td width="4%" rowspan="3">
                                            <div class="half-height-top"><?= number_format($value['EmployeeSalarySheet']['tin_shade_recovery'], 2) ?><!--Tin Shed--></div>

                                            <div class="half-height-down">
                                                <?= number_format($value['EmployeeSalarySheet']['others_recovery'], 2) ?>
                                            </div>                                      <!--Other Sub-->
                                        </td>
                                        <td width="5%" rowspan="3">
                                            <?php
                                            $all_recovery = $total_recovery + $value['EmployeeSalarySheet']['total_recovery'];
                                            $total_recovery = $all_recovery;
                                            echo number_format($value['EmployeeSalarySheet']['total_recovery'], 2);
                                            ?>
                                        </td>
                                        <td width="5%" rowspan="3"><?php
                                            $total_net_pay = $net_pay + $value['EmployeeSalarySheet']['net_pay'];
                                            $net_pay = $total_net_pay;
                                            echo number_format($value['EmployeeSalarySheet']['net_pay'], 2);
                                            ?><!--Total RecovNet Payable--></td>
                                    </tr>

                                    <tr align="center">
                                        <td rowspan="2"><?= $this->App->employee_code($value['EmployeeSalarySheet']['employee_id']) ?></td>
                                        <td width="3%"><?= number_format($value['EmployeeSalarySheet']['new_basic_salary'], 2) ?></td>
                                        <td width="5%"><?= number_format($value['EmployeeSalarySheet']['medical'], 2) ?></td>
                                        <td width="3%"><?= number_format($value['EmployeeSalarySheet']['tiffin'], 2) ?></td>
                                        <td width="4%"><?= number_format($value['EmployeeSalarySheet']['wash'], 2) ?></td>
                                        <td width="8%">&nbsp;</td>
                                        <td width="4%"><?= number_format($value['EmployeeSalarySheet']['emp_tax'], 2) ?></td>
                                    </tr>
                                    <tr align="center">
                                        <td><?= number_format($value['EmployeeSalarySheet']['da'], 2) ?><!--DA--></td>
                                        <td><?= number_format($value['EmployeeSalarySheet']['cycle'], 2) ?></td>
                                        <td><?= number_format($value['EmployeeSalarySheet']['education'], 2) ?><!--Edu--></td>
                                        <td> <?= number_format($value['EmployeeSalarySheet']['mobile'], 2) ?><!--Mobile--></td>
                                        <td width="8%"><?= number_format($value['EmployeeSalarySheet']['other'], 2) ?></td>
                                        <td width="4%"><?= number_format($value['EmployeeSalarySheet']['gi'], 2) ?></td>
                                    </tr>
                                    <?php
                                    $i++;
                                }
                            endif;
                            ?>
                            <tr>
                                <td colspan="7" style=" text-align: right">Total :</td>
                                <td><?= !empty($total_gros_pay) ? number_format($total_gros_pay, 2) : '' ?></td>
                                <td colspan="11" style=" text-align: right">Total :</td>
                                <td><?= !empty($all_recovery) ? number_format($all_recovery, 2) : '' ?></td>
                                <td><?= !empty($total_net_pay) ? number_format($total_net_pay, 2) : '' ?></td>
                            </tr>
                        </tbody>
                    </table>


                </div>
                <br>
                <?php echo $this->Form->end(); ?>
                <button id="print" class="btn btn-sm btn-primary" >Print</button>
                <br><br>

            </div>
        </div>
    </div>
</div>
<script>
    $('#print').click(function () {
        $("#printTag").print();
    });

    $('#employeesalarysheetsFiscalYearId').change(function () {
        var yearId = $(this).val();
        $.ajax({
            url: '<?php echo BASE_URL ?>admin/Apis/get_months',
            type: 'POST',
            data: {yearId: yearId},
            success: function (result) {
                result = $.parseJSON(result);
                var options = '<option value=' + 0 + '>Select current Basic</option>'
                $.each(result, function (index, value) {
                    options += '<option value=' + '"' + index + '">' + value + '</option>'
                });
                $('#employeesalarysheetsMonthId').html(options);
            }
        });
    });
</script>
