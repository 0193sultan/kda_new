<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Receipt Payment Report'); ?></h3>
            </div>

            <div class="box-body">
                <div class="search-box">
                    <?php
                        echo $this->Form->create('ReceiptPaymentReport', array('role' => 'form', 'action'=>'index'));
                    ?>
                    <table class="search">
                        <tbody>
                            <tr>
                                <td>
                                    <?php echo $this->Form->input('fiscal_year_id', array('label'=>'Fiscal Year :', 'name'=>'fiscal_year_id', 'class' => 'form-control fiscal_year_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----', 'options' => $fiscal_year_list, 'required')); ?>
                                </td>
                                <td>
                                    <?php echo $this->Form->input('month_id', array('label'=>'Start Month :', 'name'=>'start_month_id', 'class' => 'form-control start_month_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----', 'options' => $month_list, 'required')); ?>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <?php echo $this->Form->input('month_id', array('label'=>'End Month :', 'name'=>'end_month_id', 'class' => 'form-control end_month_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----', 'options'=>$month_list, 'required')); ?>
                                </td>
                            </tr>                               
                            <tr align="center">
                                <td colspan="2">
                                    <button type="button" class="btn btn-large btn-primary search_btn" name="search-btn"><i class="fa fa-search"></i> Search</button>
                                    <a href="<?php echo BASE_URL;?>admin/receipt_payment_reports" class="btn btn-warning"><i class="fa fa-refresh"></i> Reset</a>
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
            var fiscal_year_id = $('.fiscal_year_id').val();
            var start_month_id = $('.start_month_id').val();
            var end_month_id = $('.end_month_id').val();
            if (fiscal_year_id != '' && start_month_id != '' && end_month_id != '') {
                 $.ajax({
                          url: '<?php echo BASE_URL.'admin/ReceiptPaymentReports/get_receipt_payment_reports' ?>',
                          'type': 'POST',
                          data: {fiscal_year_id: fiscal_year_id, start_month_id: start_month_id, end_month_id: end_month_id},
                          success: function(response){
                             $('.report_div').html(response);
                          }
                       });
            } else {
                alert('Invalid Request for Report!')
            }
        });
    });
</script>