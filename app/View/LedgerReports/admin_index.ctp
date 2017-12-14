<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Ledger Report'); ?></h3>
            </div>

            <div class="box-body">
                <div class="search-box">
                    <?php
                        echo $this->Form->create('LedgerReport', array('role' => 'form', 'action'=>'index'));
                    ?>
                    <table class="search">
                        <tbody>
                            <tr>
                                <td>
                                    <?php echo $this->Form->input('fiscal_year_id', array('label'=>'Fiscal Year :', 'name'=>'fiscal_year_id', 'class' => 'form-control fiscal_year_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----', 'options' => $fiscal_year_list, 'required')); ?>
                                </td>
                                <td>
                                    <?php echo $this->Form->input('month_id', array('label'=>'Month :', 'name'=>'month_id', 'class' => 'form-control month_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----', 'options' => $month_list, 'required')); ?>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <?php echo $this->Form->input('head_type_id', array('name'=>'head_type_id', 'class' => 'form-control head_type_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----', 'options' => $head_type_list, 'required')); ?>
                                </td>
                                <td>
                                    <?php echo $this->Form->input('main_head_id', array('label'=>'Head Name :', 'name'=>'main_head_id', 'class' => 'form-control main_head_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----', 'required')); ?>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <?php echo $this->Form->input('report_type_id', array('name'=>'report_type_id', 'class' => 'form-control report_type_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----', 'options' => array('1'=>'Debit','2'=>'Credit'), 'required')); ?>
                                </td>
                                <td>
                                    <?php echo $this->Form->input('sub_head_id', array('label'=>'Sub Head Name :', 'name'=>'sub_head_id', 'class' => 'form-control sub_head_id', 'style' => 'width:200px', 'empty' => 'All')); ?>
                                </td>
                            </tr>                               
                            <tr align="center">
                                <td colspan="2">
                                    <button type="button" class="btn btn-large btn-primary search_btn" name="search-btn"><i class="fa fa-search"></i> Search</button>
                                    <a href="<?php echo BASE_URL;?>admin/ledger_reports" class="btn btn-warning"><i class="fa fa-refresh"></i> Reset</a>
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
            var month_id = $('.month_id').val();
            var head_type_id = $('.head_type_id').val();
            var main_head_id = $('.main_head_id').val();
            var sub_head_id = $('.sub_head_id').val();
            var report_type_id = $('.report_type_id').val();
            if (fiscal_year_id != '' && month_id != '' && head_type_id != '' && main_head_id != '' && report_type_id != '') {
                 $.ajax({
                          url: '<?php echo BASE_URL.'admin/LedgerReports/get_ledger_reports' ?>',
                          'type': 'POST',
                          data: {fiscal_year_id: fiscal_year_id, month_id: month_id, head_type_id: head_type_id, main_head_id: main_head_id, sub_head_id: sub_head_id, report_type_id: report_type_id},
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


<script>
    $(document).ready(function(){
        function get_main_head(head_type_id) {
            $('.sub_head_id').html('<option value="">All</option>');
            if (head_type_id != '') {
                 $.ajax({
                          url: '<?php echo BASE_URL.'admin/LedgerReports/get_main_head' ?>',
                          'type': 'POST',
                          data: {head_type_id: head_type_id},
                          success: function(response){
                             var obj = jQuery.parseJSON(response);
                             $('.main_head_id option').remove();
                             for (var i = 0; i < obj.length; i++) {
                                optionList = '<option value="'+obj[i].AccHeadList.id+'">'+obj[i].AccHeadList.name+'</option>';
                                $('.main_head_id').append(optionList);
                             }
                          }
                       });
            } else {
                $('.main_head_id').html('<option value="">---- Please Select ----</option>');
            }
        }

        function get_sub_head(head_type_id,main_head_id) {
            if (head_type_id != '' && main_head_id != '') {
                 $.ajax({
                          url: '<?php echo BASE_URL.'admin/LedgerReports/get_sub_head' ?>',
                          'type': 'POST',
                          data: {head_type_id: head_type_id,main_head_id: main_head_id},
                          success: function(response){
                             var obj = jQuery.parseJSON(response);
                             $('.sub_head_id option').remove();
                             for (var i = 0; i < obj.length; i++) {
                                optionList = '<option value="'+obj[i].AccHeadList.id+'">'+obj[i].AccHeadList.name+'</option>';
                                $('.sub_head_id').append(optionList);
                             }
                          }
                       });
            } else {
                $('.main_head_id').html('<option value="">---- Please Select ----</option>');
                $('.sub_head_id').html('<option value="">All</option>');
            }
        }

        $('.head_type_id').change(function(){
            var head_type_id = $(this).val();
            get_main_head(head_type_id);
        });

        $('.main_head_id').change(function(){
            var head_type_id = $('.head_type_id').val();
            var main_head_id = $(this).val();
            get_sub_head(head_type_id,main_head_id);
        });
    });
</script>