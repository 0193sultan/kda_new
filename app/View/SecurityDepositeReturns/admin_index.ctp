<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Security Deposit Returns'); ?></h3>
				<div class="box-tools pull-right">
					<?php if($this->App->menu_permission('securityDepositeReturns','admin_add')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-plus"></i> New Security Deposite Return'), array('action' => 'add'), array('class' => 'btn btn-primary', 'escape' => false)); } ?>
				</div>
			</div>	
			<div class="box-body">
               <div class="search-box">
                    <table class="search">
                        <?php echo $this->Form->create('SecurityDepositeReturn', array('role' => 'form'));?>
                        <tr>
                            <td style="width: 30%"><strong class="pull-right">Project Name&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</strong></td>
                            <td style="width: 70%">
                            	<?php echo $this->Form->input('contructor_project_name_id', array('label' => false, 'class' => 'form-control contructor_project_name', 'empty'=>'---- Please Select ----')); ?>
                            	<?php echo $this->Form->input('project_name', array('type' => 'hidden', 'class' => 'form-control project_name')); ?>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 30%"><strong class="pull-right">Contructor Name&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</strong></td>
                            <td style="width: 70%">
                            	<?php echo $this->Form->input('contructor_name_id', array('class' => 'form-control contructor_name', 'empty'=>'---- Please Select ----', 'label'=>false)); ?>
                            	<?php echo $this->Form->input('contructor', array('type' => 'hidden', 'class' => 'form-control contructor')); ?>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 30%"><strong class="pull-right">Work Order No&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</strong></td>
                            <td style="width: 70%">
                            	<?php echo $this->Form->input('work_order_id', array('label' => false, 'class' => 'form-control work_order_id', 'empty'=>'---- Please Select ----', 'required')); ?>
                            </td>
                        </tr>
                        <tr>
                        	<td></td>
                        	<td>
                        		<input class="btn btn-large btn-primary" type="submit" value="Search">
                        	</td>
                        </tr>
                        <?php echo $this->Form->end();?>
                    </table>
                </div>
				<?php if (!empty($securityDepositeReturns)): ?>
				<button class="btn btn-primary pull-right" id="report_btn">Print</button>
				<div id="security_money_return_report">
					<h3 class="text-center">Khulna Development Authority</h3><br>
					<table class="table table-bordered table-striped">
						<tr>
							<td><strong>Project Name</strong></td>
							<td><?= $project_name; ?></td>
							<td><strong>Project Value</strong></td>
							<td><?= $project_value; ?></td>
						</tr>
						<tr>
							<td><strong>Contructor Name</strong></td>
							<td><?= $contructor; ?></td>
							<td><strong>Total Security Deposit</strong></td>
							<td><?= $total_security_money; ?></td>
						</tr>
						<tr>
							<td><strong>Work Order No</strong></td>
							<td><?= $securityDepositeReturns[0]['SecurityDepositeReturn']['work_order_no']; ?></td>
							<td><strong>Total Security Deposit Return</strong></td>
							<td>
								<?php
									$total_security_deposit_return = 0;
									foreach ($securityDepositeReturns as $key => $value) {
										$total_security_deposit_return += $value['SecurityDepositeReturn']['security_return_amount'];
									}
									echo sprintf('%0.2f', $total_security_deposit_return);
								?>
							</td>
						</tr>
					</table>
					<br>
	                <table id="SecurityDepositeReturns" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="text-center"><?php echo '#'; ?></th>
								<th class="text-center"><?php echo 'Work Order No'; ?></th>
								<th class="text-center"><?php echo 'Security Money Return'; ?></th>
								<th class="text-center"><?php echo 'Voucher No'; ?></th>
								<th class="text-center"><?php echo 'Payment Date'; ?></th>
								<th class="text-center"><?php echo 'Fiscal Year'; ?></th>
								<th width="120" class="text-center"><?php echo __('Actions'); ?></th>
							</tr>
						</thead>
						<tbody>
						<?php $i=0; ?>
						<?php foreach ($securityDepositeReturns as $securityDepositeReturn): ?>
						<tr>
							<td class="text-center"><?php echo ++$i; ?></td>
							<td class="text-center"><?php echo h($securityDepositeReturn['SecurityDepositeReturn']['work_order_no']); ?></td>
							<td class="text-center"><?php echo h($securityDepositeReturn['SecurityDepositeReturn']['security_return_amount']); ?></td>
							<td class="text-center"><?php echo h($securityDepositeReturn['SecurityDepositeReturn']['voucher_no']); ?></td>
							<td class="text-center"><?php echo h(date('d-m-Y', strtotime($securityDepositeReturn['SecurityDepositeReturn']['payment_date']))); ?></td>
							<td class="text-center">
								<?php echo $securityDepositeReturn['FiscalYear']['name']; ?>
							</td>
							<td class="text-center">
								<?php if($this->App->menu_permission('securityDepositeReturns','admin_view')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-eye-open"></i>'), array('action' => 'view', $securityDepositeReturn['SecurityDepositeReturn']['id']), array('class' => 'btn btn-primary btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'view')); } ?>
								<?php if($this->App->menu_permission('securityDepositeReturns','admin_edit')){ echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>'), array('action' => 'edit', $securityDepositeReturn['SecurityDepositeReturn']['id']), array('class' => 'btn btn-warning btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); } ?>
								<?php if($this->App->menu_permission('securityDepositeReturns','admin_delete')){ echo $this->Form->postLink(__('<i class="glyphicon glyphicon-trash"></i>'), array('action' => 'delete', $securityDepositeReturn['SecurityDepositeReturn']['id']), array('class' => 'btn btn-danger btn-xs', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'delete'), __('Are you sure you want to delete # %s?', $securityDepositeReturn['SecurityDepositeReturn']['id'])); } ?>
							</td>
						</tr>
						<?php endforeach; ?>
						</tbody>
					</table>
				</div>
				<?php endif ?>
			</div>			
		</div>
	</div>
</div>


<script>
    $(document).ready(function(){
        $('body').on('change', '.contructor_project_name', function(){
            $('.work_order_id').html('<option value="">---- Please Select ----</option>');
            var contructor_project_name_id = $(this).val();
            var project_name = $(this).find(':selected').text();
            $('.project_name').val(project_name);
             $.ajax({
                      url: '<?php echo BASE_URL.'admin/SecurityDepositeReturns/get_contructor_name_list' ?>',
                      'type': 'POST',
                      data: {contructor_project_name_id: contructor_project_name_id},
                      success: function(response){
                         var obj = jQuery.parseJSON(response);
                         $('.contructor_name option').remove();
                         for (var i = 0; i < obj.length; i++) {
                            optionList = '<option value="'+obj[i].WorkOrder.id+'">'+obj[i].ContructorName.name+'</option>';
                            $('.contructor_name').append(optionList);
                         }
                      }
                   });
        });

        $('body').on('change', '.contructor_name', function(){
            var contructor_project_name_id = $('.contructor_project_name').val();
            var contructor_name_id = $(this).val();
            var contructor = $(this).find(':selected').text();
            $('.contructor').val(contructor);
             $.ajax({
                      url: '<?php echo BASE_URL.'admin/SecurityDepositeReturns/get_work_order_no_list' ?>',
                      'type': 'POST',
                      data: {contructor_project_name_id: contructor_project_name_id,contructor_name_id: contructor_name_id},
                      success: function(response){
                         var obj = jQuery.parseJSON(response);
                         $('.work_order_id option').remove();
                         for (var i = 0; i < obj.length; i++) {
                            optionList = '<option value="'+obj[i].WorkOrder.id+'">'+obj[i].WorkOrder.name+'</option>';
                            $('.work_order_id').append(optionList);
                         }
                      }
                   });
        });

    });
</script>

<script>
	$(document).ready(function() {
		$('body').on('click', '#report_btn', function(){
			$('#security_money_return_report').print();
		});
	})
</script>