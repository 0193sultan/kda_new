<h3 class="box-title" style="margin-left:10%"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Opening Balance for Cash in Hand'); ?></h3>
<div class="col-md-6 col-md-offset-1">
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Sub Head name</th>
                    <th>Total value</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $i = 1;
                //pr($accHeadLists);
                foreach ($accHeadLists as $key => $value) {
                    $accHeadListId = $value['AccHeadList']['id'];
                    //pr($value);
                    ?>
                    <tr>
                        <th scope="row"><?= $i ?></th>
                        <td><?php
                            $obj = new OpeningBalancesController;
                            echo $obj->sub_head_name($value['AccHeadList']['id']);
                            ?></td>
                        <td> <?php echo $this->Form->input('transaction_amount', array('name' => "data[OpeningBalances][transaction_amount][]", 'class' => 'form-control', 'label' => false, 'style' => 'width:100%')); ?>
                            <?php echo $this->Form->input('', array('type' => 'hidden', 'name' => "data[OpeningBalances][sub_head_list_id][]", 'class' => 'form-control', 'label' => false, 'value' => $accHeadListId)); ?>
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
