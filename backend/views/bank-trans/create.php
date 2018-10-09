<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Transaction */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Transaction',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Transactions'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row transaction-create">
    <div class="col-md-12">
        <?= $this->render('_form', [
            'model' => $model,
            'title' => $this->title
        ]) ?>
    </div>
</div>
