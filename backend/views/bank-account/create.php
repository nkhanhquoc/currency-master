<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Currency */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Tài khoản',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Tài Khoản'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row currency-create">
    <div class="col-md-12">
        <?= $this->render('_form', [
            'model' => $model,
            'title' => $this->title
        ]) ?>
    </div>
</div>
