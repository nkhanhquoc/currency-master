<?php
use kartik\date\DatePicker;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\CustomerDailySearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="bill-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'post',
    ]); ?>

    <?= $form->field($model, 'customer_id')->dropDownList($model->getAllCustomer()) ?>
<div class="col-md-6">
    <?= $form->field($model, 'created_from')->widget(DatePicker::classname(), [
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
</div>
<div class="col-md-6">
    <?= $form->field($model, 'created_to')->widget(DatePicker::classname(), [
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
</div>
    <div class="form-group">
        <?= Html::submitButton(Yii::t('backend', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('backend', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
