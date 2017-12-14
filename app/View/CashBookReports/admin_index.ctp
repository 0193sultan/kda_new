<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Cash Book Report'); ?></h3>
            </div>

            <div class="box-body">
                <div class="search-box">
                    <?php
                        echo $this->Form->create('CashBookReport', array('role' => 'form', 'action'=>'index'));
                    ?>
                    <table class="search">
                        <tbody>
                            <tr>
                                <td colspan="2">
                                    <?php echo $this->Form->input('report_type_id', array('class' => 'form-control report_type', 'style' => 'width:400px', 'empty' => '---- Please Select ----', 'options' => array('1'=>'Daily','2'=>'Monthly'))); ?>
                                </td>
                            </tr>
                            <tr class="daily_report_visibility" style="display: none;">
                                <td colspan="2">
                                    <?php echo $this->Form->input('start_date', array('name'=>'start_date', 'class' => 'form-control datepicker start_date', 'style' => 'width:400px')); ?>
                                </td>
                            </tr>
                            <tr class="daily_report_visibility" style="display: none;">
                                <td colspan="2">
                                    <?php echo $this->Form->input('end_date', array('name'=>'end_date', 'class' => 'form-control datepicker end_date', 'style' => 'width:400px')); ?>
                                </td>
                            </tr>
                            <tr class="monthly_report_visibility" style="display: none;">
                                <td colspan="2">
                                    <?php echo $this->Form->input('fiscal_year_id', array('label'=>'Fiscal Year :', 'name'=>'fiscal_year_id', 'class' => 'form-control fiscal_year_id', 'style' => 'width:400px', 'empty' => '---- Please Select ----', 'options' => $fiscal_year_list)); ?>
                                </td>
                            </tr>
                            <tr class="monthly_report_visibility" style="display: none;">
                                <td colspan="2">
                                    <?php echo $this->Form->input('month_id', array('label'=>'Start Month :', 'name'=>'start_month_id', 'class' => 'form-control start_month_id', 'style' => 'width:400px', 'empty' => '---- Please Select ----', 'options' => $month_list)); ?>
                                </td>
                            </tr>
                            <tr class="monthly_report_visibility" style="display: none;">
                                <td colspan="2">
                                        <?php echo $this->Form->input('month_id', array('label'=>'End Month :', 'name'=>'end_month_id', 'class' => 'form-control end_month_id', 'style' => 'width:400px', 'empty' => '---- Please Select ----', 'options'=>$month_list)); ?>
                                </td>
                            </tr>
                            <tr align="center">
                                <td colspan="2">
                                    <button type="button" class="btn btn-large btn-primary search_btn" name="search-btn"><i class="fa fa-search"></i> Search</button>
                                    <a href="<?php echo BASE_URL;?>admin/cash_book_reports" class="btn btn-warning"><i class="fa fa-refresh"></i> Reset</a>
                                </td>                
                            </tr>
                        </tbody>
                    </table>    
                    <?php echo $this->Form->end(); ?>
                </div>
            </div>

            <div class="report_div">
                
            </div>

        </div>

        </div>
        
    </div>
</div>

<script>
    $(document).ready(function(){
        $('.search_btn').click(function(){
            var report_type = $('.report_type').val();
            var start_date = $('.start_date').val();
            var end_date = $('.end_date').val();
            var fiscal_year_id = $('.fiscal_year_id').val();
            var start_month_id = $('.start_month_id').val();
            var end_month_id = $('.end_month_id').val();
            if (report_type == 1) {
                if (report_type != '' && start_date != '' && end_date != '') {
                     $.ajax({
                              url: '<?php echo BASE_URL.'admin/CashBookReports/get_cash_book_reports' ?>',
                              'type': 'POST',
                              data: {report_type: report_type, start_date: start_date, end_date: end_date},
                              success: function(response){
                                 $('.report_div').html(response);
                              }
                           });
                } else {
                    alert('Invalid Request for Report!')
                }
            } else if(report_type == 2) {
                if (report_type != '' && fiscal_year_id != '' && start_month_id != '' && end_month_id != '') {
                     $.ajax({
                              url: '<?php echo BASE_URL.'admin/CashBookReports/get_cash_book_reports' ?>',
                              'type': 'POST',
                              data: {report_type: report_type, fiscal_year_id: fiscal_year_id, start_month_id: start_month_id, end_month_id: end_month_id},
                              success: function(response){
                                 $('.report_div').html(response);
                              }
                           });
                } else {
                    alert('Invalid Request for Report!')
                }
            }
        });
    });
</script>


<script>
    $(document).ready(function(){
        $('body').on('change', '.report_type', function(){
            $('.report_div').html('');
            $('.start_date').val('');
            $('.end_date').val('');
            $('.fiscal_year_id').val('');
            $('.start_month_id').val('');
            $('.end_month_id').val('');
            if ($(this).val()==1) {
                $('.daily_report_visibility').show();
                $('.monthly_report_visibility').hide();
            } else if ($(this).val()==2){
                $('.daily_report_visibility').hide();
                $('.monthly_report_visibility').show();
            } else {
                $('.daily_report_visibility').hide();
                $('.monthly_report_visibility').hide();
            }
        });
    });
</script>

