<style>
    #display_acc_head_list{
        display: none;
    }
</style>
<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Back Trace'); ?></h3>
            </div>
            <br><br>
            <div class="box-body">
                <?php echo $this->Form->create('BackTraces', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('fiscal_year_id', array('name' => 'data[BackTraces][fiscal_year_id]','id' => 'fiscal_year_id', 'class' => 'form-control', 'empty' => '---- Please Select ----','label'=>'Back Tracing Year :')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('month_id', array('name' => 'data[BackTraces][month_id]','id' => 'month_id', 'class' => 'form-control', 'empty' => '---- Please Select ----','label'=>'Back Tracing Month :')); ?>
                </div>
                <br>
                <div id="show_data"></div>
                <br>
                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("body").on("click", "button", function () {
    });
</script>