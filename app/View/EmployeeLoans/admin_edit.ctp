<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Edit Employee Loan'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Employee Loan List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('EmployeeLoan', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('id', array('class' => 'form-control')); ?>
                </div>

                <table border="1px" style="width: 60%;" class="table col-md-offset-1 col-lg-offset-1">
                    <thead>
                    <th>Department Name</th>
                    <th>Designation</th>
                    <th>Employee Name</th>
                    </thead>
                    <tbody>
                        <?php
                
                        $dprtmnt = array(0 => 'select');
                        foreach ($department as $key => $value) {
                            $dprtmnt["$key"] = $value;
                        }
                        $dgnton = array(0 => 'select');
                        foreach ($designation as $key => $value) {
                            $dgnton["$key"] = $value;
                        }
                        /* echo "<pre>";
                          print_r($dprtmnt);
                          exit(); */
                        ?>
                    <td>
                        <?php echo $this->Form->input('department', array('options' => $dprtmnt, 'legend' => false, 'label' => false, 'style' => 'width: 90%')); ?> <br>
                    </td>
                    <td>
                        <?php echo $this->Form->input('designation', array('options' => $dgnton, 'legend' => false, 'label' => false, 'style' => 'width: 90%')); ?> <br>

                    </td>
                    <td>
                        <?php echo $this->Form->input('employee_id', array('legend' => false, 'label' => false, 'style' => 'width: 90%')); ?> <br>

                    </td>
                    </tbody>
                </table> <br>

                <script type="text/javascript">
                    var base_url = "<?php echo BASE_URL; ?>";
                    $(document).ready(function () {

                        $('#EmployeeLoanDesignation').change(function () {

                            var department_id = $("#EmployeeLoanDepartment option:selected").val();
                            var designation_id = $("#EmployeeLoanDesignation option:selected").val();

                            $.ajax({
                                url: base_url + "EmployeeLoans/get_employee_names",
                                method: "POST",
                                data: {department_id: department_id, designation_id: designation_id},
                                dataType: "text",
                                success: function (data)
                                {
                                    $("#EmployeeLoanEmployeeId").html(data);
                                    /*$("#a").html(data);*/
                                }
                            });

                        });


                    });
                </script>
                <p id="a"></p>

                <!-- <div class="form-group">
                <?php echo $this->Form->input('employee_id', array('class' => 'form-control')); ?>
                </div> -->
                <div class="form-group">
                    <?php echo $this->Form->input('loan_type_id', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('loan_id', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('loan_amount', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('number_of_installment', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('installment_amount', array('class' => 'form-control')); ?>
                </div>

                <script type="text/javascript">
                    
                      $(document).ready(function(){
                            $("#EmployeeLoanNumberOfInstallment").keyup(function(){
                                loan_amount = $('#EmployeeLoanLoanAmount').val();
                                ttl_ins = $('#EmployeeLoanNumberOfInstallment').val();

                                ins_amount = loan_amount/ttl_ins;
                                ins_amount = ins_amount.toFixed(2);

                                $("#EmployeeLoanInstallmentAmount").val(ins_amount);
                            });
                        })
                </script>

                <div class="form-group">
                    <?php echo $this->Form->input('loan_apply_date', array('type' => 'text', 'class' => array('form-control', 'datepicker'))); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('loan_approved_date', array('type' => 'text', 'class' => array('form-control', 'datepicker'))); ?>
                </div>

                <div class="form-group">
                    <?php echo $this->Form->input('recovery_start_month_id', array('options' => $Month, 'class' => array('form-control'))); ?>
                </div>

                <div class="form-group">
                    <?php echo $this->Form->input('recovery_year_id', array('options' => $FiscalYear, 'class' => array('form-control'))); ?>
                </div>

             
                <div class="form-group">
                    <!-- <?php echo $this->Form->input('status', array('class' => 'form-control')); ?> -->
                    <?php
                    $roles = array('0' => 'Active', '1' => 'Inactive');
                    echo $this->Form->input('status', array(
                        'options' => $roles,
                        'class' => 'form-control',
                    ));
                    ?>
                </div>

                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>