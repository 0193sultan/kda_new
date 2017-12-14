<?php
//pr($bonusType);
//pr($percent);
//pr($tracking);
//pr($Employee);
//exit();


$bonus_type = array('eid_ul_fitr' => 'Eidul Fitr Bonus', 'eidul_azha' => 'Eidul Azha Bonus', 'festival_hindu' => 'Hindu Festival Bonus', 'festival_cristianity' => 'Cristianity Festival Bonus', 'festival_buddhisam' => 'Buddhisam Festival Bonus', 'pohela_boishakh' => 'Pohela Boishakh Bonus');
?>

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

<div class="box-body">
    <?php
    echo $this->Form->create(false, array(
        'url' => array('controller' => 'EmployeeBonuses', 'action' => 'admin_index'),
        'id' => 'admin_index'
    ));
    ?>
    <div  class="row">
        <div class=" col-sm-12">
            <table>
                <tr>
                    <td><h5 class="box-title">Year :</h5></td>
                    <td><?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:200px', 'options' => $FiscalYear)); ?></td>
                    <td><h5 class="box-title">&nbsp;&nbsp;&nbsp;&nbsp;Month :</h5></td>
                    <td><?php echo $this->Form->input('month_id', array('class' => 'form-control grade', 'label' => false, 'style' => 'width:200px', 'options' => $Month)); ?></td>
                    <td><?php echo $this->Form->input('bonusTypes', array('class' => 'form-control', 'label' => false,'options' => $bonusTypes)); ?></td>
                    <td>&nbsp;&nbsp;&nbsp;<input type="submit"  value="Search" class="btn btn-primary"></td>

                </tr>
            </table>
            <br>
        </div>


    </div>

    <div class="table-responsive">
        <?php if (!empty($Employee)): ?>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th  style="width:10px">
                            <a id="test1" style=" cursor: pointer">All</a>
                        </th>
                        <th>Employee Name</th>
                        <th>Department name</th>
                        <th>Designation</th>
                        <th>Current Basic</th>
                        <th>Code</th>
                        <th>Present Address</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    foreach ($Employee as $key => $employee) {
                        $emp_id = $employee['Employee']['id'];
                        ?>
                        <tr>
                            <td scope="row">
                                <input type="checkbox" class="form-control check_all" name="emp_id[]" value="<?php echo $emp_id; ?>">
                            </td>
                            <td><?php echo $employee['Employee']['name'] ?></td>
                            <td><?php echo $employee['Department']['name'] ?></td>
                            <td><?php echo $employee['Designation']['name'] ?></td>
                            <td><?php echo $employee['Scale']['grade_basic'] ?></td>
                            <td><?php echo $employee['Employee']['employeeID'] ?>
                            </td>
                            <td><?php echo $employee['Employee']['present_address'] ?></td>
                        </tr>
                        <?php
                    }
                    ?>
                </tbody>
            </table>

        </div>
        <br><br>
        <input type="hidden" name="percentage" value="<?php if (!empty($percent)) echo $percent; ?>">
        <input type="hidden" name="tracking" value="<?php if (!empty($tracking)) echo $tracking; ?>">
        <input type="hidden" name="month_id" value="<?php if (!empty($month_id)) echo $month_id; ?>">
        <input type="hidden" name="fiscal_year_id" value="<?php if (!empty($fiscal_year_id)) echo $fiscal_year_id; ?>">
        <input type="hidden" name="user_id" value="<?php echo $this->UserAuth->getUserId(); ?>">
        <?php echo $this->Form->submit('Generate Bonus', array('class' => 'btn btn-large btn-primary')); ?>
    <?php endif; ?>
    <?php echo $this->Form->end(); ?>

    <script>
        $(document).ready(function () {
            $('#test1').click(function () {
                $('.icheckbox_minimal').toggleClass('checked');
                var checkBoxes = $(".check_all");
                checkBoxes.prop("checked", !checkBoxes.prop("checked"));

                //$('.check_all').prop('checked', true)

            });

        });

    </script>

</div>

