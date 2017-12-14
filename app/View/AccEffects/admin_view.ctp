<div class="row">
    <div class="col-xs-12">		
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title"><i class="glyphicon glyphicon-eye-open"></i> <?php  echo __('Acc Effect'); ?></h3>
				<div class="box-tools pull-right">
	                <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Acc Effect List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
				</div>
			</div>			
			<div class="box-body">
                <table id="AccEffects" class="table table-bordered table-striped">
					<tbody>
						<tr>		<td><strong><?php echo __('Id'); ?></strong></td>
		<td>
			<?php echo h($accEffect['AccEffect']['id']); ?>
			&nbsp;
		</td>
</tr><tr>		<td><strong><?php echo __('Acc Effect Head Name'); ?></strong></td>
		<td>
			<?php echo h($accEffect['AccEffect']['acc_effect_head_name']); ?>
			&nbsp;
		</td>
</tr>					</tbody>
				</table>
			</div>			
		</div>
			
	</div><!-- /#page-content .span9 -->

</div><!-- /#page-container .row-fluid -->
