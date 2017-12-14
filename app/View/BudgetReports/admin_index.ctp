<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Budget Report'); ?></h3>
            </div>

            <div class="box-body">
                <div class="search-box">
                    <?php
                        echo $this->Form->create('BudgetReport', array('role' => 'form', 'action'=>'index'));
                    ?>
                    <table class="search">
                        <tbody>
                            <tr>
                                <td colspan="2">
                                    <?php echo $this->Form->input('budget_type_id', array('class' => 'form-control budget_type_id', 'style' => 'width:400px', 'empty' => '---- Please Select ----')); ?>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control fiscal_year_id', 'style' => 'width:400px', 'empty' => '---- Please Select ----')); ?>
                                </td>
                            </tr>
                            <tr align="center">
                                <td colspan="2">
                                    <button type="button" class="btn btn-large btn-primary search_btn" name="search-btn"><i class="fa fa-search"></i> Search</button>
                                    <a href="<?php echo BASE_URL;?>admin/budget_reports" class="btn btn-warning"><i class="fa fa-refresh"></i> Reset</a>
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
            var budget_type_id = $('.budget_type_id').val();
            var fiscal_year_id = $('.fiscal_year_id').val();
            if (budget_type_id != '' && fiscal_year_id != '') {
                 $.ajax({
                          url: '<?php echo BASE_URL.'admin/BudgetReports/get_budget_report' ?>',
                          'type': 'POST',
                          data: {budget_type_id: budget_type_id, fiscal_year_id: fiscal_year_id},
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