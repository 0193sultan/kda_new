<?php
$grade_declare_year = array();
$grade_declare_year[''] = "Select Grade Declare";
foreach ($employeeGradesYear as $row) {
    $grade_declare_year[$row['EmployeeGrade']['grade_declare_year']] = $row['EmployeeGrade']['grade_declare_year'];
}
?>

<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Edit Increment'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Scale List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('Scale', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('employee_grade_year', array('class' => 'form-control grade_year', 'name' => 'data[EmployeeGrade][grade_year]', 'options' => $grade_declare_year, 'default' => $this->request->data['EmployeeGrade']['grade_declare_year'])); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('employee_grade_id', array('class' => 'form-control grade')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('grade_basic', array('class' => 'form-control')); ?>
                </div>
                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $(".grade_year").change(function () {
            var grade_year = $(this).val();
            var options = '<option value="">Select Grade</option>';
            $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL ?>admin/Scales/find_all_grade_by_year",
                data: {grade_year: grade_year},
                success: function (result) {
                    result = $.parseJSON(result);
                    for (var x in result) {
                        console.log(result[x].EmployeeGrade.name);
                        options += '<option value=' + '"' + result[x].EmployeeGrade.id + '">' + result[x].EmployeeGrade.name + '</option>'
                    }
                    $('.grade').html(options);
                }
            });
        });
    });
</script>