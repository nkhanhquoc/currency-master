<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Bill */

$this->title = Yii::t('backend', 'Lập {modelClass}', [
    'modelClass' => 'Hóa đơn Chuyển tiền',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Hóa đơn chuyển tiền'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row bill-create">
    <div class="col-md-12">
        <?= $this->render('_form', [
            'model' => $model,
            'title' => $this->title
        ]) ?>
    </div>
</div>
