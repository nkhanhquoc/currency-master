<?php
use kartik\date\DatePicker;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ViewDebtSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="debt-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>
    <?= $form->field($model, 'date')->widget(DatePicker::classname(), [
        'language' => 'vi',
        'readonly' => true,
        'options'=>[
          'value' => date("Y-m-d"),
        ],
        'pluginOptions' => [
            'autoclose'=>true,
            'format' => 'yyyy-mm-dd'
        ]

    ])
    ?>

    <?= $form->field($model, 'customer_id')->dropDownList($model->getAllCustomer()) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('backend', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('backend', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
