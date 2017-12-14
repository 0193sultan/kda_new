<style>
    .iradio_minimal{
        margin: 2px 5px 6px 25px;
    }
</style>

<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Acc Head List'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Acc Head List List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('AccHeadList', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('acc_head_type_id', array('class' => 'form-control head_type_id', 'empty' => '---- Please Select ----')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('head_name', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('has_parent', array('class' => 'form-control has_parent', 'options' => array('No' => 'No', 'Yes' => 'Yes'))); ?>
                </div>
                <div class="form-group parent_id">
                    <?php echo $this->Form->input('parent_id', array('class' => 'form-control head_list', 'empty' => '---- Please Select ----')); ?>
                    <span style="color:red;">*</span>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('order_no', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group effect_on_div">
                    <?php echo $this->Form->input('acc_effect_id', array('label' => 'Effect On :', 'class' => 'form-control effect_on', 'value' => 6)); ?>
                </div>
                <div class="form-group action_head_id_div">
                    <?php echo $this->Form->input('action_head_id', array('class' => 'form-control action_head_id', 'empty' => '---- Please Select ----')); ?>
                    <span style="color:red;">*</span>
                </div>
                <div class="form-group action_sub_head_id_div">
                    <?php echo $this->Form->input('action_sub_head_id', array('class' => 'form-control action_sub_head_id', 'empty' => '---- Please Select ----')); ?>
                    <span style="color:red;">*</span>
                </div>
                <div class="form-group action_type_div">
                    <?php echo $this->Form->input('action_type', array('class' => 'form-control action_type', 'empty' => '---- Please Select ----', 'options' => array('1' => 'Addition', '2' => 'Subtraction'))); ?>
                    <span style="color:red;">*</span>
                </div>
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
        $('.parent_id').hide();
        $('.effect_on_div').hide();
        $('.action_head_id_div').hide();
        $('.action_sub_head_id_div').hide();
        $('.action_type_div').hide();

        $('.has_parent').change(function () {
            if ($('.has_parent').val() == 'Yes') {
                $('.parent_id').show();
                $('.head_list').attr('required', true);
            } else {
                $('.parent_id').hide();
                $('.head_list').attr('required', false);
                $('.head_list').html('<option value="">---- Please Select ----</option>');
                $('.head_type_id').val('');
            }
        });

        $('body').on("change", ".head_type_id", function () {
            var head_type_id = $('.head_type_id').val();
            head_list(head_type_id);

            if (head_type_id == 1 || head_type_id == 2) {
                $('.effect_on_div').show();
            } else {
                $('.effect_on_div').hide();
            }
        });
    });

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
            }
        });
    }

</script>

<script>
    $(document).ready(function () {
        $('body').on("change", ".effect_on", function () {
            var effect_on_id = $(this).val();
            if (effect_on_id == 3 || effect_on_id == 4 || effect_on_id == 5) {
                $('.action_head_id_div').show();
                $('.action_type_div').show();
                $('.action_head_id').attr('required', true);
                $('.action_type').attr('required', true);
                action_head_list(effect_on_id);
            } else {
                $('.action_head_id_div').hide();
                $('.action_sub_head_id_div').hide();
                $('.action_type_div').hide();
                $('.action_head_id').attr('required', false);
                $('.action_sub_head_id').attr('required', false);
                $('.action_type').attr('required', false);
            }
        });

        $('body').on("change", ".action_head_id", function () {
            var action_head_id = $(this).val();
            action_sub_head_list(action_head_id);
        });
    });

    function action_head_list(effect_on_id) {
        $.ajax({
            url: '<?php echo BASE_URL . 'admin/DailyTransactions/get_head_list' ?>',
            'type': 'POST',
            data: {head_type_id: effect_on_id},
            success: function (response) {
                var obj = jQuery.parseJSON(response);
                $('.action_head_id option').remove();
                for (var i = 0; i < obj.length; i++) {
                    optionList = '<option value="' + obj[i].AccHeadList.id + '">' + obj[i].AccHeadList.name + '</option>';
                    $('.action_head_id').append(optionList);
                }
            }
        });
    }

    function action_sub_head_list(parent_id) {
        $.ajax({
            url: '<?php echo BASE_URL . 'admin/DailyTransactions/get_sub_head_list' ?>',
            'type': 'POST',
            data: {parent_id: parent_id},
            success: function (response) {
                var obj = jQuery.parseJSON(response);
                $('.action_sub_head_id option').remove();
                if (obj.length > 1) {
                    for (var i = 0; i < obj.length; i++) {
                        optionList = '<option value="' + obj[i].AccHeadList.id + '">' + obj[i].AccHeadList.name + '</option>';
                        $('.action_sub_head_id').append(optionList);
                    }
                    $('.action_sub_head_id_div').show();
                    $('.action_sub_head_id').attr('required', true);
                } else {
                    $('.action_sub_head_id_div').hide();
                    $('.action_sub_head_id').attr('required', false);
                }
            }
        });
    }

</script>