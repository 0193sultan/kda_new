<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Head Name</th>
                <th>Debit Amount</th>
                <th>Credit Amount</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $i = 0;
            $obj = new TrialBalancesController();
            $temp1 = 0;
            $temp2 = 0;
            foreach ($data as $key => $value) {
                ?>
                <tr>
                    <th scope="row"><?= ++$i ?></th>
                    <td><?= $value['AccHeadList_tb']['head_name'] ?></td>
                    <td>
                        <?php
                        echo number_format($obj->get_debit_amount($value['AccHeadList_tb']['id'], $value['DailyTransaction']['acc_head_type_id']), 2);
                        $sum_debit_amount = $temp1 + $obj->get_debit_amount($value['AccHeadList_tb']['id'], $value['DailyTransaction']['acc_head_type_id']);
                        $temp1 = $sum_debit_amount;
                        ?>
                    </td>
                    <td>
                        <?php
                        echo number_format($obj->get_credit_amount($value['AccHeadList_tb']['id'], $value['DailyTransaction']['acc_head_type_id']), 2);
                        $sum_credit_amount = $temp2 + $obj->get_credit_amount($value['AccHeadList_tb']['id'], $value['DailyTransaction']['acc_head_type_id']);
                        $temp2 = $sum_credit_amount;
                        ?>
                    </td>
                </tr>
                <?php
            }
            ?>
            <tr>
                <td colspan="2" style="text-align: right">Total :</td>
                <td><?php
                if(!empty($sum_debit_amount))
                    number_format($sum_debit_amount, 2)
                    ?></td>
                <td><?php
                if(!empty($sum_debit_amount))
                    number_format($sum_credit_amount, 2)
                    ?></td>
            </tr>
        </tbody>
    </table>
</div>