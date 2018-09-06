<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Currency */

$this->title = Yii::t('backend', 'Cập nhật {modelClass}: ', [
    'modelClass' => 'Hàng Hóa',
]) . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Hàng Hóa'), 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update') . ' ' . $model->name;
?>
<div class="row currency-update">
    <div class="col-md-12">

    <?= $this->render('_form', [
        'model' => $model,
        'title' => $this->title
    ]) ?>

    </div>
</div>
