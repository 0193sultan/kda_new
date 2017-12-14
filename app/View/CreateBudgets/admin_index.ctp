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
                    echo $this->Form->create('CreateBudget', array('role' => 'form', 'action'=>'index'));
                ?>
                    <div class="search-box">
                        <table class="search">
                            <tbody>
                                <tr>
                                    <td>
                                        <?php echo $this->Form->input('budget_category_id', array('name'=>'budget_category_id', 'class' => 'form-control budget_category_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----', 'required')); ?>
                                    </td>
                                    <td>
                                        <?php echo $this->Form->input('budget_schedule_id', array('name'=>'budget_schedule_id', 'class' => 'form-control budget_schedule_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----')); ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <?php echo $this->Form->input('fiscal_year_id', array('label'=>'Fiscal Year :', 'name'=>'fiscal_year_id', 'class' => 'form-control fiscal_year_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----', 'required')); ?>
                                    </td>
                                    <td>
                                        <?php echo $this->Form->input('budget_type_id', array('name'=>'budget_type_id', 'class' => 'form-control budget_type_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----', 'required')); ?>
                                    </td>
                                </tr>                               
                                <tr align="center">
                                    <td colspan="2">
                                        <button type="button" class="btn btn-large btn-primary search_btn" name="search-btn"><i class="fa fa-search"></i> Search</button>
                                        <a href="<?php echo BASE_URL;?>admin/create_budgets" class="btn btn-warning"><i class="fa fa-refresh"></i> Reset</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="create_budget_div">
                        
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
            var budget_category_id = $('.budget_category_id').val();
            if (budget_category_id == 1) {
                var create_budget_html = 'get_proposed_budget';
            } else if (budget_category_id == 2) {
                var create_budget_html = 'get_approved_budget';
            } else if (budget_category_id == 3) {
                var create_budget_html = 'get_propose_revised_budget';
            } else if (budget_category_id == 4) {
                var create_budget_html = 'get_actual_six_month_budget';
            } else if (budget_category_id == 5) {
                var create_budget_html = 'get_actual_budget';
            }
            if (fiscal_year_id != '' && budget_schedule_id != '' && budget_type_id != '' && budget_category_id != '') {
                 $.ajax({
                          url: '<?php echo BASE_URL ?>admin/CreateBudgets/'+create_budget_html,
                          'type': 'POST',
                          data: {fiscal_year_id: fiscal_year_id,budget_schedule_id: budget_schedule_id,budget_type_id: budget_type_id},
                          success: function(response){
                             $('.create_budget_div').html(response);
                             $('.submit_btn').show();
                          }
                       });
            } else {
                alert('Invalid Request for Report!')
            }
        });

        $('body').on('change', '.fiscal_year_id', function(){
            $('.create_budget_div').html('');
            $('.submit_btn').hide();
        });
        $('body').on('change', '.budget_schedule_id', function(){
            $('.create_budget_div').html('');
            $('.submit_btn').hide();
        });
        $('body').on('change', '.budget_type_id', function(){
            $('.create_budget_div').html('');
            $('.submit_btn').hide();
        });
        $('body').on('change', '.budget_category_id', function(){
            $('.create_budget_div').html('');
            $('.submit_btn').hide();
        });

    });
</script>