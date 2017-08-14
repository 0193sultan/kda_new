<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Edit Tax Setting'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Tax Setting List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('TaxSetting', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('id', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('tax_applied_year', array('type' => 'text', 'class' => 'form-control tax_applied_year')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('tax_name', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('tax_executable_amount', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('applied_place_for', array('class' => 'form-control', 'empty' => '---- Select ----', 'options' => $applied_place_for)); ?>
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
                    <?php echo $this->Form->input('add_sub', array('class' => 'form-control', 'empty' => '---- Select ----', 'options' => $add_sub)); ?>
                </div>

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
        $('.tax_applied_year').datepicker({
            startDate: '<?php echo $startDate; ?>',
            endDate: '<?php echo $endDate; ?>',
            format: "dd-mm-yyyy",
            autoclose: true,
            todayHighlight: true

        });
    });
</script>