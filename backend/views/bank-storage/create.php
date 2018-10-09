<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Storage */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Storage',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Storages'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row storage-create">
    <div class="col-md-12">
        <?= $this->render('_form', [
            'model' => $model,
            'title' => $this->title
        ]) ?>
    </div>
</div>
