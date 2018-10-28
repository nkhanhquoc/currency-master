<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Bill */

$this->title = 'Cập nhật Vay mượn Quê: ' . $model->code;
$this->params['breadcrumbs'][] = ['label' => 'Vay mượn Quê', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'Cập nhật';
?>
<div class="bill-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'trans' => $trans
    ]) ?>

</div>
