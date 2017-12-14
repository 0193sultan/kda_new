<style>
    #display_acc_head_list{
        display: none;
    }
</style>
<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Balance Sheets'); ?></h3>
            </div>
            <br><br>
            <div class="box-body">
                <?php echo $this->Form->create('BalanceSheets', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('fiscal_year_id', array('id' => 'fiscal_year_id', 'class' => 'form-control', 'empty' => '---- Please Select ----')); ?>
                </div>
                <div style="margin-left:22%">
                    <button type="button" class="btn btn-large btn-primary">Search</button>
                </div>
                <br>
                <div id="show_data"></div>
                <br>
                <?php //echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
              //  $.cookie("test", 1);
        //getCookie('test');
       // console.log(test);
        $("body").on("click", "button", function () {
            var fiscal_year_id = $('#fiscal_year_id').val();
            var month_id = $('#month_id').val();
            console.log(fiscal_year_id);
            console.log(month_id);
            if (fiscal_year_id != '') {
                $.ajax({
                    type: "POST",
                    url: '<?php echo BASE_URL ?>admin/BalanceSheets/balance_sheet_report',
                    data: {fiscal_year_id: fiscal_year_id},
                    dataType: 'html',
                    success: function (response) {
                        $('#show_data').html(response);
                        console.log(response);
                        //catch_content = response;
                    }
                });
            }
        });
        $("body").on("click", ".datepicker", function () {
            $(this).datepicker();
            $(this).datepicker("show");
        });
    });
</script>