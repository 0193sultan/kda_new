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
                pr($emp_salary_sheet);
                ?>
                <div  class="row">
                    <div class=" col-sm-12">
                        <table>
                            <tr>
                                <td><h5 class="box-title">Year :</h5></td>
                                <td><?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:200px', 'options' => array('' => 'Select Year', $fiscalYearData))); ?></td>
                                <td><h5 class="box-title">&nbsp;&nbsp;&nbsp;&nbsp;Month :</h5></td>
                                <td><?php echo $this->Form->input('month_id', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:200px')); ?></td>
                            </tr>
                        </table>
                        <br>
                    </div>
                </div>
                <table width="100%" border="1" style="font-size: 14px" >
                    <thead>
                        <tr align="center">
                            <td width="12%">SL</td>
                            <td width="12%" rowspan="4">Code Employee Name<br />
                                Designation Pay Scale</td>
                            <td colspan="5">Pay and Allowance</td>
                            <td width="6%" rowspan="5">Gross Pay</td>
                            <td colspan="11">Recovery</td>
                            <td width="3%" rowspan="5">Total Recov.</td>
                            <td width="4%" rowspan="5">Net Payable</td>
                        </tr>
                        <tr align="center">
                            <td rowspan="4">Code</td>
                            <td width="6%">Basic</td>
                            <td width="4%">PP</td>
                            <td width="5%">H_R</td>
                            <td width="5%">Conv.</td>
                            <td width="4%">Charge Allow</td>
                            <td width="9%" rowspan="4">GPF</td>
                            <td width="3%" rowspan="2">House Recovery</td>
                            <td width="3%">Tel</td>
                            <td width="3%" rowspan="2">GPF/CPF Loan</td>
                            <td width="3%" rowspan="2">House Build</td>
                            <td width="3%" rowspan="2">By Cycle Adv.</td>
                            <td width="3%" rowspan="2">M.car Adv.</td>
                            <td width="3%" rowspan="2">Fixed House Rent
                            </td>
                            <td width="3%" rowspan="2">Water Supply + </td>
                            <td width="3%" rowspan="2">B.F Tax +</td>
                            <td width="3%" rowspan="2">Tin Shed</td>
                        </tr>
                        <tr align="center">
                            <td>N. Basic</td>
                            <td>Medical</td>
                            <td>+</td>
                            <td>+</td>
                            <td>+</td>
                            <td>+</td>
                        </tr>
                        <tr align="center">
                            <td>+</td>
                            <td>+</td>
                            <td>Tiffin</td>
                            <td>Wash</td>
                            <td rowspan="2">Other</td>
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
                            <td>&nbsp;</td>
                            <td>DA</td>
                            <td>&nbsp;</td>
                            <td>Edu</td>
                            <td>Mobile</td>
                        </tr>
                    </thead>


                    <tbody>
                        <?php
                        $i=1;
                        foreach ($emp_salary_sheet as $key => $value) {
                            ?>
                            <tr align="center">
                                <td width="12%"><?= $i?></td>
                                <td width="12%" rowspan="4"><?= $value['Employee']['employee_name_bengali']?><!--Code Employee Name--><br />
                                    <!--Designation Pay Scale--></td>
                                <td colspan="5"><!--Pay and Allowance--></td>
                                <td width="6%" rowspan="5"><?= $value['EmployeeSalarySheet']['gross_pay']?><!--Gross Pay--></td>
                                <td colspan="11"><!--Recovery--></td>
                                <td width="3%" rowspan="5"><!--Total Recov--></td>
                                <td width="4%" rowspan="5"><!--Total RecovNet Payable--></td>
                            </tr>
                            <tr align="center">
                                <td rowspan="4"><?= $value['Employee']['employeeID']?></td>
                                <td width="6%"><?= $value['EmployeeSalarySheet']['current_basic']?></td>
                                <td width="4%"><?= $value['EmployeeSalarySheet']['pp']?><!--PP--></td>
                                <td width="5%"><?= isset($value['EmployeeSalarySheet']['hr'])?($value['EmployeeSalarySheet']['hr']):0?></td>
                                <td width="5%"><?= $value['EmployeeSalarySheet']['convance']?></td>
                                <td width="4%"><?= $value['EmployeeSalarySheet']['charge']?></td>
                                <td width="9%" rowspan="4"><?= $value['EmployeeSalarySheet']['gpf']?><!--GPF--></td>
                                <td width="3%" rowspan="2"><?= $value['EmployeeSalarySheet']['house_loan_recovery']?><!--House Recovery--></td>
                                <td width="3%"><?= 0?><!--Tel--></td>
                                <td width="3%" rowspan="2"><?= $value['EmployeeSalarySheet']['gpf']?><!--GPF/CPF Loan--></td>
                                <td width="3%" rowspan="2"><?= $value['EmployeeSalarySheet']['house_build_recovery']?><!--House Build--></td>
                                <td width="3%" rowspan="2"><?= $value['EmployeeSalarySheet']['bicycle_loan']?><!--By Cycle Adv.--></td>
                                <td width="3%" rowspan="2"><?= $value['EmployeeSalarySheet']['car_loan']?><!--M.car Adv.--></td>
                                <td width="3%" rowspan="2"><?= $value['EmployeeSalarySheet']['fixed_house_rent_recovery']?><!--Fixed House Rent-->
                                </td>
                                <td width="3%" rowspan="2"><?= $value['EmployeeSalarySheet']['car_loan']?> <br>+ <!--Water Supply +--></td>
                                <td width="3%" rowspan="2"><?= $value['EmployeeSalarySheet']['bf_recovery']?><br>+<!--B.F Tax +--></td>
                                <td width="3%" rowspan="2"><?= $value['EmployeeSalarySheet']['tin_shade_recovery']?><!--Tin Shed--></td>
                            </tr>
                            <tr align="center">
                                <td><?= $value['EmployeeSalarySheet']['new_basic_salary']?><!--N. Basic--></td>
                                <td><?= $value['EmployeeSalarySheet']['medical']?><!--Medical--></td>
                                <td>+</td>
                                <td>+</td>
                                <td>+</td>
                            </tr>
                            <tr align="center">
                                <td>+</td>
                                <td>+</td>
                                <td><?= $value['EmployeeSalarySheet']['tiffin']?><!--Tiffin--></td>
                                <td><?= $value['EmployeeSalarySheet']['wash']?><!--Wash--></td>
                                <td rowspan="2"><?= 0?><!--Other--></td>
                                <td rowspan="2"><?= $value['EmployeeSalarySheet']['vehicle_recovery']?><!--Vehicle--></td>
                                <td rowspan="2">&nbsp;</td>
                                <td rowspan="2"><?= $value['EmployeeSalarySheet']['motorcycle_loan']?><!--M.Cycle Loan--></td>
                                <td rowspan="2"><?= $value['EmployeeSalarySheet']['house_repair_reovery']?><!--House Repair--></td>
                                <td rowspan="2"><?= $value['EmployeeSalarySheet']['computer_loan']?><!--Computer Adv.--></td>
                                <td rowspan="2"><?= 0?><!--Loan8 Adv--></td>
                                <td rowspan="2"><?= $value['EmployeeSalarySheet']['health_insurance']?><!--Health Insurance--></td>
                                <td rowspan="2"><?= $value['EmployeeSalarySheet']['electricity_recovery']?><!--Electri city--></td>
                                <td rowspan="2"><?= $value['EmployeeSalarySheet']['gi']?><!--GI--></td>
                                <td rowspan="2"><?= 0?><!--Other Sub--></td>
                            </tr>
                            <tr align="center">
                                <td>&nbsp;</td>
                                <td><?= $value['EmployeeSalarySheet']['da']?><!--DA--></td>
                                <td>&nbsp;</td>
                                <td><?= $value['EmployeeSalarySheet']['education']?><!--Edu--></td>
                                <td><?= 0?><!--Mobile--></td>
                            </tr>
                            <?php
                            $i++;
                        }
                        ?>
                    </tbody>
                </table>
                <br>
                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
                <br><br>
                <table id="EmployeeSalarySheets" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th class="text-center"><?php echo $this->Paginator->sort('id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('employee_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('current_basic'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('new_basic_salary'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('da'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('pp'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('medical'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('convance'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('wash'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('mobile'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('charge'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('other'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('gross_pay'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('gpf'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('group_insurance'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('house_rent'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('house_loan_recovery'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('vechcale_recovery'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('telephone_allowance'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('tiffin'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('motorcycle_loan'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('house_build_recovery'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('house_repair_reovery'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('bicycle_loan'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('computer_loan'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('car_loan'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('extra_loan'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('education'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('fixed_house_rent_recovery'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('health_insurance'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('water_supply_recovery'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('electricity_recovery'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('bf_recovery'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('gi_recovery'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('tin_shade_recovery'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('salary_type_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('status'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('total_payable'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('fiscal_year_id'); ?></th>
                            <th class="text-center"><?php echo $this->Paginator->sort('month_id'); ?></th>
                            <th width="120" class="text-center"><?php echo __('Actions'); ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($employeeSalarySheets as $employeeSalarySheet): ?>
                            <tr>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['id']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['employee_id']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['current_basic']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['new_basic_salary']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['da']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['pp']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['medical']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['convance']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['wash']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['mobile']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['charge']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['other']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['gross_pay']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['gpf']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['group_insurance']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['house_rent']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['house_loan_recovery']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['vehicle_recovery']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['telephone_allowance']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['tiffin']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['motorcycle_loan']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['house_build_recovery']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['house_repair_reovery']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['bicycle_loan']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['computer_loan']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['car_loan']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['extra_loan']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['education']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['fixed_house_rent_recovery']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['health_insurance']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['water_supply_recovery']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['electricity_recovery']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['bf_recovery']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['gi_recovery']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['tin_shade_recovery']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['salary_type_id']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['status']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['total_payable']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['fiscal_year_id']); ?></td>
                                <td class="text-center"><?php echo h($employeeSalarySheet['EmployeeSalarySheet']['month_id']); ?></td>
                                <td class="text-center">
                                    <?php
                                    if ($this->App->menu_permission('employeeSalarySheets', 'admin_view')) {
                                        echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $employeeSalarySheet['EmployeeSalarySheet']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'view'));
                                    }
                                    ?>
                                    <?php
                                    if ($this->App->menu_permission('employeeSalarySheets', 'admin_edit')) {
                                        echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $employeeSalarySheet['EmployeeSalarySheet']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'edit'));
                                    }
                                    ?>
                                    <?php
                                    if ($this->App->menu_permission('employeeSalarySheets', 'admin_delete')) {
                                        echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $employeeSalarySheet['EmployeeSalarySheet']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $employeeSalarySheet['EmployeeSalarySheet']['id']));
                                    }
                                    ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
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
    $('#employeesalarysheetsFiscalYearId').change(function () {
        var yearId = $(this).val();
        $.ajax({
            url: '<?php echo BASE_URL ?>admin/Apis/get_months',
            type: 'POST',
            data: {yearId: yearId},
            success: function (result) {
                result = $.parseJSON(result);
                var options = '<option value="0">Select current Basic</option>'
                $.each(result, function (index, value) {
                    options += '<option value=' + '"' + index + '">' + value + '</option>'
                });
                $('#employeesalarysheetsMonthId').html(options);
            }
        });
    });
</script>