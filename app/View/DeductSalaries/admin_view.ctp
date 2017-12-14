<div class="row">
    <div class="col-xs-12">		
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php echo __('Deduct Salary'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Deduct Salary List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <table id="DeductSalaries" class="table table-bordered table-striped">
                    <tbody>
                        <tr>
                            <td><strong><?php echo __('Id'); ?></strong></td>
                            <td>
                                <?php echo h($deductSalary['DeductSalary']['id']); ?>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td><strong><?php echo __('Name'); ?></strong></td>
                            <td>
                                <?php echo h($deductSalary['DeductSalary']['name']); ?>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td><strong><?php echo __('Created At'); ?></strong></td>
                            <td>
                                <?php echo h($deductSalary['DeductSalary']['created_at']); ?>
                                &nbsp;
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>


    </div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->

