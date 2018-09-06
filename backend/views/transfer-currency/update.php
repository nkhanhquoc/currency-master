<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Bill */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => 'Bill',
]) . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Bills'), 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update') . ' ' . $model->id;
?>
<div class="row bill-update">
    <div class="col-md-12">

    <?= $this->render('_form', [
        'model' => $model,
        'title' => $this->title
    ]) ?>

    </div>
</div>
<script type="text/javascript">
var index =0;
var optionCurrency = "";
<?php foreach($model->getAllCurrency() as $k => $currency):?>
  optionCurrency += '<option value="<?php echo $k?>"><?php echo $currency?></option>';
<?php endforeach;?>
var trr = '<tr class="form-group"><td name="trr-index"></td>';
trr+= '<td>';
trr+=   '<select name="trans[type]" class="form-control"> ';
trr+=     '<option value="3">Nhận tiền chuyển</option>';
trr+=     '<option value="4">Trả tiền chuyển</option>';
trr+=   '</select>';
trr+=   '</td>';
trr+= '<td>';
trr+= '<select name="trans[currency_id]" class="form-control">'+optionCurrency+'</select>';
trr+= '</td>';
trr+= '<td>';
trr+= '<input name="trans[quantity]" type="number" min="0" class="form-control"/>';
trr+= '</td>';
trr+= '<td>';
trr+= '<input name="trans[fee]" type="number" min="0" class="form-control"/>';
trr+= '</td>';
trr+= '<td>';
trr+= '<button class="btn btn-danger" onclick="removeTrans(this);return false;"><i class="glyphicon glyphicon-remove"></i></button>';
trr+= '</td>';
trr+= '</tr>';

</script>
