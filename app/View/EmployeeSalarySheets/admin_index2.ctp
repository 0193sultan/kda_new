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
                // pr($emp_salary_sheet);
                ?>
                <div  class="row">
                    <div class=" col-sm-10">
                        <table>
                            <tr>
                                <td><h5 class="box-title">Year :</h5></td>
                                <td><?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:200px', 'options' => array('' => 'Select Year', $fiscalYearData))); ?></td>
                                <td><h5 class="box-title">&nbsp;&nbsp;&nbsp;&nbsp;Month :</h5></td>
                                <td><?php echo $this->Form->input('month_id', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:200px')); ?></td>
                                <td>            <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-sm btn-primary')); ?></td>
                            </tr>
                        </table>
                        <br><br>
                    </div>
                </div>
                <div  class="row">
                    <div class=" col-sm-12">
                        <div style="margin-left:auto; margin-right:auto; width:25%; text-align: center; margin-bottom: 30px">KHULNA DEVELOPMENT AUTHOTIRY<br/>Staff Salary for the month of </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <table width="100%"  id="printTag" class="table table-bordered " >
                        <thead >
                            <tr align="center">
                                <td width="3%" rowspan="2">SL</td>
                                <td width="10%" rowspan="5">Employee Name<br />
                                    Designation <br/> Pay Scale</td>
                                <td colspan="5">Pay and Allowance</td>
                                <td width="6%" rowspan="5">Gross Pay</td>
                                <td colspan="11">Recovery</td>
                                <td width="5%" rowspan="5">Total Recov.</td>
                                <td width="5%" rowspan="5">Net Payable</td>
                            </tr>
                            <tr align="center">
                                <td width="3%">Basic</td>
                                <td width="5%">PP</td>
                                <td width="3%">H_R</td>
                                <td width="4%">Conv.</td>
                                <td width="5%">Charge Allow</td>
                                <td width="3%" rowspan="4">GPF/CPF</td>
                                <td width="6%" rowspan="2">House Recovery</td>
                                <td width="3%">Tel<br>+</td>
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
                                <td>&nbsp;</td>
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
                           // echo $this->App->get_scale(2);
                          // pr($this->App->get_scale(2));
                            if (!empty($emp_salary_sheet)):
                                foreach ($emp_salary_sheet as $key => $value) {
                                   // pr($value);
                                    if ($value['EmployeeSalarySheet']['gpf_recovery'] == 0) {
                                        $gpf = 0;
                                    } else {
                                        $gpf = $value['EmployeeSalarySheet']['gpf'];
                                    }
                                    //  pr($value);
                                    ?>
                                    <tr align="center" >
                                        <td height="25"><?= $i ?></td>
                                        <td width="10%" rowspan="3">
                                            <?=$this->App->get_scale($value['EmployeeSalarySheet']['employee_id']) ?>
                                            <?php //$value['Employee']['Designation']['name'] ?>
                                            <?php //$this->App->get_scale($value['Employee']['EmployeeGrade']['name']) ?>
                                            <!--Code Employee Name--><br />
                                            <!--Designation Pay Scale--></td>
                                        <td width="3%"><!--N. Basic-->
                                            <?= $value['EmployeeSalarySheet']['current_basic'] ?></td>
                                        <td width="5%"><!--PP-->                                          <!--Medical-->
                                            <?= $value['EmployeeSalarySheet']['pp'] ?></td>
                                        <td width="3%"><!--hr-->
                                            <?= isset($value['EmployeeSalarySheet']['hr']) ? ($value['EmployeeSalarySheet']['hr']) : 0 ?></td>
                                        <td width="4%"><!--Wash-->
                                            <?= $value['EmployeeSalarySheet']['convance'] ?></td>
                                        <td width="5%" rowspan="2"><!--Other-->
                                            <?= $value['EmployeeSalarySheet']['charge'] ?></td>
                                        <td width="6%" rowspan="3"><?= $total_allowance = $value['EmployeeSalarySheet']['current_basic'] + $value['EmployeeSalarySheet']['da'] + $value['EmployeeSalarySheet']['pp'] + $value['EmployeeSalarySheet']['medical'] + $value['EmployeeSalarySheet']['convance'] + $value['EmployeeSalarySheet']['wash'] + $value['EmployeeSalarySheet']['mobile'] + $value['EmployeeSalarySheet']['cycle'] + $value['EmployeeSalarySheet']['charge'] + $value['EmployeeSalarySheet']['house_rent'] + $value['EmployeeSalarySheet']['tiffin'] + $value['EmployeeSalarySheet']['education'] ?><!--Gross Pay--></td>
                                        <td width="3%" rowspan="3"><?= $gpf ?><!--GPF--></td>
                                        <td width="6%"><!--House Recovery-->
                                            <?= $value['EmployeeSalarySheet']['house_loan_recovery'] ?></td>
                                        <td width="3%" rowspan="2"><!--Tel-->
                                            <?= 0 ?></td>
                                        <td width="6%"><!--GPF/CPF Loan-->
                                            <?= $value['EmployeeSalarySheet']['gpf_loan'] ?></td>
                                        <td width="4%"><?= $value['EmployeeSalarySheet']['house_build_recovery'] ?><!--House Build--></td>
                                        <td width="6%"><?= $value['EmployeeSalarySheet']['bicycle_loan'] ?><!--By Cycle Adv.--></td>
                                        <td width="4%"><?= $value['EmployeeSalarySheet']['car_loan'] ?><!--M.car Adv.--></td>
                                        <td width="6%"><?= $value['EmployeeSalarySheet']['fixed_house_rent_recovery'] ?><!--Fixed House Rent-->                                </td>
                                        <td width="5%"><?= $value['EmployeeSalarySheet']['water_supply_recovery'] ?><!--Water Supply +--></td>
                                        <td width="4%"><!--B.F Tax +--><!--GI-->
                                            <?= $value['EmployeeSalarySheet']['bf_recovery'] ?></td>
                                        <td width="4%"><?= $value['EmployeeSalarySheet']['tin_shade_recovery'] ?><!--Tin Shed--></td>
                                        <td width="5%" rowspan="3"><?= $total_recovery = $gpf + $value['EmployeeSalarySheet']['gpf_loan'] + $value['EmployeeSalarySheet']['house_build_recovery'] + $value['EmployeeSalarySheet']['house_repair_reovery'] + $value['EmployeeSalarySheet']['computer_loan'] + $value['EmployeeSalarySheet']['fixed_house_rent_recovery'] + $value['EmployeeSalarySheet']['water_supply_recovery'] + $value['EmployeeSalarySheet']['electricity_recovery'] + $value['EmployeeSalarySheet']['bf_recovery'] + $value['EmployeeSalarySheet']['gi'] + $value['EmployeeSalarySheet']['emp_tax'] + $value['EmployeeSalarySheet']['tin_shade_recovery'] ?><!--Total Recov--></td>
                                        <td width="5%" rowspan="3"><?= $total_allowance - $total_recovery ?><!--Total RecovNet Payable--></td>
                                    </tr>

                                    <tr align="center">
                                        <td rowspan="2"><?=$this->App->employee_code($value['EmployeeSalarySheet']['employee_id']) ?></td>
                                        <td width="3%"><?= $value['EmployeeSalarySheet']['new_basic_salary'] ?></td>
                                        <td width="5%"><?= $value['EmployeeSalarySheet']['medical'] ?></td>
                                        <td width="3%"><?= $value['EmployeeSalarySheet']['tiffin'] ?></td>
                                        <td width="4%"><?= $value['EmployeeSalarySheet']['wash'] ?></td>
                                        <td rowspan="2"><?= $value['EmployeeSalarySheet']['vehicle_recovery'] ?><!--Vehicle--></td>
                                        <td rowspan="2"><?= $value['EmployeeSalarySheet']['motorcycle_loan'] ?><!--M.Cycle Loan--></td>
                                        <td rowspan="2"><?= $value['EmployeeSalarySheet']['house_repair_reovery'] ?><!--House Repair--></td>
                                        <td rowspan="2"><?= $value['EmployeeSalarySheet']['computer_loan'] ?><!--Computer Adv.--></td>
                                        <td rowspan="2"><?= 0 ?><!--Loan8 Adv--></td>
                                        <td rowspan="2"><?= $value['EmployeeSalarySheet']['health_insurance'] ?><!--Health Insurance--></td>
                                        <td rowspan="2"><?= $value['EmployeeSalarySheet']['electricity_recovery'] ?><!--Electri city--></td>
                                        <td width="4%"><?= $value['EmployeeSalarySheet']['emp_tax'] ?></td>
                                        <td rowspan="2"><?= 0 ?><!--Other Sub--></td>
                                    </tr>
                                    <tr align="center">
                                        <td><?= $value['EmployeeSalarySheet']['da'] ?><!--DA--></td>
                                        <td>&nbsp;</td>
                                        <td><?= $value['EmployeeSalarySheet']['education'] ?><!--Edu--></td>
                                        <td> <?= $value['EmployeeSalarySheet']['mobile'] ?><!--Mobile--></td>
                                        <td width="5%"><?= $value['EmployeeSalarySheet']['cycle'] ?></td>
                                        <td width="3%">&nbsp;</td>
                                        <td width="4%"><?= number_format($value['EmployeeSalarySheet']['gi']) ?></td>
                                    </tr>
                                    <?php
                                    $i++;
                                }
                            endif;
                            ?>
                        </tbody>
                    </table>
                </div>
                <br>
                <?php echo $this->Form->end(); ?>
                <button id="print" class="btn btn-sm btn-primary" >Print</button>
                <br><br>
                <div class='row'>
                    <div class='col-xs-6'>
                        <div id='Users_info' class='dataTables_info'>
                            <?php echo $this->Paginator->counter(array("format" => __("Page {:page} of {:pages}, showing {:current} records out of {:count} total"))); ?>
                        </div>
                    </div>
                    <div class='col-xs-6'>
                        <div class='dataTables_paginate paging_bootstrap'>
                            <ul class='pagination'>
                                <?php
                                echo $this->Paginator->prev(__("prev"), array("tag" => "li"), null, array("tag" => "li", "class" => "disabled", "disabledTag" => "a"));
                                echo $this->Paginator->numbers(array("separator" => "", "currentTag" => "a", "currentClass" => "active", "tag" => "li", "first" => 1));
                                echo $this->Paginator->next(__("next"), array("tag" => "li", "currentClass" => "disabled"), null, array("tag" => "li", "class" => "disabled", "disabledTag" => "a"));
                                ?>
                            </ul>
                        </div>
                    </div>
                </div>
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
