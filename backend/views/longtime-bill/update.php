<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Bill */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => 'Hóa đơn Dài Hạn',
]) . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Hóa đơn Dài Hạn'), 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update') . ' ' . $model->code;
?>
<div class="row bill-update">
    <div class="col-md-12">

    <?= $this->render('_form', [
        'model' => $model,
        'trans' => $trans,
        'title' => $this->title
    ]) ?>

    </div>
</div>
