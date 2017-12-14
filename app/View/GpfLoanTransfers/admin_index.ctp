<style type="text/css">
    #loan-adjustment-content{
        display: none;
    }
</style>
<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Employee Loan'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Employee Loan List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('EmployeeLoan', array('role' => 'form')); ?>
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>
                                    <td>Department Name</td>
                                    <td>Designation</td>
                                    <td>Employee Name</td>
                                </tr>
                                <tr>
                                    <td>
                                        <?php
                                        $dprtmnt = array('' => '------ Please Select ------');
                                        foreach ($department as $key => $value) {
                                            $dprtmnt["$key"] = $value;
                                        }
                                        $dgnton = array('' => '------ Please Select ------');
                                        foreach ($designation as $key => $value) {
                                            $dgnton["$key"] = $value;
                                        }
                                        ?>
                                        <?php echo $this->Form->input('department', array('options' => $dprtmnt, 'legend' => false, 'label' => false)); ?></td>
                                    <td><?php echo $this->Form->input('designation', array('options' => $dgnton, 'legend' => false, 'label' => false)); ?></td>
                                    <td><?php echo $this->Form->input('employee_id', array('legend' => false, 'label' => false, 'empty' => array('' => '------ Please Select ------'))); ?></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <br>

                <p id="a"></p>

                <!-- <div class="form-group">
                <?php echo $this->Form->input('employee_id', array('class' => 'form-control')); ?>
                </div> -->
                <div class="form-group">
                    <?php echo $this->Form->input('loan_type_id', array('class' => 'form-control', 'empty' => array('' => '------ Please Select ------'))); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('loan_id', array('class' => 'form-control')); ?>
                </div>
                <div class="row" id="loan-adjustment-content">
                    <div class="col-sm-8 col-sm-offset-2">
                        <div style="margin-bottom:30px; width: 90%; margin-left: 10%">
                            <h3>Loan Transfer</h3>
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>GPF Loan</th>
                                            <th>Total Loan Amount</th>
                                            <th>Current Due</th>
                                            <th>Interest Amount</th>
                                            <th>Interest Amount Due</th>
                                        </tr>
                                    </thead>
                                    <tbody id="loan-adjustment">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="hidden_text_id">

                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('refundable', array('class' => 'form-control', 'id' => 'fund_able', 'options' => array("Refundable", 'Non Refundable'))); ?>
                    <br><br></div>

                <script type="text/javascript">

                    $(document).ready(function () {
                        $("#EmployeeLoanNumberOfInstallment").keyup(function () {
                            loan_amount = $('#EmployeeLoanLoanAmount').val();
                            ttl_ins = $('#EmployeeLoanNumberOfInstallment').val();

                            ins_amount = loan_amount / ttl_ins;
                            ins_amount = ins_amount.toFixed(2);

                            $("#EmployeeLoanInstallmentAmount").val(ins_amount);
                        });
                    })
                </script>


               <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    // var base_url = "<?php echo BASE_URL; ?>";
    $(document).ready(function () {
        function get_gpf_loan(employee_id, loan_type_id, loan_id, fund_able) {
            if (employee_id != '' && loan_type_id != '' && loan_id != '' && fund_able != 1) {
                $.ajax({
                    url: '<?php echo BASE_URL ?>admin/EmployeeLoans/get_gpf_loan',
                    type: 'POST',
                    data: {employee_id: employee_id, loan_type_id: loan_type_id, loan_id: loan_id},
                    success: function (result) {
                        result = $.parseJSON(result);
                        if (result.responseData.length != 0) {
                            var table_data;
                            var hidden_text;
                            // var table = "<table><tr><td>#</td><td>GPF Loan</td><td>Total Loan Amount</td></tr>";
                            var i = 0;
                            for (var x in result.responseData) {
                                table_data += '<tr><td><input type=checkbox name=data[EmployeeLoan][employee_loan_id][] value=' + result.responseData[x].EmployeeLoan.id + '></td>\n\
                        <td>GPF Loan</td><td>' + result.responseData[x].EmployeeLoan.loan_amount + '</td>\n\
<td>' + result.responseData[x].EmployeeLoan.current_due + '</td>\n\
<td>' + result.responseData[x].EmployeeLoan.interest_amount + '</td>\n\
<td>' + result.responseData[x].EmployeeLoan.interest_amount_due + '</td></tr>';
                                // table += '<option value=' + '"' + result.responseData[x].EmployeeLoan.id + '">' + result.landAcquisition[x].ProjectWisePlotCategory.name + '</option>'
                                hidden_text += '<input type="hidden" name=data[EmployeeLoan][previous_loan][' + result.responseData[x].EmployeeLoan.id + '][current_due] value=' + result.responseData[x].EmployeeLoan.current_due + '>\
<input type="hidden" name=data[EmployeeLoan][previous_loan][' + result.responseData[x].EmployeeLoan.id + '][interest_amount] value=' + result.responseData[x].EmployeeLoan.interest_amount + '>\
<input type="hidden" name=data[EmployeeLoan][previous_loan][' + result.responseData[x].EmployeeLoan.id + '][interest_amount_due] value=' + result.responseData[x].EmployeeLoan.interest_amount_due + '>\
<input type="hidden" name=data[EmployeeLoan][previous_loan][' + result.responseData[x].EmployeeLoan.id + '][loan_amount] value=' + result.responseData[x].EmployeeLoan.loan_amount + '>\
<input type="hidden" name=data[EmployeeLoan][previous_loan][' + result.responseData[x].EmployeeLoan.id + '][first_installment_amount] value=' + result.responseData[x].EmployeeLoan.first_installment_amount + '>\
<input type="hidden" name=data[EmployeeLoan][previous_loan][' + result.responseData[x].EmployeeLoan.id + '][first_installment_date] value=' + result.responseData[x].EmployeeLoan.first_installment_date + '>\
<input type="hidden" name=data[EmployeeLoan][previous_loan][' + result.responseData[x].EmployeeLoan.id + '][second_installment_date] value=' + result.responseData[x].EmployeeLoan.second_installment_date + '>\
<input type="hidden" name=data[EmployeeLoan][previous_loan][' + result.responseData[x].EmployeeLoan.id + '][second_installment_amount] value=' + result.responseData[x].EmployeeLoan.second_installment_amount + '>\
<input type="hidden" name=data[EmployeeLoan][previous_loan][' + result.responseData[x].EmployeeLoan.id + '][loan_type_id] value=' + result.responseData[x].EmployeeLoan.loan_type_id + '>\
<input type="hidden" name=data[EmployeeLoan][previous_loan][' + result.responseData[x].EmployeeLoan.id + '][id] value=' + result.responseData[x].EmployeeLoan.id + '>';
                                i++;
                            }
                            var res = hidden_text.replace("undefined", "");
                            //var parse_data =$.parseHTML(hidden_text);
                            // table_data
                            //loan-adjustment-content
                            $('#loan-adjustment-content').show();
                            $('#loan-adjustment').html(table_data);
                            $('#hidden_text_id').html(res);
                        } else {
                            $('#loan-adjustment').html('');
                            $('#loan-adjustment-content').hide();
                            $('#hidden_text_id').html(res);
                        }
                    }
                });
            } 
        }
        $('#EmployeeLoanDesignation').change(function () {

            var department_id = $("#EmployeeLoanDepartment option:selected").val();
            var designation_id = $("#EmployeeLoanDesignation option:selected").val();
            // console.log(designation_id);
            $.ajax({
                url: '<?php echo BASE_URL; ?>admin/EmployeeLoans/get_employee_names',
                method: "POST",
                data: {department_id: department_id, designation_id: designation_id},
                //dataType: "text",
                success: function (data)
                {

                    $("#EmployeeLoanEmployeeId").html(data);
                    /*$("#a").html(data);*/
                }
            });

        });

        $('#EmployeeLoanLoanTypeId').change(function () {
            var loanType = $(this).val();
            var parseLoanType = parseInt(loanType);
            // console.log(parseLoanType);

            $.ajax({
                url: '<?php echo BASE_URL; ?>admin/EmployeeLoans/get_loans',
                method: "POST",
                data: {loan_type_id: parseLoanType},
                success: function (data)
                {
                    $("#EmployeeLoanLoanId").html(data);
                    /*$("#a").html(data);*/
                }
            });

        });
        $("#fund_able").change(function () {
            var fund_able = $(this).val();
            var employee_id = $("#EmployeeLoanEmployeeId option:selected").val();
            var loan_type_id = $("#EmployeeLoanLoanTypeId option:selected").val();
            var loan_id = $("#EmployeeLoanLoanId option:selected").val();
            get_gpf_loan(employee_id, loan_type_id, loan_id, fund_able);
        });
        $("#EmployeeLoanEmployeeId").change(function () {
            var fund_able = $("#fund_able option:selected").val();
            var employee_id = $(this).val();
            var loan_type_id = $("#EmployeeLoanLoanTypeId option:selected").val();
            var loan_id = $("#EmployeeLoanLoanId option:selected").val();
            get_gpf_loan(employee_id, loan_type_id, loan_id, fund_able);
        });
        $("#EmployeeLoanLoanTypeId").change(function () {
            var fund_able = $("#fund_able option:selected").val();
            var employee_id = $("#EmployeeLoanEmployeeId option:selected").val();
            var loan_type_id = $(this).val();
            var loan_id = $("#EmployeeLoanLoanId option:selected").val();
            get_gpf_loan(employee_id, loan_type_id, loan_id, fund_able);
        });
        $("#EmployeeLoanLoanId").change(function () {
            var fund_able = $("#fund_able option:selected").val();
            var employee_id = $("#EmployeeLoanEmployeeId option:selected").val();
            var loan_type_id = $("#EmployeeLoanLoanTypeId option:selected").val();
            var loan_id = $(this).val();
            get_gpf_loan(employee_id, loan_type_id, loan_id, fund_able);
        });
    });
</script>