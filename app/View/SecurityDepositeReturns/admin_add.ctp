<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Security Deposit Return'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Security Deposit Return List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('SecurityDepositeReturn', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('contructor_project_name_id', array('label' => 'Project Name :', 'class' => 'form-control contructor_project_name', 'empty'=>'---- Please Select ----')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('contructor_name_id', array('class' => 'form-control contructor_name', 'empty'=>'---- Please Select ----')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('work_order_id', array('label' => 'Work Order No :', 'class' => 'form-control work_order_id', 'empty'=>'---- Please Select ----', 'required')); ?>
                    <?php echo $this->Form->input('work_order_no', array('type'=>'hidden', 'class'=>'work_order_no')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('security_return_amount', array('class' => 'form-control show', 'class' => 'form-control', 'required')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('voucher_no', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control', 'empty'=>'---- Please Select ----', 'required')); ?>
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


<script>
    $(document).ready(function(){
        $('body').on('change', '.contructor_project_name', function(){
            $('.work_order_id').html('<option value="">---- Please Select ----</option>');
            var contructor_project_name_id = $(this).val();
             $.ajax({
                      url: '<?php echo BASE_URL.'admin/SecurityDepositeReturns/get_contructor_name_list' ?>',
                      'type': 'POST',
                      data: {contructor_project_name_id: contructor_project_name_id},
                      success: function(response){
                         var obj = jQuery.parseJSON(response);
                         $('.contructor_name option').remove();
                         for (var i = 0; i < obj.length; i++) {
                            optionList = '<option value="'+obj[i].WorkOrder.id+'">'+obj[i].ContructorName.name+'</option>';
                            $('.contructor_name').append(optionList);
                         }
                      }
                   });
        });

        $('body').on('change', '.contructor_name', function(){
            var contructor_project_name_id = $('.contructor_project_name').val();
            var contructor_name_id = $(this).val();
             $.ajax({
                      url: '<?php echo BASE_URL.'admin/SecurityDepositeReturns/get_work_order_no_list' ?>',
                      'type': 'POST',
                      data: {contructor_project_name_id: contructor_project_name_id,contructor_name_id: contructor_name_id},
                      success: function(response){
                         var obj = jQuery.parseJSON(response);
                         $('.work_order_id option').remove();
                         for (var i = 0; i < obj.length; i++) {
                            optionList = '<option value="'+obj[i].WorkOrder.id+'">'+obj[i].WorkOrder.name+'</option>';
                            $('.work_order_id').append(optionList);
                         }
                      }
                   });
        });

        $('body').on('change', '.work_order_id', function(){
            var work_order_no = $(this).find(':selected').text();
            $('.work_order_no').val(work_order_no);
        });
    });
</script>
