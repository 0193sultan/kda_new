            <!-- Report Start -->
<?php if (!empty($income_info) || !empty($expense_info)): ?>
    
        <div class="box box-primary"><br>
            <button class="btn btn-primary pull-right" id="print_btn"><i class="glyphicon glyphicon-print"></i> Print</button>
    <div id="content" style="width:90%;height:100%;margin-left:5%;margin-right:5%;">
        <!-- <div style="text-align:right;width:100%;">Page No :1 of 2</div> -->
        
        <div style="float: left; height: 55px; width: 35px;"><?php //echo $this->Html->image(''); ?></div>
        <div style="width:100%;text-align:center;">
            <div style="font-size:20px;">খুলনা উন্নয়ন কর্তৃপক্ষ</div>
            <div style="font-size:14px;"><strong>আয়-ব্যায় হিসাব</strong></div>
            <div style="font-size:13px;"><?php echo $fiscal_year_list[$fiscal_year_id]; ?>&nbsp;&nbsp;অর্থ বছর&nbsp;&nbsp;পর্যন্ত</div>
        </div>    
        <br>

    <table class="print-table table table-bordered table-responsive" style="width:100%;float: left;" cellpadding="2px" cellspacing="0">
    <tr>
    <td colspan="3" style="vertical-align:top;padding: 0px;">  
        <table class="print-table table table-bordered table-responsive" style="width:100%;float: left;" cellpadding="2px" cellspacing="0">
            <thead>
                <tr>
                    <th colspan="3">ব্যায়</th>
                </tr>

                <tr>
                    <th style="width: 40%">খাতের নাম</th>
                    <th style="width: 30%">বর্তমান বছর (টাকা)</th>
                    <th style="width: 30%">আগের বছর (টাকা)</th> 
                </tr>
            </thead>

            <tbody>
                <?php
                    if (!empty($expense_info)) {
                ?>
                    <?php foreach ($expense_info as $key => $value): ?>
                        <tr>
                            <td><?= $all_head_list[$key]; ?></td>
                            <td class="expense_tk"><?= !empty($value['total_current_expense'])?$value['total_current_expense']:''; ?></td>
                            <td class="prev_expense_tk"><?= !empty($value['total_previous_expense'])?$value['total_previous_expense']:''; ?></td>
                        </tr>
                    <?php endforeach ?>
                <?php
                    }
                ?>
            </tbody>
        </table>

    </td>

    <td colspan="3" style="vertical-align:top;padding: 0px;">
        <table class="print-table table table-bordered table-responsive" style="width:100%;float: left;" cellpadding="2px" cellspacing="0">
            <thead>
                <tr>
                    <th colspan="3">আয়</th>
                </tr>
                <tr>
                    <th style="width: 40%">খাতের নাম</th>
                    <th style="width: 30%">বর্তমান বছর (টাকা)</th>
                    <th style="width: 30%">আগের বছর (টাকা)</th>
                </tr>
            </thead>

            <tbody>
                <?php
                    if (!empty($income_info)) {
                ?>
                    <?php foreach ($income_info as $key => $value): ?>
                        <tr>
                            <td><?= $all_head_list[$key]; ?></td>
                            <td class="income_tk"><?= !empty($value['total_current_income'])?$value['total_current_income']:''; ?></td>
                            <td class="prev_income_tk"><?= !empty($value['total_previous_income'])?$value['total_previous_income']:''; ?></td>
                        </tr>
                    <?php endforeach ?>
                <?php
                    }
                ?>
            </tbody>
        </table>
    </td>

    </tr>

    <tr class="table-bordered">
        <td style="width: 20%;"><strong>সর্বমোট :</strong></td>
        <td style="width: 15%;"><strong class="expense_tk_total"></strong></td>
        <td style="width: 15%;"><strong class="prev_expense_tk_total"></td>
        <td style="width: 20%;"><strong>সর্বমোট :</strong></td>
        <td style="width: 15%;"><strong class="income_tk_total"></strong></td>
        <td style="width: 15%;"><strong class="prev_income_tk_total"></strong></td>
    </tr>

    </table>
               
    </div>


<?php endif ?>
            <!-- Report End -->


<script>
    $(document).ready(function(){

        var expense_tk_total = 0;
        $('.expense_tk').each(function(){
            if ($(this).text()!='') {
                expense_tk_total += parseFloat($(this).text());
            }
        });
        $('.expense_tk_total').text(expense_tk_total.toFixed(2));

        var income_tk_total = 0;
        $('.income_tk').each(function(){
            if ($(this).text()!='') {
                income_tk_total += parseFloat($(this).text());
            }
        });
        $('.income_tk_total').text(income_tk_total.toFixed(2));

        var prev_expense_tk_total = 0;
        $('.prev_expense_tk').each(function(){
            if ($(this).text()!='') {
                prev_expense_tk_total += parseFloat($(this).text());
            }
        });
        $('.prev_expense_tk_total').text(prev_expense_tk_total.toFixed(2));

        var prev_income_tk_total = 0;
        $('.prev_income_tk').each(function(){
            if ($(this).text()!='') {
                prev_income_tk_total += parseFloat($(this).text());
            }
        });
        $('.prev_income_tk_total').text(prev_income_tk_total.toFixed(2));

    });
</script>

<script>
    $('#print_btn').click(function(){
        $('#content').print();
    });
</script>