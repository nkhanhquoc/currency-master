<?php
use kartik\date\DatePicker;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\HomeDailySearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="bill-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'post',
        'id'=>'home_daily_search_form'
    ]); ?>

    <?php echo $form->field($model, 'created_date')->widget(DatePicker::classname(), [
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
    <input type="hidden" name="excel" id="excel" value="<?= $isExcel ?>"/>

    <div class="form-group">
        <button class="btn btn-success">Tìm</button>
        <span class="btn btn-success" onclick="exportExcel()">Excel</span>
    </div>

    <?php ActiveForm::end(); ?>

</div>
