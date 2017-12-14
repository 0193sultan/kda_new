            <!-- Report Start -->
<?php if (!empty($receipt_info) || !empty($payment_info) || !empty($opening_balance) ): ?>
    
        <div class="box box-primary"><br>
            <button class="btn btn-primary pull-right" id="print_btn"><i class="glyphicon glyphicon-print"></i> Print</button>
    <div id="content" style="width:90%;height:100%;margin-left:5%;margin-right:5%;">
        <!-- <div style="text-align:right;width:100%;">Page No :1 of 2</div> -->
        
        <div style="float: left; height: 55px; width: 35px;"><?php //echo $this->Html->image(''); ?></div>
        <div style="width:100%;text-align:center;">
            <div style="font-size:20px;">খুলনা উন্নয়ন কর্তৃপক্ষ</div>
            <div style="font-size:14px;"><strong>প্রাপ্তি প্রদান হিসাব</strong></div>
            <div style="font-size:13px;"><?php echo $fiscal_year_list[$fiscal_year_id]; ?>&nbsp;&nbsp;অর্থ বছরের&nbsp;&nbsp;<?php echo $month_list[$start_month_id]; ?>&nbsp;&nbsp;থেকে&nbsp;&nbsp;<?php echo $month_list[$end_month_id]; ?>&nbsp;&nbsp;&nbsp;পর্যন্ত</div>
        </div>    
        <br>

        <table class="print-table table table-bordered table-responsive" style="width:100%;" cellpadding="0px" cellspacing="0">
        <tr>
        <td colspan="2" style="vertical-align:top;padding: 0px;">

        
        <table class="print-table table table-bordered table-responsive" style="width:100%;" cellpadding="0px" cellspacing="0">
            <thead>
                <tr>
                    <th colspan="2">প্রাপ্তি</th>
                </tr>

                <tr>
                    <th style="width: 60%">খাতের নাম</th>
                    <th style="width: 40%">Bank Deposit (টাকা)</th>
                </tr>
                <tr>
                    <td style="width: 60%">Opening Balance</td>
                    <td style="width: 40%" class="receipt_tk"><?= $opening_balance; ?></td>
                </tr>
            </thead>

            <tbody>
                <?php
                    if (!empty($receipt_info)) {
                ?>
                    <?php foreach ($receipt_info as $key => $value): ?>
                        <tr>
                          <td style="width: 60%">
                              <?php echo $all_head_list[$value['DailyTransaction']['parent_id']]; ?>
                          </td>
                          <td class="receipt_tk" style="width: 40%">
                              <?php echo $value[0]['total']; ?>
                          </td>  
                        </tr>
                    <?php endforeach ?>
                <?php
                    }
                ?>
            </tbody>

        </table>

        </td>
        <td colspan="2" style="vertical-align:top;padding: 0px;">


        <table class="print-table table table-bordered table-responsive" style="width:100%;" cellpadding="0px" cellspacing="0">
            <thead>
                <tr>
                    <th colspan="2">প্রদান</th>
                </tr>
                <tr>
                    <th style="width: 60%">খাতের নাম</th>
                    <th style="width: 40%">Bank Deposit (টাকা)</th>
                </tr>
            </thead>

            <tbody>
                <?php
                    if (!empty($payment_info)) {
                ?>
                    <?php foreach ($payment_info as $key => $value): ?>
                        <tr>
                          <td style="width: 60%;">
                              <?php echo $all_head_list[$value['DailyTransaction']['parent_id']]; ?>
                          </td>
                          <td class="payment_tk" style="width:40%">
                              <?php echo $value[0]['total']; ?>
                          </td>  
                        </tr>
                    <?php endforeach ?>
                <?php
                    }
                ?>
            </tbody>

        </table>

        </td>
        </tr>

        <tr>
            <td style="width:30%"></td>
            <td style="width:20%"></td>
            <td style="width:30%">Total Payment</td>
            <td class="payment_tk_total" style="width:20%"></td>
        </tr>
        <tr>
            <td style="width:30%"></td>
            <td style="width:20%"></td>
            <td style="width:30%">Closing Balance</td>
            <td class="closing_balance" style="width:20%"></td>
        </tr>
        <tr>
            <td style="width:30%">Total Receipt</td>
            <td class="receipt_tk_total" style="width:20%"></td>
            <td style="width:30%">Total Receipt</td>
            <td class="receipt_tk_total" style="width:20%"></td>
        </tr>

        </table>
               
    </div>


<?php endif ?>
            <!-- Report End -->


<script>
    $(document).ready(function(){

        var receipt_tk_total = 0;
        $('.receipt_tk').each(function(){
            receipt_tk_total += parseFloat($(this).text());
        });
        $('.receipt_tk_total').text(receipt_tk_total.toFixed(2));

        var payment_tk_total = 0;
        $('.payment_tk').each(function(){
            payment_tk_total += parseFloat($(this).text());
        });
        $('.payment_tk_total').text(payment_tk_total.toFixed(2));

        $('.closing_balance').text(parseFloat(receipt_tk_total-payment_tk_total).toFixed(2));
    });
</script>

<script>
    $('#print_btn').click(function(){
        $('#content').print();
    });
</script>