<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Bank Account'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Bank Account List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('BankAccount', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('bank_info_id', array('class' => 'form-control bank_id', 'empty' => '---- Please Select ----')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('branch_id', array('class' => 'form-control branch_id', 'empty' => '---- Please Select ----')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('account_no', array('class' => 'form-control')); ?>
                </div>
<!--                <div class="form-group">
                    <?php echo $this->Form->input('account_type', array('class' => 'form-control')); ?>
                </div>-->
                <div class="form-group">
                    <?php echo $this->Form->input('status', array('class' => 'form-control', 'options' => array('Active' => 'Active', 'Inactive' => 'Inactive'))); ?>
                </div>

                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {

        $('body').on("change", ".bank_id", function () {
            var bank_id = $('.bank_id').val();

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

        });

    });
</script>