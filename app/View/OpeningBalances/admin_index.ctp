<style>
    #display_acc_head_list{
        display: none;
        margin-bottom:16px;
    }
    #balance_type_id{
        display: none;
    }
</style>
<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Opening Balance'); ?></h3>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('OpeningBalances', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('fiscal_year_id', array('id' => 'fiscal_year_id', 'class' => 'form-control', 'empty' => '---- Please Select ----', 'required=required')); ?>
                    <span style="color:#d00">*</span>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('month_id', array('id' => 'month_id', 'class' => 'form-control', 'empty' => '---- Please Select ----', 'required=required')); ?>
                    <span style="color:#d00">*</span>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('acc_head_type_id', array('id' => 'acc_head_type_id', 'class' => 'form-control', 'empty' => '---- Please Select ----', 'required=required')); ?>
                    <span style="color:#d00">*</span>
                </div>
                <div class="form-group" id="display_acc_head_list">
                    <?php echo $this->Form->input('acc_head_list_id', array('id' => 'acc_head_list_id', 'class' => 'form-control', 'empty' => '---- Please Select ----')); ?>
                    <span style="color:#d00">*</span>
                </div>
                <div class="form-group" id="balance_type_id">
                    <?php echo $this->Form->input('balance_type', array('id' => 'balance_type', 'class' => 'form-control', 'options' => array('' => '---- Please Select ----', 1 => 'Opening Balance', 2 => 'New Balance'))); ?>
                </div>
                <br>
                <div class="row">
                    <div id="show_data"></div>
                </div>
                <br>
                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('body').on("change", ".bank_id", function () {
            var bank_id = $('.bank_id').val();
            branch_list(bank_id);
            $('.account_no').html('<option value="">---- Please Select ----</option>');
        });

        $('body').on("change", ".branch_id", function () {
            var bank_id = $('.bank_id').val();
            var branch_id = $('.branch_id').val();
            account_no(bank_id, branch_id);
        });
        function branch_list(bank_id) {
            $.ajax({
                url: '<?php echo BASE_URL . 'admin/BankAccounts/get_branch_list' ?>',
                'type': 'POST',
                data: {bank_id: bank_id},
                success: function (response) {
                    var obj = jQuery.parseJSON(response);
                    $('.branch_id option').remove();
                    for (var i = 0; i < obj.length; i++) {
                        optionList = '<option value="' + obj[i].Branch.id + '">' + obj[i].Branch.name + '</option>';
                        $('.branch_id').append(optionList);
                    }
                }
            });
        }

        function account_no(bank_id, branch_id) {
            $.ajax({
                url: '<?php echo BASE_URL . 'admin/DailyTransactions/get_account_no' ?>',
                'type': 'POST',
                data: {bank_id: bank_id, branch_id: branch_id},
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
        $("body").on("click", ".datepicker", function () {
            $(this).datepicker();
            $(this).datepicker("show");
        });
        catch_content = null;
        tagWithoutContent = null;
        function balance_entry_for_fix_asset(acc_head_type_id, acc_head_list_id) {
            var view_page;
            if (acc_head_type_id != '') {
                if (acc_head_type_id == 3) {
                    view_page = 'balance_entry_for_fix_asset';
                    $('#display_acc_head_list').hide();
                } else if (acc_head_type_id == 4) {
                    $('#display_acc_head_list').show();
                    if (acc_head_list_id == 5) {
                        view_page = 'cash_in_hand';
                    } else if (acc_head_list_id == 9) {
                        view_page = 'balance_entry_for_cash_in_account';
                        $('#balance_type_id').hide();
                    } else if (acc_head_list_id == 10) {
                        view_page = 'balance_entry_for_fix_deposit';
                        $('#balance_type_id').show();
                    } else if (acc_head_list_id == 11) {
                        view_page = 'entry_for_stock_goods';
                    } else {
                        view_page = 0;
                        $('#show_data').html('');
                    }
                } else if (acc_head_type_id == 5) {
                    $('#display_acc_head_list').show();
                    $('#balance_type_id').show();
                    if (acc_head_list_id > 1) {
                        view_page = 'balance_entry_for_fix_liabilities';
                    } else {
                        view_page = 0;
                        $('#show_data').html('');
                    }
                } else if (acc_head_type_id == 6) {
                    view_page = 'balance_entry_for_fund';
                    $('#display_acc_head_list').hide();
                } else {
                    $('#display_acc_head_list').hide();
                    view_page = 0;
                    $('#show_data').html('');
                }
                if (view_page != 0) {
                    $.ajax({
                        type: "POST",
                        url: '<?php echo BASE_URL ?>admin/OpeningBalances/' + view_page,
                        data: {acc_head_type_id: acc_head_type_id},
                        dataType: 'html',
                        success: function (response) {
                            $('#show_data').html(response);
                            catch_content = response;
                        }
                    });
                } else {
                    $('#show_data').html('');
                }
            } else {
                $('#display_acc_head_list').hide();
                $('#show_data').html('');
            }
        }
        $("body").on("change", "#balance_type", function () {
            var balance_type = $(this).val();
            if (balance_type == 2) {
                $("#new_balance_for_fix_deposit").show();
            } else {
                $("#new_balance_for_fix_deposit").hide();
            }
        });
        $("body").on("change", "#acc_head_type_id", function () {
            var fiscal_year_id = $('#fiscal_year_id').val();
            var month_id = $('#month_id').val();
            var acc_head_type_id = $(this).val();
            var acc_head_list_id = $('#acc_head_list_id').val();
            if ((acc_head_type_id != '' && acc_head_type_id == 4) || (acc_head_type_id != '' && acc_head_type_id == 5)) {
                $.ajax({
                    url: '<?php echo BASE_URL ?>admin/OpeningBalances/get_acc_head_list',
                    type: 'POST',
                    data: {acc_head_type_id: acc_head_type_id},
                    success: function (result) {
                        result = $.parseJSON(result);
                        //console.log(result.accHeadLists);
                        if (result != '') {
                            var options = '<option >------- Please Select ------</option>'
                            for (var x in result.accHeadLists) {
                                options += '<option value=' + '"' + result.accHeadLists[x].AccHeadList.id + '">' + result.accHeadLists[x].AccHeadList.head_name + '</option>'
                            }
                            $('#acc_head_list_id').html(options);
                        }
                    }
                });
            } else {
                $('#acc_head_list_id').html('');
            }
            balance_entry_for_fix_asset(acc_head_type_id, acc_head_list_id);
        });
        $("body").on("change", "#acc_head_list_id", function () {
            var fiscal_year_id = $('#fiscal_year_id').val();
            var month_id = $('#month_id').val();
            var acc_head_type_id = $('#acc_head_type_id').val();
            var acc_head_list_id = $(this).val();
            balance_entry_for_fix_asset(acc_head_type_id, acc_head_list_id);
        });
        $("body").on("click", "button", function () {
            var content = $.parseHTML(catch_content).splice(1, catch_content.length);
            $("#show_data").append(content);
            console.log(content);
        });
    });
</script>
<script>
    $(document).ready(function () {
        $('.sub_head_list_div').hide();
        $("#bank_info").hide();

        $('body').on("change", "#transaction_category_id", function () {
            var transaction_category_id = $(this).val();
            if (transaction_category_id == 2) {
                $("#bank_info").show();
            } else {
                $("#bank_info").hide();
            }
            console.log(transaction_category_id);
            //branch_list(bank_id);
            //$('.account_no').html('<option value="">---- Please Select ----</option>');
        });

        $('body').on("change", ".bank_id", function () {
            var bank_id = $('.bank_id').val();
            branch_list(bank_id);
            $('.account_no').html('<option value="">---- Please Select ----</option>');
        });

        $('body').on("change", ".branch_id", function () {
            var bank_id = $('.bank_id').val();
            var branch_id = $('.branch_id').val();
            account_no(bank_id, branch_id);
        });
//        $('body').on("change", "#entry_type_id", function () {
//            var entry_type_id = $(this).val();
//            var head_type_id = $('.head_type_id').val();
//            console.log(entry_type_id);
//        });

        $('body').on("change", "#head_type_id", function () {
            var head_type_id = $(this).val();
            if (head_type_id == 2) {
                $('#entry_type_id option[value="' + head_type_id + '"]').prop('selected', true);
            } else if (head_type_id == 1) {
                $('#entry_type_id option[value="' + head_type_id + '"]').prop('selected', true);
            } else {
                $('#entry_type_id option[value="' + head_type_id + '"]').prop('selected', false);
            }
            head_list(head_type_id);
            $('.sub_head_list').html('<option value="">---- Please Select ----</option>');
            sub_head_list_visibility();
        });

        $('body').on("change", ".head_list", function () {
            var parent_id = $('.head_list').val();
            sub_head_list(parent_id);
        });
    });

    function branch_list(bank_id) {
        $.ajax({
            url: '<?php echo BASE_URL . 'admin/BankAccounts/get_branch_list' ?>',
            'type': 'POST',
            data: {bank_id: bank_id},
            success: function (response) {
                var obj = jQuery.parseJSON(response);
                $('.branch_id option').remove();
                for (var i = 0; i < obj.length; i++) {
                    optionList = '<option value="' + obj[i].Branch.id + '">' + obj[i].Branch.name + '</option>';
                    $('.branch_id').append(optionList);
                }
            }
        });
    }

    function account_no(bank_id, branch_id) {
        $.ajax({
            url: '<?php echo BASE_URL . 'admin/DailyTransactions/get_account_no' ?>',
            'type': 'POST',
            data: {bank_id: bank_id, branch_id: branch_id},
            success: function (response) {
                var obj = jQuery.parseJSON(response);
                $('.account_no option').remove();
                for (var i = 0; i < obj.length; i++) {
                    optionList = '<option value="' + obj[i].BankAccount.id + '">' + obj[i].BankAccount.name + '</option>';
                    $('.account_no').append(optionList);
                }
            }
        });
    }

    function head_list(head_type_id) {
        $.ajax({
            url: '<?php echo BASE_URL . 'admin/DailyTransactions/get_head_list' ?>',
            'type': 'POST',
            data: {head_type_id: head_type_id},
            success: function (response) {
                var obj = jQuery.parseJSON(response);
                $('.head_list option').remove();
                for (var i = 0; i < obj.length; i++) {
                    optionList = '<option value="' + obj[i].AccHeadList.id + '">' + obj[i].AccHeadList.name + '</option>';
                    $('.head_list').append(optionList);
                }
                sub_head_list_visibility();
            }
        });
    }

    function sub_head_list(parent_id) {
        $.ajax({
            url: '<?php echo BASE_URL . 'admin/DailyTransactions/get_sub_head_list' ?>',
            'type': 'POST',
            data: {parent_id: parent_id},
            success: function (response) {
                var obj = jQuery.parseJSON(response);
                $('.sub_head_list option').remove();
                for (var i = 0; i < obj.length; i++) {
                    optionList = '<option value="' + obj[i].AccHeadList.id + '">' + obj[i].AccHeadList.name + '</option>';
                    $('.sub_head_list').append(optionList);
                }
                sub_head_list_visibility();
            }
        });
    }

    function sub_head_list_visibility() {
        if ($('.sub_head_list').html() == '<option value="">---- Please Select ----</option>') {
            $('.sub_head_list_div').hide();
            $('.sub_head_list').attr('required', false);
        } else {
            $('.sub_head_list_div').show();
            $('.sub_head_list').attr('required', true);
        }
    }
</script>