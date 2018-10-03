<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Bill */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Bill',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Bills'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row bill-create">
    <div class="col-md-12">
        <?= $this->render('_form', [
            'model' => $model,
            'title' => $this->title
        ]) ?>
        <?= $this->render('_modal', [
            'model' => $model,
        ]) ?>
    </div>
</div>

<script>
var listRefId = [];
</script>
