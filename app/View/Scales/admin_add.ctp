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
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Increment'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Increment List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('Scale', array('role' => 'form')); ?>
                <!-- <div class="form-group">
                <?php echo $this->Form->input('employee_grade_id', array('class' => 'form-control')); ?>
                </div> -->
                <div class="form-group">
                    <?php echo $this->Form->input('employee_grade_year', array('class' => 'form-control grade_year', 'name' => 'data[grade][grade_year]', 'options' => $grade_declare_year)); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('employee_grade_id', array('class' => 'form-control grade', 'options' => array('' => "select Grade Declare year first"))); ?>
                </div>
                <p style=" margin-left:22%" id="grade_basic">
                </p>
                <div class="form-group">
                    <?php echo $this->Form->input('grade_basic', array('class' => 'form-control grade_basic')); ?>
                </div>
                <div id="show_error" class="col-sm-offset-3" style=" margin-bottom: 10px"></div>
                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        // console.log(isInArray(1, [1, 2, 3]));
        $('#grade_basic').hide();
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
                        options += '<option value=' + '"' + result[x].EmployeeGrade.id + '">' + result[x].EmployeeGrade.name + '</option>'
                    }
                    $('.grade').html(options);
                }
            });
            $(".grade").change(function () {
                var employee_grade_id = $(this).val();
                $.ajax({
                    type: "POST",
                    url: "<?php echo BASE_URL ?>admin/Scales/get_grade_basic_for_indivisual_grade",
                    data: {employee_grade_id: employee_grade_id},
                    success: function (result) {
                        result = $.parseJSON(result);
                        if (result == '[]') {
                            $('#grade_basic').hide();
                        } else {
                            var y = new Array();
                            for (var x in result) {
                                y.push(result[x].Scale.grade_basic);
                            }
                            console.log(y);
                            $('#grade_basic').show();
                            $('#grade_basic').html(y.join());
                            $.fn.delayKeyup = function (callback, ms) {
                                var timer = 0;
                                var el = $(this);
                                $(this).keyup(function () {
                                    clearTimeout(timer);
                                    timer = setTimeout(function () {
                                        callback(el);
                                    }, ms);
                                });
                                return $(this);
                            };
                            function checkGradeScale() {
                                var grade_val = $('.grade_basic').val();
                                //console.log(y);
                                /* if (y.indexOf(String(grade_val))) {
                                 $(':input[type="submit"]').prop('disabled', false);
                                 $('#show_error').hide();
                                 } else {
                                 $(':input[type="submit"]').prop('disabled', true);
                                 $('#show_error').show();
                                 $('#show_error').text('This Grade Basic already exist!').css("color", "red");
                                 ;
                                 //alert('This value already exist!');
                                 }
                                 */
                                for (var i = 0; i < y.length; i++) {
                                    a = parseInt(y[i]);
                                    b = parseInt(grade_val);
                                    if (a == b) {
                                        $(':input[type="submit"]').prop('disabled', true);
                                        $('#show_error').show();
                                        $('#show_error').text('This Grade Basic already exist!').css("color", "red");
                                        break;
                                    } else {

                                        $(':input[type="submit"]').prop('disabled', false);
                                        $('#show_error').hide();
                                        //alert('This value already exist!');
                                    }
                                }

                            }
                            $('.grade_basic').delayKeyup(function (el) {
                                checkGradeScale();
                            }, 1000);


                        }
                    }
                });
            });
        });
    });
</script>