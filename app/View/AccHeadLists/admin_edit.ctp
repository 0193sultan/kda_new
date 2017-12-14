<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Edit Acc Head List'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Acc Head List List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('AccHeadList', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('id', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('acc_head_type_id', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('head_name', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('head_code', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('has_parent', array('class' => 'form-control has_parent', 'options' => array(0 => 'No', 1 => 'Yes'))); ?>
                </div>
                <div class="form-group parent_id">
                    <?php echo $this->Form->input('parent_id_has', array('type' => 'hidden', 'id' => 'parent_id_has', 'class' => 'form-control', 'label' => 'Work Order Id', 'value' => !empty($parent_id) ? $parent_id : '')); ?>
                    <?php echo $this->Form->input('parent_id', array('class' => 'form-control head_list')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('order_no', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('status', array('class' => 'form-control')); ?>
                </div>

                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>
<script>
    $(window).load(function () {
        var parent_id_has = $('#parent_id_has').val();
        var acc_head_type_id = $('#AccHeadListAccHeadTypeId').val();
        var has_parent = $('.has_parent').val();
        console.log(parent_id_has);
        get_parent_list(acc_head_type_id, has_parent, parent_id_has);
    });
    function get_parent_list(acc_head_type_id, has_parent, parent_id_has) {
        if (acc_head_type_id != 0 && has_parent != 0) {
            $.ajax({
                url: '<?php echo BASE_URL; ?>admin/AccHeadLists/get_parent_list',
                method: "POST",
                data: {acc_head_type_id: acc_head_type_id},
                success: function (result) {
                    result = $.parseJSON(result);
                    var options = '<option value="0">------ Please Select ------</option>'
                    for (var x in result) {
                        if (parent_id_has == result[x].AccHeadList.id) {
                            options += '<option value=' + '"' + result[x].AccHeadList.id + '" selected>' + result[x].AccHeadList.head_name + '</option>'
                        } else {
                            options += '<option value=' + '"' + result[x].AccHeadList.id + '">' + result[x].AccHeadList.head_name + '</option>'
                        }

                    }
                    $(".head_list").html(options);
                }
            });
        } else {
            var options = '<option value="0">------ Please Select ------</option>'
            $(".head_list").html(options);
        }
    }
    function parent_display(has_parent) {
        if (has_parent == 1) {
            $('.parent_id').show();
        } else {
            $('.parent_id').hide();
        }
    }
    $(document).ready(function () {
        var has_parent = $('.has_parent').val();
        var parent_id_has = $('#parent_id_has').val();
        parent_display(has_parent);
        $('#AccHeadListAccHeadTypeId').change(function () {
            var acc_head_type_id = $(this).val();
            parent_display(has_parent);
            get_parent_list(acc_head_type_id, has_parent, parent_id_has);
        });

        $('.has_parent').change(function () {
            var has_parent = $(this).val();
            var acc_head_type_id = $('#AccHeadListAccHeadTypeId').val();
            parent_display(has_parent);
            get_parent_list(acc_head_type_id, has_parent, parent_id_has);
        });
    });

</script>