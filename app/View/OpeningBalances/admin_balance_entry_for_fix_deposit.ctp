<style>
    #new_balance_for_fix_deposit{
        display: none;
    }
</style>

<div class="col-md-5 col-md-offset-1">
    <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Opening Balance for Fix Deposit'); ?></h3>
    <div class="table-responsive">
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <td>Sub Head name</td>
                    <td><?php echo $this->Form->input('sub_head_list_id', array('name' => "data[OpeningBalances][sub_head_list_id]", 'class' => 'form-control', 'label' => false, 'style' => 'width:100%', 'empty' => array('' => $accHeadLists))); ?></td>
                </tr>
                <tr>
                    <td>Deposit Bank  name :</td>
                    <td><?php echo $this->Form->input('fix_deposit_bank_name', array('name' => "data[OpeningBalances][fix_deposit_bank_name]", 'class' => 'form-control', 'label' => false, 'style' => 'width:100%')); ?></td>
                </tr>
                <tr>
                    <td>Deposit Branch Name :</td>
                    <td><?php echo $this->Form->input('fix_deposit_branch_name', array('name' => "data[OpeningBalances][fix_deposit_branch_name]", 'class' => 'form-control', 'label' => false, 'style' => 'width:100%')); ?></td>
                </tr>
                <tr>
                    <td>Deposit account NO :</td>
                    <td><?php echo $this->Form->input('fix_deposit_no', array('name' => "data[OpeningBalances][fix_deposit_no]", 'class' => 'form-control', 'label' => false, 'style' => 'width:100%')); ?></td>
                </tr>
                <tr>
                    <td>Deposit Interest rate :</td>
                    <td><?php echo $this->Form->input('interest_rate', array('name' => "data[OpeningBalances][interest_rate]", 'class' => 'form-control', 'label' => false, 'style' => 'width:100%')); ?></td>
                </tr>
                <tr>
                    <td>Deposit Investment Date :</td>
                    <td><?php echo $this->Form->input('investment_date', array('name' => "data[OpeningBalances][investment_date]", 'class' => 'form-control datepicker', 'label' => false, 'style' => 'width:100%')); ?></td>
                </tr>
                <tr>
                    <td>Deposit Investment Expire Date :</td>
                    <td><?php echo $this->Form->input('investment_expire_date', array('name' => "data[OpeningBalances][investment_expire_date]", 'class' => 'form-control datepicker', 'label' => false, 'style' => 'width:100%')); ?></td>
                </tr>
                <tr>
                    <td>Deposit Investment Amount</td>
                    <td><?php echo $this->Form->input('investment_amount', array('name' => "data[OpeningBalances][investment_amount]", 'class' => 'form-control', 'label' => false, 'style' => 'width:100%')); ?></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="col-md-5">
    <div class="row" id="new_balance_for_fix_deposit">
        <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('New Balance for fix deposit'); ?></h3>
        <div class="table-responsive">
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td>Bank  name :</td>
                    <td><?php echo $this->Form->input('bank_info_id', array('name' => "data[OpeningBalances][bank_info_id]", 'class' => 'form-control bank_id', 'label' => false, 'style' => 'width:100%', 'empty' => '---- Please Select ----')); ?></td>
                </tr>
                <tr>
                    <td>Branch Name :</td>
                    <td><?php echo $this->Form->input('branch_id', array('name' => "data[OpeningBalances][branch_id]", 'class' => 'form-control branch_id', 'label' => false, 'style' => 'width:100%', 'empty' => '---- Please Select ----')); ?></td>
                </tr>
                <tr>
                    <td>account NO :</td>
                    <td><?php echo $this->Form->input('bank_account_id', array('name' => "data[OpeningBalances][bank_account_id]", 'class' => 'form-control account_no', 'label' => false, 'style' => 'width:100%', 'empty' => '---- Please Select ----')); ?></td>
                </tr>
                <tr>
                    <td>Fiscal Year :</td>
                    <td><?php echo $this->Form->input('fiscal_year_id', array('name' => "data[OpeningBalances][fiscal_year_id]", 'class' => 'form-control', 'label' => false, 'style' => 'width:100%')); ?></td>
                </tr>
                <tr>
                    <td>Month :</td>
                    <td><?php echo $this->Form->input('month_id', array('name' => "data[OpeningBalances][month_id]", 'class' => 'form-control datepicker', 'label' => false, 'style' => 'width:100%')); ?></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

