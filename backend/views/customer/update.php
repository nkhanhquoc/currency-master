<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Customer */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => 'Customer',
]) . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Customers'), 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update') . ' ' . $model->name;
?>
<div class="row customer-update">
    <div class="col-md-12">

    <?= $this->render('_form', [
        'model' => $model,
        'title' => $this->title
    ]) ?>

    </div>
</div>
