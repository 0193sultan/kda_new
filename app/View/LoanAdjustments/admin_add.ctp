<style type="text/css">
    #loan-adjustment-content{
        display: none;
    }
    .btn{
        display: none;
    }
    .submit{
        margin-left:0% !important;
    }
</style>
<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Loan Adjustment'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Loan Adjustment List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('LoanAdjustment', array('role' => 'form')); ?>
                <br><br>
                <?php echo $this->Form->input('employees', array('class' => 'form-control', 'empty' => array('' => '------ Please Select ------'))); ?>
                <?php echo $this->Form->input('fiscalYears', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:220px', 'empty' => array('' => '------ Select Year ------'))); ?>
                <?php echo $this->Form->input('month_id', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:220px')); ?>
                <?php //echo $this->Form->button('Search', array('class' => 'btn btn-large btn-primary', 'type' => 'button', 'style' => 'margin-left:10px', 'id' => 'btn_search')); ?>

                <div class="row" id="loan-adjustment-content">
                    <div class="col-sm-12">
                        <div style="margin-bottom:30px;">
                            <h3>Loan Deposit</h3>
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th >Close Loan</th>
                                            <th >Loan Adjust Amount</th>
                                            <th>Deposit Date</th>
                                            <th>loan Name</th>
                                            <th>Loan Amo.</th>
                                            <th>Current Due</th>
                                            <th>Interest Amo. Due</th>
                                            <th>Inst. Amo.</th>
                                            <th>1st Inst. Amo.</th>
                                            <th>1st Inst. Date</th>
                                            <th>2nd Inst. Amo.</th>
                                            <th>2nd Inst. Date</th>
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
                </div><?php //echo $this->App->get_loan_name("'"+id+"'");                    ?>
                    <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        function loan_name(loan_id) {
            var loan_data = '';
            $.ajax({
                url: '<?php echo BASE_URL; ?>admin/loanAdjustments/loan_name',
                async: false,
                method: "POST",
                data: {loan_id: loan_id},
                //dataType: "text",
                success: function (data)
                {
                    var result = $.parseJSON(data);
                    //console.log(result);
                    loan_data = result.responseData[0].Loan.name;
                    /*$("#a").html(data);*/
                }
            });
            // console.log(loan_data);
            return loan_data;
        }
        function year_month(yearId, monthId) {
            if (monthId != '' && monthId != null && yearId != '') {
                $('.btn').show();
            } else {
                $('.btn').hide();
            }
        }
        $('#LoanAdjustmentMonthId').change(function () {
            var yearId = $('#LoanAdjustmentFiscalYears').val();
            var monthId = $(this).val();
            year_month(yearId, monthId);
        });
        $('#LoanAdjustmentFiscalYears').change(function () {
            var yearId = $(this).val();
            var monthId = $('#LoanAdjustmentMonthId').val();
            year_month(yearId, monthId);
            $.ajax({
                url: '<?php echo BASE_URL ?>admin/Apis/get_months',
                type: 'POST',
                data: {yearId: yearId},
                success: function (result) {
                    result = $.parseJSON(result);
                    var options = '<option value>------ Please Select Month ------</option>'
                    $.each(result, function (index, value) {
                        options += '<option value=' + '"' + index + '">' + value + '</option>'
                    });
                    $('#LoanAdjustmentMonthId').html(options);
                }
            });
        });
        $('#LoanAdjustmentMonthId').change(function () {
            var monthId = $(this).val();
            var yearId = $('#LoanAdjustmentFiscalYears').val();
            year_month(yearId, monthId);
        });
        $("body").on("click", ".datepicker", function () {
            $(this).datepicker();
            $(this).datepicker("show");
        });
        $("#LoanAdjustmentEmployees").change(function () {
            var employee_id = $(this).val();
            // console.log(employee_id);
            if (employee_id != '') {
                $.ajax({
                    url: '<?php echo BASE_URL ?>admin/loanAdjustments/pre_loan',
                    type: 'POST',
                    data: {employee_id: employee_id},
                    success: function (result) {
                        result = $.parseJSON(result);
                        if (result.responseData.length != 0) {
                            var table_data;
                            var hidden_text;
                            // var table = "<table><tr><td>#</td><td>GPF Loan</td><td>Total Loan Amount</td></tr>";
                            var i = 0;
                            for (var x in result.responseData) {
                                table_data += '<tr>\
                        <td><input type=checkbox name=data[EmployeeLoan][employee_loan_id][] value=' + result.responseData[x].EmployeeLoan.id + '></td>\n\
<td><input type=checkbox name=data[EmployeeLoan][close_loan_id][] value=' + result.responseData[x].EmployeeLoan.id + '></td>\
                                                    <td><input type=number name=data[EmployeeLoan][loan_adjust][' + result.responseData[x].EmployeeLoan.id + '] style=width:100px ></td>\
                                                        <td><input type=text name=data[EmployeeLoan][adjustment_date][' + result.responseData[x].EmployeeLoan.id + '] style=width:100px class="datepicker" ></td>\
                            <td>' + loan_name(result.responseData[x].EmployeeLoan.loan_id) + '</td>\
    <td>' + result.responseData[x].EmployeeLoan.loan_amount + '</td>\
        <td>' + result.responseData[x].EmployeeLoan.current_due + '</td>\
            <td>' + result.responseData[x].EmployeeLoan.interest_amount_due + '</td>\
                <td>' + result.responseData[x].EmployeeLoan.installment_amount + '</td>\
                <td>' + result.responseData[x].EmployeeLoan.first_installment_amount + '</td>\
                    <td>' + result.responseData[x].EmployeeLoan.first_installment_date + '</td>\
                        <td>' + result.responseData[x].EmployeeLoan.second_installment_amount + '</td>\
                            <td>' + result.responseData[x].EmployeeLoan.second_installment_date + '</td>\
</tr>';
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
    <input type="hidden" name=data[EmployeeLoan][previous_loan][' + result.responseData[x].EmployeeLoan.id + '][loan_id] value=' + result.responseData[x].EmployeeLoan.loan_id + '>\
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
        });
    });
</script>
