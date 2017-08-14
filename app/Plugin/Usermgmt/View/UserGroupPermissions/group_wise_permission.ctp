<div class="row">
    <div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> Group Wise Permission </h3>

			</div>	
			<div class="box-body">
				<?php echo $this->Form->create('UserGroupPermissions', array('role' => 'form','action'=>'groupWisePermission','url' =>array($groupId)) ); ?>
					<table id="Controller" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th class="text-center">Controller</th>
								<th class="text-center">Method</th>
							</tr>
						</thead>
						<tbody>
					<!--	<input type="hidden" name="user_group_id"  value=<?=$groupId?>>-->
						<?php foreach ($allControllers as $key => $val):?>

							<tr>

								<td class="text-center"><?php echo $val['controller']; ?></td>
								<td class="text-center">
									<?php foreach ($val['action'] as $akey =>$aval):?>

											<?php
											$checkboxVal=$val['controller'].':'.$aval;
											if(isset($allowedPermissions[$checkboxVal]))
											{
											?>
											<label style="width:45%"><?php echo $aval;?><input type="checkbox" name="check[<?=$checkboxVal;?>]"  value= <?=$checkboxVal;?> checked ></label>
											<?php
											}
											else
											{
											?>
											<label style="width:45%"><?php echo $aval;?><input type="checkbox" name="check[<?=$checkboxVal;?>]"  value= <?=$checkboxVal;?> ></label>
											<?php }?>

									<?php endforeach; ?>
								</td>
							</tr>

						<?php endforeach; ?>
						<tr align="center">
							<td colspan="2">

								<input type="submit" value="Set Permission" name="submit" class='btn btn-large btn-primary'>
							</td>
						</tr>
						</tbody>
					</table>
				<?php echo $this->Form->end(); ?>
			</div>			
		</div>
	</div>
</div>
