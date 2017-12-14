<?php
$total = 0;
//pr($salarySheets);
foreach ($salarySheets as $v) {
    foreach ($v as $va) {
        foreach ($va as $value) {
            $total += $value;
        }
    }
}
$emp_bonus=!empty($EmployeeBonus[0][0]['bonus_amount'])?$EmployeeBonus[0][0]['bonus_amount']:0;
$total = $total + $emp_bonus;
?>

<div class="box-body">
    <!-- search Start -->

    <?php
    echo $this->Form->create(false, array(
        'url' => array('controller' => 'IndividualSallarySummarySheets', 'action' => 'admin_index'),
        'id' => 'admin_index'
    ));
    ?>

    <table class="table table-bordered" style="width: 40%;" align="center">
        <tr>
            <td>Fiscal year</td>
            <td>
                <select style="width:200px;" class="form-control" name="fiscal_year_id" id="fiscal_year_id" style="width: 110px" required>
                    <?php
                    echo '<option value="">---- Please Select ----</option>';
                    foreach ($fiscalyears as $key => $value) {
                        echo "<option value=$key>$value</option>";
                    }
                    ?>
                </select>
            </td>
        </tr>

        <tr>
            <td>Start Month</td>
            <td>
                <select style="width:200px;" class="form-control" name="month_id_start" id="month_id_start" style="width: 110px" required>
                    <?php
                    echo '<option value="">---- Please Select ----</option>';
                    foreach ($months as $key => $value) {
                        echo "<option value=$key>$value</option>";
                    }
                    ?>
                </select>
            </td>
        </tr>

        <tr>
            <td>End Month</td>
            <td>
                <select style="width:200px;" class="form-control" name="month_id_end" id="month_id_end" style="width: 110px" required>
                    <?php
                    echo '<option value="">---- Please Select ----</option>';
                    foreach ($months as $key => $value) {
                        echo "<option value=$key>$value</option>";
                    }
                    ?>
                </select>
            </td>
        </tr>

        <tr>
            <td>Department</td>
            <td>
                <?php echo $this->Form->input('department_name_id', array('label' => false, 'class' => 'form-control department_name_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----', 'options' => $department_list)); ?>
            </td>
        </tr>

        <tr>
            <td>Employee</td>
            <td>
                <?php echo $this->Form->input('employee_name_id', array('label' => false, 'class' => 'form-control employee_name_id', 'style' => 'width:200px', 'empty' => '---- Please Select ----')); ?>
            </td>
        </tr>

        <tr>
            <td></td>
            <td>
                <input type="submit" name="btn" id="btn" value="search" class="btn btn-primary"></td>
        </tr>
    </table>

    <?php echo $this->Form->end(); ?>

