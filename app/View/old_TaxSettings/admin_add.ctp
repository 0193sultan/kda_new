<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Add Tax Setting'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Tax Setting List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('TaxSetting', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('tax_applied_year', array('type' => 'text', 'class' => 'form-control datepicker_range')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('tax_name', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('tax_executable_amount', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php
                    echo $this->Form->input('applied_place_for', array('class' => 'form-control applied_place_for', 'empty' => '---- Select ----', 'options' => $applied_place_for));
                    ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('applied_tax_amount', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('monthly_recovery', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('tax_adjustment_for_last_month', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php
                    echo $this->Form->input('add_sub', array('class' => 'form-control add_sub', 'empty' => '---- Select ----', 'options' => $add_sub));
                    ?>
                </div>
                <input type="hidden" name="data[TaxSetting][applied_place_for]" >
                <input type="hidden" name="data[TaxSetting][add_sub]" >
                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>
<?php
$startDate = date('d-m-Y', strtotime(''));
$endDate = date('d-m-Y');
?>
<script>
    $(document).ready(function () {
        $('.datepicker_range').datepicker({
            startDate: '<?php echo $startDate; ?>',
            endDate: '<?php echo $endDate; ?>',
            format: "dd-mm-yyyy",
            autoclose: true,
            todayHighlight: true

        });
        $(".add_sub").change(function () {
            var sub_add_val = $(this).val();
            if ($(this).val() != '') {
                var sub_add_txt = $(".add_sub option[value=" + sub_add_val + "]").text();
                $("input[name='data[TaxSetting][add_sub]'").val(sub_add_txt);
                var applied_place_for_txt = $(".applied_place_for option[value=" + sub_add_val + "]").text();
                $("input[name='data[TaxSetting][applied_place_for]'").val(applied_place_for_txt);
                // console.log(sub_add_txt);
            }
        });
    });
</script>