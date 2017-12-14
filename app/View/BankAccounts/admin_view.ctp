<div class="row">
    <div class="col-xs-12">		
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php echo __('Bank Account'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Bank Account List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <table id="BankAccounts" class="table table-bordered table-striped">
                    <tbody>
                        <tr>		<td><strong><?php echo __('Id'); ?></strong></td>
                            <td>
                                <?php echo h($bankAccount['BankAccount']['id']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('BankInfo'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($bankAccount['BankInfo']['name'], array('controller' => 'banks', 'action' => 'view', $bankAccount['BankInfo']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Branch'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($bankAccount['Branch']['branch'], array('controller' => 'branches', 'action' => 'view', $bankAccount['Branch']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Account No'); ?></strong></td>
                            <td>
                                <?php echo h($bankAccount['BankAccount']['account_no']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Status'); ?></strong></td>
                            <td>
                                <?php echo h($bankAccount['BankAccount']['status']); ?>
                                &nbsp;
                            </td>
                        </tr>					</tbody>
                </table>
            </div>
        </div>

    </div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

