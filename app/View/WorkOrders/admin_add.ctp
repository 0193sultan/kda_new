<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Work Order'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Work Order List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('WorkOrder', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('contructor_project_name_id', array('class' => 'form-control', 'label' => 'Project Name :', 'empty' => array('' => '------ Please Select -------'))); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('contructor_name_id', array('class' => 'form-control', 'empty' => array('' => '------ Please Select -------'))); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('work_order_no', array('class' => 'form-control', 'empty' => array('' => '------ Please Select -------'))); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('fiscal_year_id', array('class' => 'form-control', 'empty' => array('' => '------ Please Select -------'))); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('work_order_date', array('type' => 'text', 'class' => 'form-control datepicker', 'required' => true)); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('work_order_details', array('class' => 'form-control')); ?>
                </div>
                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>