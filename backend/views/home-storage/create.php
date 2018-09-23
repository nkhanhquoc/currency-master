<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\HomeStorage */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Home Storage',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Home Storages'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row home-storage-create">
    <div class="col-md-12">
        <?= $this->render('_form', [
            'model' => $model,
            'title' => $this->title
        ]) ?>
    </div>
</div>
