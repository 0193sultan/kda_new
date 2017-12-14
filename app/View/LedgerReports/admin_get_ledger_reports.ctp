            <!-- Report Start -->
<?php if (!empty($ledger_report)): ?>
    
        <div class="box box-primary"><br>
            <button class="pull-right btn btn-primary" id="print_btn"><i class="glyphicon glyphicon-print"></i> Print</button>
    <div id="content" style="width:90%;height:100%;margin-left:5%;margin-right:5%;">
        <!-- <div style="text-align:right;width:100%;">Page No :1 of 2</div> -->
        
        <div style="float: left; height: 55px; width: 35px;"><?php //echo $this->Html->image(''); ?></div>
        <div style="width:100%;text-align:center;">
            <div style="font-size:20px;">খুলনা উন্নয়ন কর্তৃপক্ষ</div>
            <div style="font-size:14px;"><strong>Ledger হিসাব</strong></div>
            <div style="font-size:13px;"><?php echo $fiscal_year_list[$fiscal_year_id]; ?>&nbsp;&nbsp;অর্থ বছরের&nbsp;&nbsp;<?php echo $month_list[$month_id]; ?>&nbsp;&nbsp;মাসের&nbsp;&nbsp;হিসাব</div>
        </div>    
        <br>

        
        <table class="print-table table table-bordered table-responsive" style="width:100%;" cellpadding="0px" cellspacing="0">
            <thead>
                <tr>
                    <th colspan="4" style="text-align: center;">প্রধান খাত : <?= $all_head_list[$main_head_id]; ?></th>
                </tr>

                <tr>
                    <th style="width: 20%">Date</th>
                    <th style="width: 40%">খাতের নাম</th>
                    <th style="width: 10%">Voucher No</th>
                    <th style="width: 30%"><?= $report_type_id==1?'Debit':'Credit'; ?></th>
                </tr>
            </thead>

            <tbody>
                <?php
                    if (!empty($ledger_report)) {
                ?>
                    <?php foreach ($ledger_report as $key => $value): ?>
                        <tr>
                          <td style="width: 20%">
                              <?php echo date('d-m-Y', strtotime($value['DailyTransaction']['transaction_date'])); ?>
                          </td>
                          <td style="width: 40%">
                              <?php echo $value['AccHeadList']['head_name']; ?>
                          </td>
                          <td style="width: 10%">
                              <?php echo $value['DailyTransaction']['voucher_no']; ?>
                          </td>
                          <td style="width: 30%" class="amount">
                              <?php echo $value['DailyTransaction']['transaction_amount']; ?>
                          </td>  
                        </tr>
                    <?php endforeach ?>
                <?php
                    }
                ?>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="3"><strong class="pull-right">Total :</strong></td>
                <td class="total_amount">500</td>
              </tr>
            </tfoot>

        </table>
               
    </div>


<?php endif ?>
            <!-- Report End -->


<script>
  $(document).ready(function(){
    var total_amount = 0;
    $('.amount').each(function(){
      if ($(this).text() != '') {
        total_amount += parseFloat($(this).text());
      }
      $('.total_amount').text(total_amount.toFixed(2));
    });
  });
</script>


<script>
    $('#print_btn').click(function(){
        $('#content').print();
    });
</script>