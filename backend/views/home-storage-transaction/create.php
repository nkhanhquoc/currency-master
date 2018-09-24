<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\HomeStorageTransaction */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Home Storage Transaction',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Home Storage Transactions'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row home-storage-transaction-create">
    <div class="col-md-12">
        <?= $this->render('_form', [
            'model' => $model,
            'title' => $this->title
        ]) ?>
    </div>
</div>
