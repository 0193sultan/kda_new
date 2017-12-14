            <!-- Report Start -->
<?php if ($report_type == 1 || $report_type == 2): ?>
    
        <div class="box box-primary"><br>
            
            <button class="pull-right btn btn-primary" id="print_btn"><i class="glyphicon glyphicon-print"></i> Print</button>
    <div id="content" style="width:90%;height:100%;margin-left:5%;margin-right:5%;">
        <!-- <div style="text-align:right;width:100%;">Page No :1 of 2</div> -->
        
        <div style="float: left; height: 55px; width: 35px;"><?php //echo $this->Html->image(''); ?></div>
        <div style="width:100%;text-align:center;">
            <div style="font-size:20px;">খুলনা উন্নয়ন কর্তৃপক্ষ</div>
            <div style="font-size:14px;"><strong>ক্যাশ-বুক হিসাব</strong></div>
            <?php
                if ($report_type == 1) {
                    ?>
                    <div style="font-size:13px;"><?php echo date('d-m-Y', strtotime($start_date)); ?>&nbsp;&nbsp;তারিখ থেকে&nbsp;&nbsp;<?php echo date('d-m-Y', strtotime($end_date)); ?>&nbsp;&nbsp;তারিখ পর্যন্ত</div>
                    <?php
                } else if ($report_type == 2) {
                    ?>
                    <div style="font-size:13px;"><?php echo $fiscal_year_list[$fiscal_year_id]; ?>&nbsp;&nbsp;অর্থ বছরের&nbsp;&nbsp;<?php echo $month_list[$start_month_id]; ?>&nbsp;&nbsp;থেকে&nbsp;&nbsp;<?php echo $month_list[$end_month_id]; ?>&nbsp;&nbsp;&nbsp;পর্যন্ত</div>
                    <?php
                }
            ?>
        </div>    
        <br>

    <table class="print-table table table-bordered table-responsive" style="width:100%;float: left;" cellpadding="2px" cellspacing="0">
    <tr>
    <td colspan="<?= count($bank_account_info)+2; ?>" style="vertical-align:top;padding: 0px;overflow: hidden;">
    <?php
        $bank_count = count($bank_account_info);
        $bank_wise_occupied_percentage = 37/$bank_count;
    ?>
        <table class="print-table table table-bordered table-responsive" style="width:100%;float: left;" cellpadding="2px" cellspacing="0">
            <thead>
                <tr>
                    <th colspan="<?= count($bank_account_info)+2; ?>">ডেবিট (প্রাপ্তি)</th>
                </tr>

                <tr>
                    <th rowspan="2">খাতের নাম</th>
                    <th rowspan="2">ক্যাশ</th>
                    <?php foreach ($bank_account_info as $key => $value): ?>
                        <th><?= $value['BankAccount']['account_no']; ?><input type="hidden" class="debit_bank" value="<?= $value['BankAccount']['id']; ?>"></th>
                    <?php endforeach ?>
                </tr>
                <tr>
                    <?php foreach ($bank_account_info as $key => $value): ?>
                        <th><?= $value['BankInfo']['name']; ?></th>
                    <?php endforeach ?>
                </tr>
                <tr>
                    <td style="width: 16%;">Opening Balance</td>
                    <td style="width: 10%;"></td>
                    <?php foreach ($bank_account_info as $key => $value): ?>
                        <td class="debit_bank_<?= $value['BankAccount']['id']; ?>" style="width: <?= 74/$bank_count; ?>%"><?= !empty($opening_balance[$value['BankAccount']['id']])?$opening_balance[$value['BankAccount']['id']]:''; ?></td>
                    <?php endforeach ?>
                </tr>
            </thead>

            <tbody>
                <?php
                    if (!empty($debit_balance_head_wise)) {
                ?>
                    <?php foreach ($debit_balance_head_wise as $key => $value): ?>
                        <tr>
                            <td style="width: 16%"><?= $all_head_list[$key]; ?></td>
                            <td style="width: 10%"></td>
                            <?php
                                foreach ($bank_account_info as $key2 => $value2) {
                                    ?>
                                        <td class="debit_bank_<?= $value2['BankAccount']['id']; ?>" style="width: <?= 74/$bank_count; ?>%"><?= !empty($value[$value2['BankAccount']['id']])?$value[$value2['BankAccount']['id']]:''; ?></td>
                                    <?php
                                }
                            ?>
                        </tr>
                    <?php endforeach ?>
                <?php
                    }
                ?>
            </tbody>
        </table>

    </td>

    <td colspan="<?= count($bank_account_info)+2; ?>" style="vertical-align:top;padding: 0px;overflow: hidden;">
        <table class="print-table table table-bordered table-responsive" style="width:100%;float: left;" cellpadding="2px" cellspacing="0">
            <thead>
                <tr>
                    <th colspan="<?= count($bank_account_info)+2; ?>">ক্রেডিট (প্রদান)</th>
                </tr>
                <tr>
                    <th rowspan="2">খাতের নাম</th>
                    <th rowspan="2">ক্যাশ</th>
                    <?php foreach ($bank_account_info as $key => $value): ?>
                        <th><?= $value['BankAccount']['account_no']; ?></th>
                    <?php endforeach ?>
                </tr>
                <tr>
                    <?php foreach ($bank_account_info as $key => $value): ?>
                        <th><?= $value['BankInfo']['name']; ?></th>
                    <?php endforeach ?>
                </tr>
            </thead>

            <tbody>
                <?php
                    if (!empty($credit_balance_head_wise)) {
                ?>
                    <?php foreach ($credit_balance_head_wise as $key => $value): ?>
                        <tr>
                            <td style="width: 16%"><?= $all_head_list[$key]; ?></td>
                            <td style="width: 10%"></td>
                            <?php
                                foreach ($bank_account_info as $key2 => $value2) {
                                    ?>
                                        <td class="credit_bank_<?= $value2['BankAccount']['id']; ?>" style="width: <?= 74/$bank_count; ?>%"><?= !empty($value[$value2['BankAccount']['id']])?$value[$value2['BankAccount']['id']]:''; ?></td>
                                    <?php
                                }
                            ?>
                        </tr>
                    <?php endforeach ?>
                <?php
                    }
                ?>
            </tbody>
        </table>
    </td>

    </tr>

    <tr class="table-bordered table">
        <td style="width: 8%;"><strong>মোট ডেবিট :</strong></td>
        <td style="width: 5%;"><strong class="debit_total_cash"></strong></td>
        <?php
            foreach ($bank_account_info as $key => $value) {
                echo '<td style="width: '.$bank_wise_occupied_percentage.'%" class="total_debit_bank_'.$value['BankAccount']['id'].'"></td>';
            }
        ?>
        <td style="width: 8%;"><strong>মোট ক্রেডিট :</strong></td>
        <td style="width: 5%;"><strong class="credit_total_cash"></strong></td>
        <?php
            foreach ($bank_account_info as $key => $value) {
                echo '<td style="width: '.$bank_wise_occupied_percentage.'%" class="total_credit_bank_'.$value['BankAccount']['id'].'"></td>';
            }
        ?>
    </tr>
    <tr class="table-bordered">
        <td style="width: 8%;"><strong></strong></td>
        <td style="width: 5%;"><strong class="debit_total_cash"></strong></td>
        <?php
            foreach ($bank_account_info as $key => $value) {
                echo '<td style="width: '.$bank_wise_occupied_percentage.'%"></td>';
            }
        ?>
        <td style="width: 8%;"><strong>মোট ডেবিট :</strong></td>
        <td style="width: 5%;"><strong class="credit_total_cash"></strong></td>
        <?php
            foreach ($bank_account_info as $key => $value) {
                echo '<td style="width: '.$bank_wise_occupied_percentage.'%" class="total_debit_bank_'.$value['BankAccount']['id'].'"></td>';
            }
        ?>
    </tr>
    <tr class="table-bordered">
        <td style="width: 8%;"><strong></strong></td>
        <td style="width: 5%;"><strong class="debit_total_cash"></strong></td>
        <?php
            foreach ($bank_account_info as $key => $value) {
                echo '<td style="width: '.$bank_wise_occupied_percentage.'%"></td>';
            }
        ?>
        <td style="width: 8%;"><strong>Closing Balance :</strong></td>
        <td style="width: 5%;"><strong class="credit_total_cash"></strong></td>
        <?php
            foreach ($bank_account_info as $key => $value) {
                echo '<td style="width: '.$bank_wise_occupied_percentage.'%" class="closing_balance_bank_'.$value['BankAccount']['id'].'"></td>';
            }
        ?>
    </tr>

    </table>
               
    </div>


<?php endif ?>
            <!-- Report End -->


<script>
    $(document).ready(function(){
        $('.debit_bank').each(function(){
            var account_id = $(this).val();
            var total_debit_bank = 0;
            $('.debit_bank_'+account_id).each(function(){
                if ($(this).text() != '') {
                    total_debit_bank += parseFloat($(this).text());
                }
                $('.total_debit_bank_'+account_id).text(total_debit_bank.toFixed(2));
            });

            var total_credit_bank = 0;
            $('.credit_bank_'+account_id).each(function(){
                if ($(this).text() != '') {
                    total_credit_bank += parseFloat($(this).text());
                }
                $('.total_credit_bank_'+account_id).text(total_credit_bank.toFixed(2));
            });

            $('.closing_balance_bank_'+account_id).text((parseFloat($('.total_debit_bank_'+account_id).text())-parseFloat($('.total_credit_bank_'+account_id).text())).toFixed(2));
        });
    });
</script>


<script>
    $('#print_btn').click(function(){
        $('#content').print();
    });
</script>