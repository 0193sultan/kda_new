<style type="text/css">
    #project_name,#work_order{
        display: none;
    }
</style>

<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Contructor Bill Payment'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Contructor Bill Payment List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('ContructorBillPayment', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php
                    echo $this->Form->input('payment_type', array('class' => 'form-control', 'id' => 'payment_type', 'options' => array(1 => 'Non Project Payment', 2 => 'Project Payment')));
                    ?>
                </div>
                <div class="form-group" id="project_name">
                    <?php
                    echo $this->Form->input('contructor_project_name_id', array('label' => 'Project Name', 'class' => 'form-control', 'id' => 'contructor_project_name_id', 'empty' => array('' => '------ Please Select ------')));
                    ?>
                </div>
                <div class="form-group">
                    <?php
                    echo $this->Form->input('contructor_name_id', array('label' => 'Contructor Name', 'class' => 'form-control', 'id' => 'contructor_name_id', 'empty' => array('' => '------ Please Select ------')));
                    ?>
                </div>
                <!--                <div class="form-group">
                <?php echo $this->Form->input('work_order_no', array('class' => 'form-control', 'id' => 'work_order_no_1', 'empty' => array('' => '------ Please Select ------'))); ?>
                                </div>-->
                <div class="form-group" id="work_order">
                    <?php echo $this->Form->input('work_order_id', array('id' => 'work_order_id', 'class' => 'form-control', 'empty' => array('' => '------ Please Select ------'))); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('bill_amount', array('class' => 'form-control', 'id' => 'bill_amount', 'type' => 'number')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('voucher_no', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('check_no', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('bank_info_id', array('class' => 'form-control bank_id', 'empty' => '---- Please Select ----')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('bank_account_id', array('class' => 'form-control account_no', 'empty' => '---- Please Select ----')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('vat_%', array('class' => 'form-control', 'id' => 'vat', 'type' => 'number', 'min' => 1)); ?>
                </div>
                <!-- <div class="form-group">
                <?php echo $this->Form->input('vat', array('class' => 'form-control')); ?>
                </div> -->
                <div class="form-group">
                    <?php echo $this->Form->input('tax_%', array('class' => 'form-control', 'id' => 'tax', 'type' => 'number', 'min' => 1)); ?>
                </div>
                <!-- <div class="form-group">
                <?php echo $this->Form->input('tax', array('class' => 'form-control')); ?>
                </div> -->
                <div class="form-group">
                    <?php echo $this->Form->input('security_money_%', array('class' => 'form-control', 'id' => 'money', 'type' => 'number', 'min' => 1)); ?>
                </div>
                <!-- <div class="form-group">
                <?php echo $this->Form->input('security_money', array('class' => 'form-control')); ?>
                </div> -->
                <div class="form-group">
                    <?php echo $this->Form->input('advance_adjustment', array('class' => 'form-control show', 'id' => 'adjustMoney', 'type' => 'number')); ?>
                    <span class="text-danger" id="adjust_amount"></span>
                </div>
                <script type="text/javascript">
                    var base_url = "<?php echo BASE_URL; ?>";
                    $(document).ready(function () {
                        $('.show').keyup(function () {
                            var adjust_amount = $(".show").val();
                            var work_order_id = $("#work_order_id").val();
                            $.ajax({
                                url: base_url + "ContructorBillPayments/check_advance",
                                method: "POST",
                                data: {adjust_amount: adjust_amount, work_order_id: work_order_id},
                                dataType: "json",
                                success: function (data) {
                                    var remaining = parseInt(data);
                                    if (adjust_amount > remaining) {
                                        $("#erros").html("You have " + remaining + " remaining adjustment");
                                    } else {
                                        $("#erros").html(" ");
                                    }
                                }
                            });
                        });
                    });
                </script>

                <div class="form-group">
                    <?php echo $this->Form->input('net_pay', array('class' => 'form-control', 'id' => 'total', 'type' => 'number')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('bill_pay_date', array('type' => 'text', 'class' => 'form-control datepicker', 'required' => true)); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('payment_note', array('class' => 'form-control')); ?>
                </div>
                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {
        $('#display-none').hide();
    });
</script>
<script>
    $(document).ready(function () {
        function account_no(bank_id) {
            $.ajax({
                url: '<?php echo BASE_URL . 'admin/DailyTransactions/get_account_no' ?>',
                'type': 'POST',
                data: {bank_id: bank_id},
                success: function (response) {
                    console.log(response);
                    var obj = jQuery.parseJSON(response);
                    $('.account_no option').remove();
                    for (var i = 0; i < obj.length; i++) {
                        optionList = '<option value="' + obj[i].BankAccount.id + '">' + obj[i].BankAccount.name + '</option>';
                        $('.account_no').append(optionList);
                    }
                }
            });
        }

        function check_bill_amount(contructor_project_name_id, contructor_name_id, work_order_id, adjustAmount) {
            if (contructor_project_name_id != '' && contructor_name_id != '' && work_order_id != '' && adjustAmount != '') {
                $.ajax({
                    url: '<?php echo BASE_URL ?>admin/ContructorBillPayments/check_bill_amount',
                    type: 'POST',
                    data: {contructor_project_name_id: contructor_project_name_id, contructor_name_id: contructor_name_id, work_order_id: work_order_id},
                    success: function (result) {
                        result = $.parseJSON(result);
                        var adjust_amount = 'You have ' + result.array.total_advance_paid + ' adjustment remaining !';
                        console.log(result.array.total_advance_paid);
                        console.log(adjustAmount);
                        if (parseInt(result.array.total_advance_paid) >= parseInt(adjustAmount)) {
                            $(':input[type="submit"]').prop('disabled', false);
                            $('#adjust_amount').html('');
                        } else {
                            $('#adjust_amount').html(adjust_amount);
                            $(':input[type="submit"]').prop('disabled', true);
                        }
                    }
                });
            } else {
                $('#adjust_amount').html('');
                $(':input[type="submit"]').prop('disabled', false);
            }
        }
        function get_workorder_no(contructor_project_name_id, contructor_name_id) {
            if (contructor_project_name_id != '' && contructor_name_id != '') {
                $.ajax({
                    url: '<?php echo BASE_URL ?>admin/ContructorAdvancePayments/get_workorder_no',
                    type: 'POST',
                    data: {contructor_project_name_id: contructor_project_name_id, contructor_name_id: contructor_name_id},
                    success: function (result) {
                        result = $.parseJSON(result);
                        console.log(result);
                        if (result.length != 0) {
                            var options = '<option >------ Please Select ------</option>'
                            for (var x in result) {
                                options += '<option value=' + '"' + result[x].WorkOrder.id + '">' + result[x].WorkOrder.work_order_no + '</option>'
                            }
                            //console.log(options);
                            $('#work_order_id').html(options);
                        } else {
                            $('#work_order_id').html('');
                        }
                    }
                });
            } else {
                $('#work_order_id').html('');
            }
        }
        $("body").on("change", "#payment_type", function () {
            var payment_type = $(this).val();
            if (payment_type == 1) {
                $('#project_name,#work_order').hide();
                $('#contructor_project_name_id,#work_order_id').prop('disabled', true);
            } else {
                $('#project_name,#work_order').show();
                $("#project_name,#work_order").css("margin-bottom", "18px");
                $('#contructor_project_name_id,#work_order_id').prop('disabled', false);
            }
        });

        $("body").on("change", "#work_order_id", function () {
            var work_order_id = $(this).val();
            var contructor_project_name_id = $('#contructor_project_name_id').val();
            var contructor_name_id = $('#contructor_name_id').val();
            var adjustMoney = $('#adjustMoney').val();
            delay(function () {
                check_bill_amount(contructor_project_name_id, contructor_name_id, work_order_id, adjustMoney);
            }, 1000);
            // console.log(contructor_project_name_id);
        });
        $("body").on("change", "#contructor_project_name_id", function () {
            var contructor_project_name_id = $(this).val();
            console.log(contructor_project_name_id);
            var contructor_name_id = $('#contructor_name_id').val();
            var adjustMoney = $('#adjustMoney').val();
            get_workorder_no(contructor_project_name_id, contructor_name_id);
            delay(function () {
                check_bill_amount(contructor_project_name_id, contructor_name_id, $('#work_order_id').val(), adjustMoney);
            }, 1000);
            // console.log(contructor_project_name_id);
        });
        $("body").on("change", "#contructor_name_id", function () {
            var contructor_project_name_id = $('#contructor_project_name_id').val();
            var contructor_name_id = $(this).val();
            console.log(contructor_name_id);
            var adjustMoney = $('#adjustMoney').val();
            get_workorder_no(contructor_project_name_id, contructor_name_id);
            delay(function () {
                check_bill_amount(contructor_project_name_id, contructor_name_id, $('#work_order_id').val(), adjustMoney);
            }, 1000);
            //console.log(contructor_project_name_id);
        });
        $('body').on("change", ".bank_id", function () {
            var bank_id = $('.bank_id').val();
            account_no(bank_id);
            $('.account_no').html('<option value="">---- Please Select ----</option>');
        });
        var vatAmount = 0;
        var taxAmount = 0;
        var moneyAmount = 0;
        var adjustAmount = 0;
        var qtyValue = 0;
        var delay = (function () {
            var timer = 0;
            return function (callback, ms) {
                clearTimeout(timer);
                timer = setTimeout(callback, ms);
                // console.log(timer);
            };
        })();

        // Calculation for Bill Amount
        var bill_amount = $("#bill_amount");
        var billAmount = bill_amount.keyup(function () {
            qtyValue = parseInt(this.value);
            $('#contructor_project_name_id').val();
            $("#total").val(qtyValue - (parseInt(vatAmount) + parseInt(taxAmount) + parseInt(moneyAmount) + parseInt(adjustAmount)));
        });

        // Calculation for Vat
        var vat = $("#vat");
        var vatCalculate = vat.keyup(function () {
            vatAmount = (parseInt(billAmount.val()) * parseInt((vat).val())) / 100;
            $("#total").val(parseInt(billAmount.val()) - (parseInt(vatAmount) + parseInt(taxAmount) + parseInt(moneyAmount) + parseInt(adjustAmount)));
        });

        // Calculation for Tax
        var tax = $("#tax");
        var taxCalculate = tax.keyup(function () {
            taxAmount = (parseInt(billAmount.val()) * parseInt((tax).val())) / 100;
            $("#total").val(parseInt(billAmount.val()) - (parseInt(vatAmount) + parseInt(taxAmount) + parseInt(moneyAmount) + parseInt(adjustAmount)));
        });

        // Calculation for Security Money
        var money = $("#money");
        var moneyCalculate = money.keyup(function () {
            moneyAmount = (parseInt(billAmount.val()) * parseInt((money).val())) / 100
            $("#total").val(parseInt(billAmount.val()) - (parseInt(vatAmount) + parseInt(taxAmount) + parseInt(moneyAmount) + parseInt(adjustAmount)));
        });

        // Calculation for Advance Adjustment
        var adjust = $('#adjustMoney');
        var adjustCalculate = adjust.keyup(function () {
            adjustAmount = parseInt(adjust.val());
            delay(function () {
                check_bill_amount($('#contructor_project_name_id').val(), $('#contructor_name_id').val(), $('#work_order_id').val(), adjustAmount);
            }, 1000);
            $("#total").val(parseInt(qtyValue) - (parseInt(vatAmount) + parseInt(taxAmount) + parseInt(moneyAmount) + parseInt(adjustAmount)));

        });

        var total = $("#total");
        total.click(function () {
            var totalAmount = parseInt(billAmount.val()) - (parseInt(vatCalculate.val()) + parseInt(taxCalculate.val()) + parseInt(moneyCalculate.val()) + parseInt(adjustCalculate.val()));
            var total = totalAmount;

        });
    });
</script>