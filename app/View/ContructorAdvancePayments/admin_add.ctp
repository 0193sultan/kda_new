
<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Contructor Advance Payment'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Contructor Advance Payment List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('ContructorAdvancePayment', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php
                    echo $this->Form->input('contructor_project_name_id', array('label' => 'Project Name', 'id' => 'contructor_project_name_id', 'class' => 'form-control', 'empty' => array('' => '------ Please Select -------')));
                    ?>
                </div>
                <div class="form-group">
                    <?php
                    echo $this->Form->input('contructor_name_id', array('label' => 'Contructor Name', 'id' => 'contructor_name_id', 'class' => 'form-control', 'empty' => array('' => '------ Please Select -------')));
                    ?>
                </div>

                <div class="form-group" id="display-none">
                    <?php echo $this->Form->input('work_order_id', array('id' => 'work_order_id', 'class' => 'form-control', 'label' => 'Work Order No')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('advance_amount', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('voucher_no', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control', 'empty' => array('' => '------ Please Select ------'))); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('payment_date', array('type' => 'text', 'class' => 'form-control datepicker')); ?>
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
        function get_workorder_no(contructor_project_name_id, contructor_name_id) {
            if (contructor_project_name_id != '' && contructor_name_id != '') {
                $.ajax({
                    url: '<?php echo BASE_URL ?>admin/ContructorAdvancePayments/get_workorder_no',
                    type: 'POST',
                    data: {contructor_project_name_id: contructor_project_name_id, contructor_name_id: contructor_name_id},
                    success: function (result) {
                        result = $.parseJSON(result);
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
        $("body").on("change", "#contructor_project_name_id", function () {
            var contructor_project_name_id = $(this).val();
            var contructor_name_id = $('#contructor_name_id').val();
            get_workorder_no(contructor_project_name_id, contructor_name_id);
            // console.log(contructor_project_name_id);
        });
        $("body").on("change", "#contructor_name_id", function () {
            var contructor_project_name_id = $('#contructor_project_name_id').val();
            var contructor_name_id = $(this).val();
            get_workorder_no(contructor_project_name_id, contructor_name_id);
            //console.log(contructor_project_name_id);
        });
    });
</script>