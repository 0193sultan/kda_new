<style>
    .head_name{
        margin-left:3%;
    }
</style>
<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <?php
            $obj = new BalanceSheetsController();
            ?>
            <tr>
                <th style="width:40px">#</th>
                <th >বিবরণ</th>
                <th style="text-align:center"><?= $obj->get_fiscal_year($years[1]) ?></th>
                <th><?= $obj->get_fiscal_year($years[0]) ?></th>
            </tr>
        </thead>
        <tbody>
            <?php
            $i = 0;
            $bengali_alphabet = array('ক', 'খ', 'গ', 'ঘ', 'ঙ');
//            die();
            if (!empty($new_array)):
                //pr($new_array);
                foreach ($new_array as $key => $value) {
                    $total_1[$key] = 0;
                    $total_0[$key] = 0;
                }
                foreach ($new_array as $key => $value) {
                    ?>
                    <tr>
                        <td style="vertical-align: top; text-align:center">
                            <?php
                            if (isset($bengali_alphabet)) {
                                echo $bengali_alphabet[$i++];
                            }
                            ?>
                        </td>
                        <td><?= $obj->get_acc_head_type($key) ?><br>
                            <?php
                            foreach ($value as $k => $parent_id) {
                                echo '<div class=head_name>' . $obj->get_head_name($parent_id) . '</div>';
                            }
                            ?>
                        </td>
                        <td style="text-align:right">
                            <?php
                            foreach ($value as $k => $parent_id) {
                                $get_head_respective_data = $obj->get_head_respective_data($parent_id, $years[1]);
                                if ($get_head_respective_data == '-') {
                                    $total_1[$key] += 0;
                                    echo '<div class=head_name>' . $obj->get_head_respective_data($parent_id, $years[1]) . '</div>';
                                } else {
                                    $total_1[$key] += $obj->get_head_respective_data($parent_id, $years[1]);
                                    echo '<div class=head_name>' . number_format($obj->get_head_respective_data($parent_id, $years[1]), 2) . '</div>';
                                }
                            }
                            ?>
                        </td>
                        <td style="text-align:right">
                            <?php
                            foreach ($value as $k => $parent_id) {
                                $get_head_respective_data = $obj->get_head_respective_data($parent_id, $years[0]);
                                if ($get_head_respective_data == '-') {
                                    $total_0[$key] += 0;
                                    echo '<div class=head_name>' . $obj->get_head_respective_data($parent_id, $years[0]) . '</div>';
                                } else {
                                    $total_0[$key] += $obj->get_head_respective_data($parent_id, $years[0]);
                                    echo '<div class=head_name>' . number_format($obj->get_head_respective_data($parent_id, $years[0]), 2) . '</div>';
                                }
                            }
                            ?>
                        </td>
                    </tr>
                    <tr >
                        <td>&nbsp;</td>
                        <td style="text-align: right">মোট <?= $obj->get_acc_head_type($key) ?>  :</td>
                        <td style="text-align:right;">
                            <?php echo '<div class=head_name>' . number_format($total_1[$key], 2) . '</div>';
                            ?>

                        </td>
                        <td style="text-align:right"><?php echo '<div class=head_name>' . number_format($total_0[$key], 2) . '</div>'; ?></td>
                    </tr>
                    <?php
                }
                ?>
                <tr>
                    <td style="vertical-align: top; text-align:center">ঙ</td>
                    <td style="text-align: right">নীট চলতি সম্পত্তি :(খ-গ)</td>
                    <td style="text-align:right">
                        <?php
                        $ka_gah_1 = $total_1[4] - $total_1[5];
                        echo number_format($ka_gah_1, 2);
//                        if (count($total[4]) > 0 && count($total[5]) > 0) {
//                            $net_current_asset1 = $total[4][0] - $total[5][0];
//                            echo number_format($total[4][0] - $total[5][0], 2);
//                        } else {
//                            echo '-';
//                        }
                        ?>
                    </td>
                    <td style="text-align:right"><?php
                        $ka_gah_0 = $total_0[4] - $total_0[5];
                        echo number_format($ka_gah_0, 2);
//                    if (count($total[4]) > 0 && count($total[5]) > 0) {
//                        $net_current_asset2 = $total[4][1] - $total[5][1];
//                       echo number_format($total[4][1] - $total[5][1], 2);
//                    } else {
//                        echo '-';
//                    }
                        ?></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: right">মোট সম্পত্তি : (ক+ঙ)</td>
                    <td style="text-align:right"><?php
                        echo number_format($total_1[3] + $ka_gah_1, 2);
//                    if (count($total[3]) > 0 && !empty($net_current_asset1)) {
//                        echo $net_asset1 = number_format($net_current_asset1 + $total[3][0], 2);
//                    } else {
//                        echo '-';
//                    }
                        ?></td>
                    <td style="text-align:right"><?php
                        echo number_format($total_0[3] + $ka_gah_0, 2);
//                    if (count($total[3]) > 0 && !empty($net_current_asset2)) {
//                        echo $net_asset1 = number_format($net_current_asset2 + $total[3][1], 2);
//                    } else {
//                        echo '-';
//                    }
                        ?></td>
                </tr>

                <?php
            endif;
            ?>
        </tbody>
    </table>
</div>