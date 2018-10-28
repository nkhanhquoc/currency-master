<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Bill */

$this->title = 'Lập Hóa đơn vay mượn Quê';
$this->params['breadcrumbs'][] = ['label' => 'Hóa đơn', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bill-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
