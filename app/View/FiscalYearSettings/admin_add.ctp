<div class="row">
    <div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Fiscal Year Setting'); ?></h3>
				<div class="box-tools pull-right">
					<?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Fiscal Year Setting List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>
			<div class="box-body">		
			<?php echo $this->Form->create('FiscalYearSetting', array('role' => 'form')); ?>
					<div class="form-group">
						<?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control')); ?>
					</div>

			<!-- code by arafat  start-->

			<table id="FiscalYears" class="table table-bordered table-striped">
				<thead>
				<tr>
					<th>Sl</th>
					<th style="text-align: center;">Month</th>
					<th style="text-align: center;">Working Days</th>
				</tr>
				</thead>

				<tbody>

				<?php for($i = 1; $i<=12; $i++): ?> <!-- This need 12 times so here i use loop for my lazyness -->

				<tr>
					<td> <?=$i?> </td>
					<td>
						<div class="form-group">
							<?php echo $this->Form->input('month_id', array('name'=>'month_id[]','class' => 'form-control')); ?>
						</div>
					</td>
					<td>
						<div class="form-group">
							<?php echo $this->Form->input('working_day', array('name'=>'working_day[]', 'class' => 'form-control')); ?>
						</div>
					</td>
				</tr>

			<?php endfor; ?>

				</tbody>
				</table>

				<div>
					<?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary pull-right','style'=> 'margin-top: 26px')); ?>
				<?php echo $this->Form->end(); ?>
				</div>
			<!-- Code by arafat end -->
			</div>
		</div>			
	</div>
</div>