<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Customer */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Customer',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Customers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row customer-create">
    <div class="col-md-12">
        <?= $this->render('_form', [
            'model' => $model,
            'title' => $this->title
        ]) ?>
    </div>
</div>
