<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Bill */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => 'Tiền chuyển khác',
]) . ' ' . $model->code;
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Tiền chuyển khác'), 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->code]];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update') . ' ' . $model->code;
?>
<div class="row bill-update">
    <div class="col-md-12">

    <?= $this->render('_form', [
        'model' => $model,
        'title' => $this->title,
        'trans' => $trans
    ]) ?>

    </div>
</div>
