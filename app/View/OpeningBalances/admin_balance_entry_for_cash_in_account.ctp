<h3 class="box-title"  style="margin-left:10%"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Opening Balance for Cash in Account'); ?></h3>
<div class="col-md-9 col-md-offset-1">
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Bank  name</th>
                    <th>Branch name</th>
                    <th>Account NO</th>
                    <th>Account type</th>
                    <th>Total value</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $i = 1;
               // pr($bankAccounts);
                $obj = new OpeningBalancesController();
                foreach ($bankAccounts as $key => $value) {
                    ?>
                    <tr>
                        <th scope="row"><?= $i ?></th>
                        <td><?= !empty($value['BankAccounts']['bank_info_id']) ? $obj->get_bank_name($value['BankAccounts']['bank_info_id']) : '' ?></td>
                        <td><?= !empty($value['BankAccounts']['branch_id']) ? $obj->get_branch_name($value['BankAccounts']['branch_id']) : '' ?></td>
                        <td><?= !empty($value['BankAccounts']['account_no']) ? $value['BankAccounts']['account_no'] : '' ?></td>
                        <td><?= !empty($value['BankAccounts']['account_no']) ? $value['BankAccounts']['account_type'] : '' ?></td>
                        <td>
                            <?php echo $this->Form->input('', array('name' => "data[OpeningBalances][transaction_amount][]", 'class' => 'form-control', 'label' => false, 'style' => 'width:100%')); ?>
                            <?php echo $this->Form->input('', array('type'=>'hidden','name' => "data[OpeningBalances][bank_info_id][]", 'class' => 'form-control', 'value' => $value['BankAccounts']['bank_info_id'])); ?>
                            <?php echo $this->Form->input('', array('type'=>'hidden','name' => "data[OpeningBalances][branch_id][]", 'class' => 'form-control', 'value' => $value['BankAccounts']['branch_id'])); ?>
                            <?php echo $this->Form->input('', array('type'=>'hidden','name' => "data[OpeningBalances][bank_account_id][]", 'class' => 'form-control', 'value' => $value['BankAccounts']['id'])); ?>
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
