<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\BillSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="bill-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'type') ?>

    <?= $form->field($model, 'code') ?>

    <?= $form->field($model, 'customer_id') ?>

    <?= $form->field($model, 'value') ?>

    <?php // echo $form->field($model, 'customer_type') ?>

    <?php // echo $form->field($model, 'note') ?>

    <?php // echo $form->field($model, 'receiver') ?>

    <?php // echo $form->field($model, 'deposit') ?>

    <?php // echo $form->field($model, 'created_date') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('backend', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('backend', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
