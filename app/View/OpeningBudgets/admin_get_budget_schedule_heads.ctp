<style>
    .budget_amount{
        width: 100%;
    }
</style>

<div class="row">
    <div class="col-md-12">
        <div class="box-header">
            <h2 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Opening Budget'); ?></h2>
        </div>
        <div class="box-body">
            <table class="table table-bordered" style="width: 60%;">
                <thead>
                    <tr>
                        <th>Particulars</th>
                        <th>Actual Budget</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($budget_head_list_info as $key => $value): ?>
                        <tr>
                            <td><?= $value['BudgetHeadList']['head_name']; ?></td>
                            <td>
                                <?php echo $this->Form->input('budget_amount', array('label'=>false, 'name'=>'budget_amount['.$value['BudgetHeadList']['id'].']', 'class' => 'form-control budget_amount')); ?>
                            </td>
                        </tr>
                    <?php endforeach ?>
                </tbody>
            </table>
        </div>
    </div>
</div>