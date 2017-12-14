<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Year Close for Gps Subscription'); ?></h3>
            </div>
            <br><br>
            <div class="box-body">
                <?php echo $this->Form->create('YearCloseGpsSubscriptions', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('fiscal_year_id', array('id' => 'fiscal_year_id', 'class' => 'form-control', 'empty' => '---- Please Select ----')); ?>
                </div>
                <?php echo $this->Form->submit('Close Year', array('class' => 'btn btn-sm btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>
