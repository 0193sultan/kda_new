<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Security Deposite Return'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Security Deposite Return List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('SecurityDepositeReturn', array('role' => 'form')); ?>
                <div class="form-group" style="display: none" >
                    <?php echo $this->Form->input('work_order_id_1', array('id' => 'work_order_id_1', 'class' => 'form-control', 'label' => false)); ?>
                </div>
                <div class="form-group">
                    <?php
                    $project_list = array('--Select--') + $contructor_project_name;
                    echo $this->Form->input('contructor_project_name_id', array('label' => 'Project Name', 'class' => 'form-control', 'options' => $project_list, 'id' => 'contructor_project_name'));
                    ?>
                </div>
                <div class="form-group">
                    <?php
                    $contructor_list = array('--Select--') + $contructor_name;
                    echo $this->Form->input('contructor_name_id', array('label' => 'Contructor Name', 'class' => 'form-control', 'options' => $contructor_list, 'id' => 'contructor_name'));
                    ?>
                </div>
                <div class="form-group">
                    <label>Work order No:</label>
                    <select id="work_order_no_1" name="work_order_no_1" class="form-control">
                        <option>please select</option>
                    </select>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('security_return_amount', array('class' => 'form-control show', 'class' => 'form-control')); ?>
                    <span class="text-danger" id="erros"></span>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('voucher_no', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('payment_date', array('type' => 'text', 'class' => 'form-control datepicker', 'required' => true)); ?>
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

<script type="text/javascript">
    var base_url = "<?php echo BASE_URL; ?>";
    $(document).ready(function () {
        $('#contructor_name').change(function () {
            var contructor_project_name_id = $("#contructor_project_name option:selected").val();
            var contructor_name_id = $("#contructor_name option:selected").val();
            $.ajax({
                url: base_url + "admin/ContructorAdvancePayments/get_call",
                method: "POST",
                data: {contructor_project_name_id: contructor_project_name_id, contructor_name_id: contructor_name_id},
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    for (i = 0; i < data.length; i++) {
                        //console.log(data[i]['WorkOrder']['work_order_no']);
                        $("#work_order_no_1").append('<option value='+data[i]['WorkOrder']['id']+'>' + data[i]['WorkOrder']['work_order_no'] + '</option>');
                    }
                }
            });
        });

    });


    $(document).ready(function () {
        $('#work_order_no_1').change(function () {
            var work_order_id = $(this).val();
           console.log(work_order_id);
            $.ajax({
                url: base_url + "admin/ContructorAdvancePayments/get_workorder_no",
                method: "POST",
                data: {work_order_id: work_order_id},
                dataType: "json",
                success: function (data) {
                    console.log(data[0]['WorkOrder']['work_order_no']);
                   // console.log(data[0]['WorkOrder']['id']);
                    $('#work_order_id_1').val(data[0]['WorkOrder']['work_order_no']);
                }
            });
        });

    });

</script>
<script type="text/javascript">
    var base_url = "<?php echo BASE_URL; ?>";
    $(document).ready(function () {
        $('.show').keyup(function () {
            var security_input = $(".show").val();
            var work_order_id = $("#work_order_id").val();
            $.ajax({
                url: base_url + "SecurityDepositeReturns/check_amount",
                method: "POST",
                data: {security_input: security_input, work_order_id: work_order_id},
                dataType: "json",
                success: function (data) {
                    var total_security_money_deducted = data[1]['ContructorBillPayment']['total_security_money_deducted'];
                    if (data[0].length !== 0) {
                        var total_security_money_paid = data[0]['SecurityDepositeReturn']['total_security_money_paid'];
                    }
                    var remaining_security_money = total_security_money_deducted - total_security_money_paid;
                    if (security_input > remaining_security_money) {
                        $("#erros").html("You have " + remaining_security_money + " remaining security return deposite");
                    } else {
                        $("#erros").html(" ");
                    }

                }
            });
        });
    });





</script>
<script>
    $(document).ready(function () {
        $('#display-none').hide();
    });
</script>