</div>
<!-- Search End -->
<?php if (!empty($fYear)) { ?>
    <div id="print_me">

        <h3 class="text-success text-center"> Showing result Between <?= $month_start[0]['Month']['name']; ?>  to  <?= $month_end[0]['Month']['name']; ?> of Fiscal year <?= $fYear[0]['FiscalYear']['name']; ?> </h3>

        <table class="table table-bordered table-striped" width="100%">
            <tr>
                <td>Name :</td>
                <td><?= $employee_name_list[$employee_name_id]; ?></td>
            </tr>
            <tr>
                <td>Designation :</td>
                <td><?= $employee_info['Designation']['name']; ?></td>
            </tr>
            <tr>
                <td>Department :</td>
                <td><?= $department_list[$department_name_id]; ?></td>
            </tr>
        </table>


        <table id="" class="table table-bordered table-striped">

            <tr>
                <td>Basic</td>
                <td><?= $salarySheets[0][0]['basic_salary']; ?></td>
                <td>GPF Subscription</td>
                <td><?= $salarySheets[0][0]['gpf']; ?></td>
            </tr>

            <tr>
                <td>P.P</td>
                <td><?= $salarySheets[0][0]['pp']; ?></td>
                <td>CPF Subscription</td>
                <td><?= '0.00'; ?></td>
            </tr>

            <tr>
                <td>Medical</td>
                <td><?= $salarySheets[0][0]['medical']; ?></td>
                <td>House recovery</td>
                <td><?= $salarySheets[0][0]['house_loan_recovery']; ?></td>
            </tr>

            <tr>
                <td>Cycle</td>
                <td><?= $salarySheets[0][0]['cycle']; ?></td>
                <td>Vehicle</td>
                <td><?= $salarySheets[0][0]['vechcale_recovery']; ?></td>
            </tr>

            <tr>
                <td>HRent</td>
                <td><?= $salarySheets[0][0]['house_rent']; ?></td>
                <td>Telephone</td>
                <td><?= $salarySheets[0][0]['telephone_recovery']; ?></td>
            </tr>

            <tr>
                <td>Tiffin</td>
                <td><?= $salarySheets[0][0]['tiffin']; ?></td>
                <td>G.P.F Loan</td>
                <td><?= $salarySheets[0][0]['gpf_loan']; ?></td>
            </tr>

            <tr>
                <td>Education</td>
                <td><?= $salarySheets[0][0]['education']; ?></td>
                <td>Motor cycle Adv</td>
                <td><?= $salarySheets[0][0]['motorcycle_loan']; ?></td>
            </tr>

            <tr>
                <td>Charges</td>
                <td><?= $salarySheets[0][0]['charge']; ?></td>
                <td>Cycle Adv</td>
                <td><?= $salarySheets[0][0]['bicycle_loan']; ?></td>
            </tr>

            <tr>
                <td>Convence</td>
                <td><?= $salarySheets[0][0]['convance']; ?></td>
                <td>House building Adv</td>
                <td><?= $salarySheets[0][0]['house_build_recovery']; ?></td>
            </tr>

            <tr>
                <td>Washing</td>
                <td><?= $salarySheets[0][0]['wash']; ?></td>
                <td>House repair Adv</td>
                <td><?= $salarySheets[0][0]['house_repair_reovery']; ?></td>
            </tr>

            <tr>
                <td>Mobile</td>
                <td><?= $salarySheets[0][0]['mobile']; ?></td>
                <td>Computer loan</td>
                <td><?= $salarySheets[0][0]['computer_loan']; ?></td>
            </tr>

            <tr>
                <td>Others</td>
                <td><?= $salarySheets[0][0]['other']; ?></td>
                <td>Motor car loan</td>
                <td><?= $salarySheets[0][0]['car_loan']; ?></td>
            </tr>

            <tr>
                <td>Day A</td>
                <td><?= $salarySheets[0][0]['da']; ?></td>
                <td>Loan8</td>
                <td><?= 0; ?></td>
            </tr>

            <tr>
                <td>Bonus</td>
                <td><?= !empty($EmployeeBonus[0][0]['bonus_amount'])?$EmployeeBonus[0][0]['bonus_amount']:0; ?> </td>
                <td>Loan9</td>
                <td><?= 0; ?></td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>Electricity</td>
                <td><?= $salarySheets[0][0]['electricity_recovery']; ?></td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>Water Sup</td>
                <td><?= $salarySheets[0][0]['water_supply_recovery']; ?></td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>Fixed House rent</td>
                <td><?= $salarySheets[0][0]['fixed_house_rent_recovery']; ?></td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>Group Insurance</td>
                <td><?= $salarySheets[0][0]['group_insurance_sum']; ?></td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>Health Insurance</td>
                <td><?= $salarySheets[0][0]['health_insurance']; ?></td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>Benevolent Fund</td>
                <td><?= $salarySheets[0][0]['bf_recovery']; ?></td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>Others Sub</td>
                <td><?= $salarySheets[0][0]['other_sub']; ?></td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>Tin Shed</td>
                <td><?= $salarySheets[0][0]['tin_shade_recovery']; ?></td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>Penalty</td>
                <td></td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>Tax</td>
                <td><?= $salarySheets[0][0]['tax']; ?></td>
            </tr>

            <tr>
                <td><strong class="pull-right">Total :</strong></td>
                <td><strong class="total_allowance"><?= $salarySheets[0][0]['gross_pay']; ?></strong></td>
                <td><strong class="pull-right">Total :</strong></td>
                <td><strong class="total_recovery"><?= $salarySheets[0][0]['total_payable']; ?></strong></td>
            </tr>

            <tr>
                <td><strong class="pull-right">Net Pay :</strong></td>
                <td colspan="3"><strong><span class="total_net_pay"></span>&nbsp;TK&nbsp;(<span class="net_pay_words"></span>)&nbsp;Only</strong></td>
            </tr>

        </table>

    </div>

    <p class="pull-right btn btn-primary" id="print">Print</p>
    <script type="text/javascript">
        $('#print').click(function () {
            $("#print_me").print();
        });
    </script>

<?php } ?>

<script>
    $(document).ready(function () {
        var total_net_pay = parseFloat($('.total_allowance').text()) - parseFloat($('.total_recovery').text());
        $('.total_net_pay').text(total_net_pay);

        $('.net_pay_words').text(toWords(total_net_pay));
    });

    var th = ['', 'thousand', 'million', 'billion', 'trillion'];
    var dg = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
    var tn = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'];
    var tw = ['twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];

    function toWords(s) {
        s = s.toString();
        s = s.replace(/[\, ]/g, '');
        if (s != parseFloat(s))
            return 'not a number';
        var x = s.indexOf('.');
        if (x == -1)
            x = s.length;
        if (x > 15)
            return 'too big';
        var n = s.split('');
        var str = '';
        var sk = 0;
        for (var i = 0; i < x; i++) {
            if ((x - i) % 3 == 2) {
                if (n[i] == '1') {
                    str += tn[Number(n[i + 1])] + ' ';
                    i++;
                    sk = 1;
                } else if (n[i] != 0) {
                    str += tw[n[i] - 2] + ' ';
                    sk = 1;
                }
            } else if (n[i] != 0) {
                str += dg[n[i]] + ' ';
                if ((x - i) % 3 == 0)
                    str += 'hundred ';
                sk = 1;
            }
            if ((x - i) % 3 == 1) {
                if (sk)
                    str += th[(x - i - 1) / 3] + ' ';
                sk = 0;
            }
        }
        if (x != s.length) {
            var y = s.length;
            str += 'point ';
            for (var i = x + 1; i < y; i++)
                str += dg[n[i]] + ' ';
        }
        return str.replace(/\s+/g, ' ');
    }

</script>


<script>
    $(document).ready(function () {

        $('body').on("change", ".department_name_id", function () {
            var department_name_id = $('.department_name_id').val();

            $.ajax({
                url: '<?php echo BASE_URL . 'admin/IndividualSallarySummarySheets/get_employee_name_list' ?>',
                'type': 'POST',
                data: {department_name_id: department_name_id},
                success: function (response) {
                    var obj = jQuery.parseJSON(response);
                    $('.employee_name_id option').remove();
                    for (var i = 0; i < obj.length; i++) {
                        optionList = '<option value="' + obj[i].Employee.id + '">' + obj[i].Employee.name + '</option>';
                        $('.employee_name_id').append(optionList);
                    }
                }
            });

        });

    });
</script>

