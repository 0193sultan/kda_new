<div class="row">
    <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-header">
                <h3 class="box-title"><i class="glyphicon glyphicon-th-large"></i> <?php echo __('Annual Depriciation'); ?></h3>
            </div>

            <div class="box-body">
                <div class="search-box">
                    <?php
                        echo $this->Form->create('AnnualDepriciation', array('role' => 'form', 'action'=>'index'));
                    ?>
                    <table class="search">
                        <tbody>
                            <tr>
                                <td>
                                    <?php echo $this->Form->input('fiscal_year_id', array('label'=>'Fiscal Year :', 'name'=>'fiscal_year_id', 'class' => 'form-control', 'style' => 'width:450px', 'empty' => '---- Please Select ----', 'required')); ?>
                                </td>
                            </tr>                               
                            <tr align="center">
                                <td colspan="2">
                                    <button type="submit" class="btn btn-large btn-primary" name="search-btn"><i class="fa fa-search"></i> Search</button>
                                    <a href="<?php echo BASE_URL;?>admin/annual_depriciations" class="btn btn-warning"><i class="fa fa-refresh"></i> Reset</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>    
                    <?php echo $this->Form->end(); ?>
                </div>
                <?php if (!empty($annual_depriciations)): ?>
                    <div>
                      <table id="Departments" class="table table-bordered table-striped">
                        <thead>
                          <tr>
                            <th class="text-center"><?php echo 'id'; ?></th>
                            <th class="text-center"><?php echo 'Main Head Name'; ?></th>
                            <th class="text-center"><?php echo 'Sub Head Name'; ?></th>
                            <th class="text-center"><?php echo 'Depriciation Value'; ?></th>
                            <th class="text-center"><?php echo 'Fiscal Year'; ?></th>
                          </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($annual_depriciations as $annual_depriciation): ?>
                        <tr>
                          <td class="text-center"><?php echo h($annual_depriciation['AnnualDepriciation']['id']); ?></td>
                          <td class="text-center"><?php echo h($all_fixed_asset_head[$annual_depriciation['AnnualDepriciation']['parent_id']]); ?></td>
                          <td class="text-center"><?php echo h($annual_depriciation['AnnualDepriciation']['parent_id']==$annual_depriciation['AnnualDepriciation']['acc_head_list_id']?'':$all_fixed_asset_head[$annual_depriciation['AnnualDepriciation']['acc_head_list_id']]); ?></td>
                          <td class="text-center"><?php echo h($annual_depriciation['AnnualDepriciation']['depriciation_value']); ?></td>
                          <td class="text-center"><?php echo h($fiscalYears[$annual_depriciation['AnnualDepriciation']['fiscal_year_id']]); ?></td>
                        </tr>
                        <?php endforeach; ?>
                        </tbody>
                      </table>
                    </div>
                    <br>
                    <div>
                      <?php echo $this->Html->link(__('<i class="glyphicon glyphicon-pencil"></i>&nbsp;&nbsp;Edit'), array('action' => 'edit', $fiscal_year_id), array('class' => 'btn btn-primary btn-md pull-right', 'escape' => false, 'data-toggle'=>'tooltip', 'title' => 'edit')); ?>
                    </div>
                <?php endif ?>

            </div>

        </div>

        </div>
        
    </div>
</div>