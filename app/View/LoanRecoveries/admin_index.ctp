<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Loan Recoveries'); ?></h3>
            </div>

            <div class="box-body">
                <div class="search-box">
                    <?php
                        echo $this->Form->create('LoanRecoveries', array('role' => 'form', 'action'=>'index'));
                    ?>
                    <table class="search">
                        <tbody>
                            <tr>
                                <td>
                                    <?php echo $this->Form->input('loan_name_id', array('class' => 'form-control loan_name_id', 'style' => 'width:200px', 'empty' => 'All', 'options' => $loan_list)); ?>
                                </td>
                                <td>
                                    <?php echo $this->Form->input('department_name_id', array('class' => 'form-control department_name_id', 'style' => 'width:200px', 'empty' => 'All', 'options' => $department_list)); ?>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <?php echo $this->Form->input('employee_name_id', array('class' => 'form-control employee_name_id', 'style' => 'width:200px', 'empty' => 'All')); ?>
                                </td>
                            </tr>                               
                            <tr align="center">
                                <td colspan="2">
                                    <button type="submit" class="btn btn-large btn-primary" name="search-btn"><i class="fa fa-search"></i> Search</button>
                                    <a href="<?php echo BASE_URL;?>admin/loan_recoveries" class="btn btn-warning"><i class="fa fa-refresh"></i> Reset</a>
                                </td>                       
                            </tr>
                        </tbody>
                    </table>    
                    <?php echo $this->Form->end(); ?>
                </div>
            </div>

            <?php if (!empty($employee_loan_info)): ?>

                <table id="Employees" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th class="text-center"><?php echo 'Sl'; ?></th>
                            <th class="text-center"><?php echo 'Employee Name'; ?></th>
                            <th class="text-center"><?php echo 'Designation'; ?></th>
                            <th class="text-center"><?php echo 'Department'; ?></th>
                            <th class="text-center"><?php echo 'Loan Name'; ?></th>
                            <th class="text-center"><?php echo 'Loan Type'; ?></th>
                            <th class="text-center"><?php echo 'Loan Starting Date'; ?></th>
                            <th class="text-center"><?php echo 'Interest Rate'; ?></th>
                            <th class="text-center"><?php echo 'Total Loan Amount'; ?></th>
                            <th class="text-center"><?php echo 'Recovery Loan Amount'; ?></th>
                            <th class="text-center"><?php echo 'Status'; ?></th>
                            <th class="text-center"><?php echo 'Due Loan'; ?></th>
                            <th width="120" class="text-center"><?php echo __('Actions'); ?></th>             </tr>
                    </thead>

                    <tbody>
                        <?php
                        $sl = 1;
                        foreach ($employee_loan_info as $value): ?>
                            <tr>
                                <td class="text-center"><?php echo $sl; ?></td>
                                <td class="text-center"><?php echo h($value['Employee']['employee_name_bengali']); ?></td>
                                <td class="text-center"><?php echo h($designation_list[$value['Employee']['designation_id']]); ?></td>
                                <td class="text-center"><?php echo h($department_list[$value['Employee']['department_id']]); ?></td>
                                <td class="text-center"><?php echo h($value['Loan']['name']); ?></td>
                                <td class="text-center"><?php echo h($value['LoanType']['name']); ?></td>
                                <td class="text-center"><?php echo h(date('d-m-Y', strtotime($value['EmployeeLoan']['loan_approved_date']))); ?></td>
                                <td class="text-center"><?php echo h($value['LoanType']['interest_rate']); ?></td>
                                <td class="text-center"><?php echo h($value['EmployeeLoan']['loan_amount']); ?></td>
                                <td class="text-center"><?php echo h($value['EmployeeLoan']['installment_amount']); ?></td>
                                <td class="text-center"><?php echo h($value['EmployeeLoan']['status']==1?'Active':'Inactive'); ?></td>
                                <td class="text-center"><?php echo h($value['EmployeeLoan']['current_due']); ?></td>
                                <td class="text-center">
                                    <?php
                                        echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'loan_recovery_details', $value['EmployeeLoan']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle' => 'tooltip', 'title' => 'view'));
                                    ?>
                                </td>
                            </tr>
                        <?php $sl++; 
                        endforeach; ?>
                    </tbody>
                </table>

              <?php endif ?>

        </div>
    </div>
</div>



<script>
   $(document).ready(function(){

        $('body').on("change", ".department_name_id", function(){
         var department_name_id = $('.department_name_id').val();
            
         $.ajax({
                  url: '<?php echo BASE_URL.'admin/LoanRecoveries/get_employee_name_list' ?>',
                  'type': 'POST',
                  data: {department_name_id: department_name_id},
                  success: function(response){
                     var obj = jQuery.parseJSON(response);
                     $('.employee_name_id option').remove();
                     for (var i = 0; i < obj.length; i++) {
                        optionList = '<option value="'+obj[i].Employee.id+'">'+obj[i].Employee.name+'</option>';
                        $('.employee_name_id').append(optionList);
                     }
                  }
               });

        });

    });
</script>