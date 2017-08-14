<div class="row">
    <div class="col-xs-12">		
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php echo __('Bank Info'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Bank Info List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <table id="BankInfos" class="table table-bordered table-striped">
                    <tbody>
                        <tr>		<td><strong><?php echo __('Id'); ?></strong></td>
                            <td>
                                <?php echo h($bankInfo['BankInfo']['id']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Name'); ?></strong></td>
                            <td>
                                <?php echo h($bankInfo['BankInfo']['name']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Create Date'); ?></strong></td>
                            <td>
                                <?php echo h($bankInfo['BankInfo']['create_date']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Update Date'); ?></strong></td>
                            <td>
                                <?php echo h($bankInfo['BankInfo']['update_date']); ?>
                                &nbsp;
                            </td>
                        </tr><tr>		<td><strong><?php echo __('Status'); ?></strong></td>
                            <td>
                                <?php echo h($bankInfo['BankInfo']['status']); ?>
                                &nbsp;
                            </td>
                        </tr>					</tbody>
                </table>
            </div>
        </div>


    </div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

