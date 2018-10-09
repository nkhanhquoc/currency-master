<?php

use awesome\backend\widgets\AwsBaseHtml;
use awesome\backend\form\AwsActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Storage */
/* @var $title string */
/* @var $form AwsActiveForm */
?>

<?php  $form = AwsActiveForm::begin(); ?>

    <div class="portlet light portlet-fit portlet-form bordered storage-form">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-paper-plane font-green"></i>
                <span class="caption-subject font-green sbold uppercase">
                <?=  $title ?>
                </span>
            </div>
            <div class="actions">
                <?=  AwsBaseHtml::submitButton($model->isNewRecord ? Yii::t('backend', 'Create') : Yii::t('backend', 'Update'), ['class' => 'btn btn-transparent green btn-outline btn-circle btn-sm']) ?>
                <button type="button" name="back" class="btn btn-transparent black btn-outline btn-circle btn-sm"
                        onclick="history.back(-1)">
                    <i class="fa fa-angle-left"></i> Back
                </button>
            </div>
        </div>
        <div class="portlet-body">
            <div class="form-body">
                    <?= $form->field($model, 'name')->textInput(['maxlength' => 255]) ?>

    <?= $form->field($model, 'quantity')->textInput() ?>

    <?= $form->field($model, 'currency_id')->textInput(['maxlength' => 20]) ?>

    <?= $form->field($model, 'date')->textInput() ?>

    <?= $form->field($model, 'type')->textInput() ?>

            </div>
        </div>
    </div>

<?php AwsActiveForm::end(); ?>
