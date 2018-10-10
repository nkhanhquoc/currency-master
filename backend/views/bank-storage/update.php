<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Storage */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => 'Số dư Tài khoản Ngân hàng',
]) . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Tài Khoản Ngân hàng'), 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update') . ' ' . $model->name;
?>
<div class="row storage-update">
    <div class="col-md-12">

    <?= $this->render('_form', [
        'model' => $model,
        'title' => $this->title
    ]) ?>

    </div>
</div>
