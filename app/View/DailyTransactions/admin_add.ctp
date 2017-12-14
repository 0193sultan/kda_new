<style>
    .transaction_type_id{
        display: none;
    }
</style>
<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Daily Transaction'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Daily Transaction List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('DailyTransaction', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('entry_type_id', array('class' => 'form-control', 'id' => 'entry_type_id', 'empty' => '---- Please Select ----')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('acc_head_type_id', array('label' => 'Head Type :', 'class' => 'form-control head_type_id', 'id' => 'head_type_id', 'empty' => '---- Please Select ----')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('acc_head_list_id', array('label' => 'Head Name :', 'class' => 'form-control head_list', 'empty' => '---- Please Select ----', 'required')); ?>
                    <span style="color:red;">*</span>
                </div>
                <div class="form-group sub_head_list_div">
                    <?php echo $this->Form->input('sub_head_list_id', array('label' => 'Sub Head Name :', 'class' => 'form-control sub_head_list', 'empty' => '---- Please Select ----')); ?>
                    <span style="color:red;">*</span>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('transaction_category_id', array('class' => 'form-control', 'id' => 'transaction_category_id', 'empty' => '---- Please Select ----')); ?>
                </div>
                <div id="bank_info">
                    <div class="form-group">
                        <?php echo $this->Form->input('check_no', array('class' => 'form-control')); ?>
                    </div>
                    <div class="form-group">
                        <?php echo $this->Form->input('bank_info_id', array('class' => 'form-control bank_id', 'empty' => '---- Please Select ----')); ?>
                    </div>
                    <!--                    <div class="form-group">
                    <?php echo $this->Form->input('branch_id', array('class' => 'form-control branch_id', 'empty' => '---- Please Select ----')); ?>
                                        </div>-->
                    <div class="form-group">
                        <?php echo $this->Form->input('bank_account_id', array('class' => 'form-control account_no', 'empty' => '---- Please Select ----')); ?>
                    </div>
                </div>
                <div class="form-group transaction_type_id">
                    <?php echo $this->Form->input('transaction_type_id', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control', 'empty' => '---- Please Select ----')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('month_id', array('class' => 'form-control', 'empty' => '---- Please Select ----')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('transaction_amount', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('voucher_no', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('transaction_date', array('class' => 'form-control datepicker', 'type' => 'text')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('transaction_note', array('class' => 'form-control')); ?>
                </div>
                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>


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
            account_no(bank_id);
            $('.account_no').html('<option value="">---- Please Select ----</option>');
        });

//        $('body').on("change", ".branch_id", function () {
//            var bank_id = $('.bank_id').val();
//            var branch_id = $('.branch_id').val();
//            account_no(bank_id);
//        });
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