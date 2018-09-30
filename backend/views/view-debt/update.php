<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Debt */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => 'Debt',
]) . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Debts'), 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update') . ' ' . $model->id;
?>
<div class="row debt-update">
    <div class="col-md-12">

    <?= $this->render('_form', [
        'model' => $model,
        'title' => $this->title
    ]) ?>

    </div>
</div>
