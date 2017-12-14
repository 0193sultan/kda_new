            <!-- Report Start -->
<?php //if (!empty($budget_report)): ?>
    
        <div class="box box-primary" style="min-height: 2000px;"><br>
            
            <button class="pull-right btn btn-primary" id="print_btn"><i class="glyphicon glyphicon-print"></i> Print</button>
    <div id="content" style="width:90%;height:100%;margin-left:5%;margin-right:5%;">
        <!-- <div style="text-align:right;width:100%;">Page No :1 of 2</div> -->
        
        <div style="float: left; height: 55px; width: 35px;"><?php //echo $this->Html->image(''); ?></div>
        <div style="width:100%;text-align:center;">
            <div style="font-size:20px;">খুলনা উন্নয়ন কর্তৃপক্ষ</div>
            <div style="font-size:14px;"><strong>Budget Report</strong></div>
            <div style="font-size:13px;"><?php echo $fiscal_year_list[$fiscal_year_id]; ?>&nbsp;&nbsp;অর্থ বছর পর্যন্ত</div>
        </div>    
        <br>

    <?php foreach ($all_schedule as $schedule_key => $schedule): ?>
        <table class="print-table table table-bordered table-responsive" style="width:100%;float: left;" cellpadding="2px" cellspacing="0">
            <thead>
                <tr>
                    <th colspan="7" class="text-center">Schedule : <?= $schedule['BudgetSchedule']['name']; ?></th>
                </tr>
                <tr>
                    <th>S.L. No.</th>
                    <th>Particulars</th>
                    <th>Proposed Budget For <?= $fiscal_year_list[$fiscal_year_id]; ?></th>
                    <th>Proposed Revised Budget For <?= !empty($fiscal_year_list[$fiscal_year_id-1])?$fiscal_year_list[$fiscal_year_id-1]:''; ?></th>
                    <th>Approved Budget For <?= !empty($fiscal_year_list[$fiscal_year_id-1])?$fiscal_year_list[$fiscal_year_id-1]:''; ?></th>
                    <th>Actual Budget For 6 Months (<?= !empty($fiscal_year_list[$fiscal_year_id-1])?$fiscal_year_list[$fiscal_year_id-1]:''; ?>)</th>
                    <th>Actual Budget For <?= !empty($fiscal_year_list[$fiscal_year_id-2])?$fiscal_year_list[$fiscal_year_id-2]:''; ?></th>
                </tr>
            </thead>
            <?php if (!empty($budget_report[$schedule['BudgetSchedule']['id']]['head_id'])): ?>
                <tbody>
                    <?php $i=0; ?>
                    <?php foreach ($budget_report[$schedule['BudgetSchedule']['id']]['head_id'] as $key => $value): ?>
                        <tr>
                            <td><?= $i+1; ?></td>
                            <td><?= $budget_head_list[$value]; ?></td>
                            <td><?= !empty($budget_report[$schedule['BudgetSchedule']['id']]['proposed'][$i])?$budget_report[$schedule['BudgetSchedule']['id']]['proposed'][$i]:'-'; ?></td>
                            <td><?= !empty($budget_report[$schedule['BudgetSchedule']['id']]['revised'][$i])?$budget_report[$schedule['BudgetSchedule']['id']]['revised'][$i]:'-'; ?></td>
                            <td><?= !empty($budget_report[$schedule['BudgetSchedule']['id']]['approved'][$i])?$budget_report[$schedule['BudgetSchedule']['id']]['approved'][$i]:'-'; ?></td>
                            <td><?= !empty($budget_report[$schedule['BudgetSchedule']['id']]['actual_six'][$i])?$budget_report[$schedule['BudgetSchedule']['id']]['actual_six'][$i]:'-'; ?></td>
                            <td><?= !empty($budget_report[$schedule['BudgetSchedule']['id']]['actual'][$i])?$budget_report[$schedule['BudgetSchedule']['id']]['actual'][$i]:'-'; ?></td>
                        </tr>
                        <?php $i++; ?>
                    <?php endforeach ?>
                </tbody>
            <?php endif ?>
            <tfoot>
                <tr>
                    <td colspan="2"><strong class="pull-right">Total :</strong></td>
                    <td>
                        <?php
                            if (!empty($budget_report[$schedule['BudgetSchedule']['id']]['proposed'])) {
                                $total_proposed = 0;
                                foreach ($budget_report[$schedule['BudgetSchedule']['id']]['proposed'] as $key => $value) {
                                    $total_proposed += $value;
                                }
                                echo sprintf('%0.2f', $total_proposed);
                            } else {
                                echo '-';
                            }

                        ?>
                    </td>
                    <td>
                        <?php
                            if (!empty($budget_report[$schedule['BudgetSchedule']['id']]['revised'])) {
                                $total_revised = 0;
                                foreach ($budget_report[$schedule['BudgetSchedule']['id']]['revised'] as $key => $value) {
                                    $total_revised += $value;
                                }
                                echo sprintf('%0.2f', $total_revised);   
                            } else {
                                echo '-';
                            }
                        ?>
                    </td>
                    <td>
                        <?php
                            if (!empty($budget_report[$schedule['BudgetSchedule']['id']]['approved'])) {
                                $total_approved = 0;
                                foreach ($budget_report[$schedule['BudgetSchedule']['id']]['approved'] as $key => $value) {
                                    $total_approved += $value;
                                }
                                echo sprintf('%0.2f', $total_approved);
                            } else {
                                echo '-';
                            }

                        ?>
                    </td>
                    <td>
                        <?php
                            if (!empty($budget_report[$schedule['BudgetSchedule']['id']]['actual_six'])) {
                                $total_actual_six = 0;
                                foreach ($budget_report[$schedule['BudgetSchedule']['id']]['actual_six'] as $key => $value) {
                                    $total_actual_six += $value;
                                }
                                echo sprintf('%0.2f', $total_actual_six);
                            } else {
                                echo '-';
                            }

                        ?>
                    </td>
                    <td>
                        <?php
                            if (!empty($budget_report[$schedule['BudgetSchedule']['id']]['actual'])) {
                                $total_actual = 0;
                                foreach ($budget_report[$schedule['BudgetSchedule']['id']]['actual'] as $key => $value) {
                                    $total_actual += $value;
                                }
                                echo sprintf('%0.2f', $total_actual);
                            } else {
                                echo '-';
                            }

                        ?>
                    </td>
                </tr>
            </tfoot>
        </table>
    <?php endforeach ?>
               
    </div>


<?php //endif ?>
            <!-- Report End -->



<script>
    $('#print_btn').click(function(){
        $('#content').print();
    });
</script>