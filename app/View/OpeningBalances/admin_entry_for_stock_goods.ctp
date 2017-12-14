<h3 class="box-title" style="margin-left:10%"><i class="glyphicon glyphicon-edit"></i>  <?php echo __('Opening Balance for Stock Goods'); ?></h3>    
<div class="col-md-6 col-md-offset-1">
    <div class="table-responsive">
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <td>Goods  Name :</td>
                    <td colspan="2"><?php echo $this->Form->input('goods_name', array('name' => "data[OpeningBalances][goods_name][]", 'class' => 'form-control', 'label' => false, 'style' => 'width:100%')); ?></td>
                </tr>
                <tr>
                    <td>Goods Amount :</td>
                    <td colspan="2"><?php echo $this->Form->input('goods_amount', array('name' => "data[OpeningBalances][goods_amount][]", 'class' => 'form-control', 'label' => false, 'style' => 'width:100%')); ?></td>
                </tr>
                <tr>
                    <td>Market price :</td>
                    <td><?php echo $this->Form->input('goods_value', array('name' => "data[OpeningBalances][goods_value][]", 'class' => 'form-control', 'label' => false, 'style' => 'width:100%')); ?></td>
                    <td><button type="button">+</button></td>
                </tr>
            </tbody>
        </table>
    </div>
    <br>
</div>
