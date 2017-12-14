<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Edit Depriciation Value'); ?></h3>
            </div>
            <div class="box-body">
                <?php echo $this->Form->create('AnnualDepriciation', array('role' => 'form')); ?>
                <div class="form-group">
                    <?php echo $this->Form->input('fiscal_year_id', array('id' => 'fiscal_year_id', 'class' => 'form-control', 'value' => $fiscal_year_id, 'disabled')); ?>
                    <span style="color:#d00">*</span>
                </div>
                <div class="row">
                    <h3 class="box-title" style="margin-left:10%"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Depriciation Value for Fix Assect'); ?></h3>
                    <div class="col-md-8 col-md-offset-1">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Head name</th>
                                        <th>Sub head name</th>
                                        <th>Deprication Value</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $i = 1;
                                    foreach ($data as $key => $value) {
                                        ?>
                                        <tr>
                                            <th scope="row"><?= $i ?></th>
                                            <td><?= $all_fixed_asset_head[$value['AnnualDepriciation']['parent_id']]; ?></td>
                                            <td><?= $value['AnnualDepriciation']['parent_id']==$value['AnnualDepriciation']['acc_head_list_id']?'':$all_fixed_asset_head[$value['AnnualDepriciation']['acc_head_list_id']]; ?></td>
                                            <td>
                                                <?php echo $this->Form->input('deprication_value', array('name' => "data[AnnualDepriciation][depriciation_value][]", 'class' => 'form-control', 'label' => false, 'style' => 'width:100%', 'value'=>$value['AnnualDepriciation']['depriciation_value'])); ?>
                                                <?php echo $this->Form->input('', array('type' => 'hidden', 'name' => "data[AnnualDepriciation][acc_head_list_id][]", 'class' => 'form-control', 'label' => false, 'value' => $value['AnnualDepriciation']['acc_head_list_id'])); ?>
                                                <?php echo $this->Form->input('', array('type' => 'hidden', 'name' => "data[AnnualDepriciation][parent_id][]", 'class' => 'form-control', 'label' => false, 'value' => $value['AnnualDepriciation']['parent_id'])); ?>
                                                <?php echo $this->Form->input('', array('type' => 'hidden', 'name' => "data[AnnualDepriciation][id][]", 'class' => 'form-control', 'label' => false, 'value' => $value['AnnualDepriciation']['id'])); ?>
                                            </td>
                                        </tr>
                                        <?php
                                        $i++;
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <br>
                <?php echo $this->Form->submit('Submit', array('class' => 'btn btn-large btn-primary')); ?>
                <?php echo $this->Form->end(); ?>
            </div>
        </div>
    </div>
</div>
