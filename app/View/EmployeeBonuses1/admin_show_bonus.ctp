<style>
    label {
        float: left;
        width: 100%;
        text-align: left;
        margin: 5px 20px 0 0;
        padding: 10%;
    }
    .search_employee label {
        float: left;
        width: 100%;
        text-align: left;
        margin: 5px 20px 0 0;
        padding: 0px;
    }
    .form-control {
        float: left;
        width: 90%;
        font-size: 13px;
        height: 28px;
        padding: 5px;
        margin-left: 10px;
    }
    .submit {
        margin-left: 0px;
        padding-left: 0px;
    }
</style>

<?php
$obj = new EmployeeBonusesController();
?>

<div class="box-body">
    <?php
    echo $this->Form->create(false, array(
        'url' => array('controller' => 'EmployeeBonuses', 'action' => 'admin_show_bonus'),
        'id' => 'admin_show_bonus'
    ));
    ?>
    <div  class="row">
        <div class=" col-sm-12">
            <table align="center">
                <tr>
                    <td><h5 class="box-title">Year :</h5></td>
                    <td>

                        <?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:200px', 'options' => $FiscalYear)); ?>

                    </td>
                    <td><h5 class="box-title">&nbsp;&nbsp;&nbsp;&nbsp;Month :</h5></td>
                    <td><?php echo $this->Form->input('month_id', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:200px', 'options' => $Month)); ?></td>
                    <td><?php echo $this->Form->input('bonusTypes', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:200px', 'options' => $bonusTypes)); ?></td>

                    <td>&nbsp;&nbsp;&nbsp;<input type="submit" name="Search Bonus" value="Search Bonus" class="btn btn-primary"></td>

                </tr>
            </table>
            <br>
        </div>
        <?php echo $this->Form->end(); ?>


    </div>

    <div>

        <?php

          // pr($bonus);
        if (!empty($bonus)): ?>

            <div id="print_me">

                <table class="table table-bordered table-striped" style="width: 50%;"  align="center">

                    <tr>
                        <td>Bonus Name:</td>
                        <td>
                            <?php
                            $comment = $obj->get_config_meta_comment($bonus[0]['EmployeeBonus']['festival_tracking_config_meta_id']);
                            echo $comment[0]['ConfigMeta']['comment'];
                            ?>
                        </td>
                    </tr>

                    <tr>

                        <td>Fiscal Year</td>
                        <td><?= $bonus[0]['FiscalYear']['name']; ?></td>
                    </tr>
                    <tr>
                        <td>Month</td>
                        <td><?= $bonus[0]['Month']['name']; ?></td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td><?= $bonus[0]['EmployeeBonus']['created_at']; ?></td>
                    </tr>

                </table>

                <table class="table table-bordered table-striped"  align="center">

                    <thead>
                        <tr>
                            <th>Employee Name</th>
                            <th>Department name</th>
                            <th>Designation</th>
                            <th>Current Basic</th>
                            <th>Bonus Amount</th>
                            <th>Present Address</th>
                        </tr>
                    </thead>

                    <tbody>

                        <?php foreach ($bonus as $v): ?>

                            <tr>
                                <td><?= !empty($v['Employee']['name'])?$v['Employee']['name']:''; ?></td>
                                <td><?=$obj->get_department($v['Employee']['department_id'])?></td>
                                <td><?=$obj->get_designation($v['Employee']['designation_id']) ?></td>
                                <td><?= !empty($v['EmployeeBonus']['current_basic'])?$v['EmployeeBonus']['current_basic']:''; ?></td>
                                <td><?= !empty($v['EmployeeBonus']['bonus_amount'])?$v['EmployeeBonus']['bonus_amount']:''; ?></td>
                                <td><?= !empty($v['Employee']['name'])?$v['Employee']['name']:''; ?></td>
                            </tr>

                        <?php endforeach; ?>

                    </tbody>

                </table>

            </div>

            <p class="pull-right btn btn-primary" id="print" style="">Print</p>
            <script type="text/javascript">
                $('#print').click(function () {
                    $("#print_me").print();
                });
            </script>
        <?php endif; ?>
    </div>

</div>