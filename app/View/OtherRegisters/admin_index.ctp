<?php
/* 	pr($res); */
$obj = new OtherRegistersController();
if ($type == "BF") {
    $var = 1;
} else if ($type == "GI") {
    $var = 2;
} else {
    $var = 3;
}
?>
<div class="box-body">
    <?php
    echo $this->Form->create(false, array(
        'url' => array('controller' => 'OtherRegisters', 'action' => 'admin_index'),
        'id' => 'admin_index'
    ));
    ?>

    <table id="EmployeeLoans" class="table table-bordered table-striped" style="width: 50%;" align="center">

        <tr>
            <td>Department Name:</td>
            <td><?php
                $Depart = array('0' => 'All') + $Department;
                echo $this->Form->input('department_id', array('options' => $Depart, 'label' => false, 'style' => array('width: 110px')));
                ?></td>

            <!--  jquery code start here -->

        <script type="text/javascript">
            var base_url = "<?php echo BASE_URL; ?>";
            $(document).ready(function () {

                $('#department_id').change(function () {

                    var department_id = $("#department_id option:selected").val();

                    if (department_id != 0)
                    {
                        $.ajax({
                            url: base_url + "admin/OtherRegisters/get_employee_names",
                            method: "POST",
                            data: {department_id: department_id},
                            dataType: "text",
                            success: function (data)
                            {
                                $("#employee_id").html(data);
                                //$("#a").html(data);
                            }
                        });
                    }

                });


            });
        </script>
        <p id="a"></p>

        <!--  jquery code end here -->

        <td>Employee Name</td>
        <td><?php
            $Employe = array('0' => 'All') + $Employee;
            echo $this->Form->input('employee_id', array('options' => $Employe, 'label' => false, 'required' => true, 'style' => array('width: 110px')));
            ?></td>
        </tr>

        <tr>
            <td>Register type</td>
            <td>
                <?php
                $Register = array('1' => 'BF', '2' => 'GI', '3' => 'GPF Subcription');
                echo $this->Form->input('register_id', array('options' => $Register, 'label' => false, 'style' => array('width: 110px')))
                ?>
            </td>
            <td colspan="2"><input type="submit" name="search" value="search" class="btn btn-primary"></td>
        </tr>

    </table>

    <?php echo $this->Form->end(); ?>

    <?php if ($res): ?>

        <table id="EmployeeLoans" class="table table-bordered table-striped" align="center">

            <thead>
            <th>Name</th>
            <th>Designation</th>
            <th>Register type </th>
            <th>Total Balance</th>
            <th>Action</th>
            </thead>

            <tbody>
                <?php

                                   // pr($res);

                foreach ($res as $v): ?>
                    <tr>
                        <td>

                            <?php
                            $id = isset($v['EmployeeSalarySheet']['employee_id'])?$v['EmployeeSalarySheet']['employee_id']:$v['GpfSubscription']['employee_id'];
                            $data = $obj->get_name_designation_byId($id);
                            //pr($data);


                            echo $data[0]['Employee']['name'];
                            ?>

                        </td>
                        <td><?= $data[0]['Designation']['name']; ?></td>
                        <td><?= $type; ?></td>
                        <td><?= isset($v[0]['ttl'])?$v[0]['ttl']:$v['GpfSubscription']['ttl']; ?></td>
                        <td>
                            <a href="<?php echo BASE_URL . 'admin/OtherRegisters/details/' . $id . '/' . $var ?>"><span class="btn btn-primary">Details</span></a>
                        </td>
                    </tr>
                <?php endforeach; ?>

            </tbody>


        </table>
    <?php endif; ?>


</div>