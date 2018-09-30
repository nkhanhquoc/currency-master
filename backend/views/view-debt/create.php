<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Debt */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Debt',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Debts'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row debt-create">
    <div class="col-md-12">
        <?= $this->render('_form', [
            'model' => $model,
            'title' => $this->title
        ]) ?>
    </div>
</div>
