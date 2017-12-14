<h3 class="box-title" style="margin-left:10%"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Opening Balance for Fix Assect'); ?></h3>
<div class="col-md-8 col-md-offset-1">
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Head name</th>
                    <th>Sub head name</th>
                    <th>Total value</th>
                </tr>
            </thead>
            <tbody>
                <?php
               // pr($data);
                $i = 1;
                foreach ($data as $key => $value) {
                    $subHeadListId = !empty($value['b']['b_id']) ? $value['b']['b_id'] : $value['a']['a_id'];
                    $accHeadListId = $value['a']['a_id'];
                    ?>
                    <tr>
                        <th scope="row"><?= $i ?></th>
                        <td><?= !empty($value['a']['head_name']) ? $value['a']['head_name'] : '' ?></td>
                        <td><?= !empty($value['b']['sub_head_name']) ? $value['b']['sub_head_name'] : '' ?></td>
                        <td>
                            <?php echo $this->Form->input('', array('name' => "data[OpeningBalances][transaction_amount][]", 'class' => 'form-control', 'label' => false, 'style' => 'width:100%')); ?>
                            <?php echo $this->Form->input('', array('type' => 'hidden', 'name' => "data[OpeningBalances][sub_head_list_id][]", 'class' => 'form-control', 'label' => false, 'value' => $subHeadListId)); ?>
                            <?php echo $this->Form->input('', array('type' => 'hidden', 'name' => "data[OpeningBalances][acc_head_list_id][]", 'class' => 'form-control', 'label' => false, 'value' => $accHeadListId)); ?>
                        </td>
                    </tr>
                    <?php
                    $i++;
                }
                ?>
            </tbody>
        </table>
    </div>
</div>
