<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Admin Add Contructor Registration'); ?></h3>
                <div class="box-tools pull-right">
                    <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-th-large"></i> Contructor Registration List'), array('action' => 'index'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
                </div>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('ContructorName', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('name', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('owner_name', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('father_name', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('address', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('phone', array('type'=>'number','class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('alternative_phone', array('type'=>'number','class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('licence_no', array('type'=>'number','class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('licence_category_id', array('class' => 'form-control', 'empty' => array('' => '------ Please Select -------'))); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('licence_fee', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                    <?php echo $this->Form->input('enlisted_date', array('type' => 'text', 'class' => 'form-control datepicker', 'required' => true)); ?>
                </div>
                <!-- <div class="form-group">
                <?php echo $this->Form->input('user_id', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                <?php echo $this->Form->input('created_at', array('class' => 'form-control')); ?>
                </div>
                <div class="form-group">
                <?php echo $this->Form->input('updated_at', array('class' => 'form-control')); ?>
                </div> -->

                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>