<div class="row">
    <div class="col-xs-12">		
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php echo __('Branch'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Branch List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <table id="Branches" class="table table-bordered table-striped">
                    <tbody>
                        <tr>		<td><strong><?php echo __('Id'); ?></strong></td>
                            <td>
                                <?php echo h($branch['Branch']['id']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('BankInfo'); ?></strong></td>
                            <td>
                                <?php echo $this->Html->link($branch['BankInfo']['name'], array('controller' => 'BankInfos', 'action' => 'view', $branch['BankInfo']['id']), array('class' => '')); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Branch'); ?></strong></td>
                            <td>
                                <?php echo h($branch['Branch']['branch']); ?>
                                &nbsp;
                            </td>
                        </tr>					</tbody>
                </table>
            </div>
        </div>

    </div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

