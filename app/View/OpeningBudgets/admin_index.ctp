<style>
    .submit_btn{
        display: none;
    }
</style>

<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Opening Budget'); ?></h3>
            </div>

            <div class="box-body">
                <?php
                    echo $this->Form->create('OpeningBudget', array('role' => 'form', 'action'=>'index'));
                ?>
                    <div class="search-box">
                        <table class="search">
                            <tbody>
                                <tr>
                                    <td>
                                        <?php echo $this->Form->input('fiscal_year_id', array('label'=>'Fiscal Year :', 'name'=>'fiscal_year_id', 'class' => 'form-control fiscal_year_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----', 'required')); ?>
                                    </td>
                                    <td>
                                        <?php echo $this->Form->input('budget_schedule_id', array('name'=>'budget_schedule_id', 'class' => 'form-control budget_schedule_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----')); ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <?php echo $this->Form->input('budget_type_id', array('name'=>'budget_type_id', 'class' => 'form-control budget_type_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----', 'required')); ?>
                                    </td>
                                    <td></td>
                                </tr>                               
                                <tr align="center">
                                    <td colspan="2">
                                        <button type="button" class="btn btn-large btn-primary search_btn" name="search-btn"><i class="fa fa-search"></i> Search</button>
                                        <a href="<?php echo BASE_URL;?>admin/opening_budgets" class="btn btn-warning"><i class="fa fa-refresh"></i> Reset</a>
                                    </td>                       
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="opening_budget_div">
                        
                    </div>
                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary submit_btn')); ?>
                <?php echo $this->Form->end(); ?>
            </div>

        </div>

        </div>
        
    </div>
</div>

<script>
    $(document).ready(function(){
        $('.search_btn').click(function(){
            var fiscal_year_id = $('.fiscal_year_id').val();
            var budget_schedule_id = $('.budget_schedule_id').val();
            var budget_type_id = $('.budget_type_id').val();
            if (fiscal_year_id != '' && budget_schedule_id != '' && budget_type_id != '') {
                 $.ajax({
                          url: '<?php echo BASE_URL.'admin/OpeningBudgets/get_budget_schedule_heads' ?>',
                          'type': 'POST',
                          data: {budget_schedule_id: budget_schedule_id},
                          success: function(response){
                             $('.opening_budget_div').html(response);
                             $('.submit_btn').show();
                          }
                       });
            } else {
                alert('Invalid Request for Report!')
            }
        });

        $('body').on('change', '.fiscal_year_id', function(){
            $('.opening_budget_div').html('');
            $('.submit_btn').hide();
        });
        $('body').on('change', '.budget_schedule_id', function(){
            $('.opening_budget_div').html('');
            $('.submit_btn').hide();
        });
        $('body').on('change', '.budget_type_id', function(){
            $('.opening_budget_div').html('');
            $('.submit_btn').hide();
        });

    });
</script>