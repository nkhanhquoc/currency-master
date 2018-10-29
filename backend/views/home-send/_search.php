<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\HomeStorageTransSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="home-storage-transaction-search ">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>



    <div class="form-group">
      <div class="col-md-6 ">
        <lablel class="control-label">Từ ngày</lablel>
    <?= yii\jui\DatePicker::widget([
                            'name' => 'HomeStorageTransSearch[created_time_from]',
                            'dateFormat' => 'php:Y-m-d',
                            'language' => 'vi',
                            'value' => \yii\helpers\Html::encode($model->fromTime),
                            'options' => [
                                'readonly' => 'readonly',
                                'class' =>'form-control',
                                'z-index'=>1000
                            ],
                        ]) ?>
      </div>
      <div class="col-md-6">
        <lablel class="control-label">Đến ngày</lablel>
    <?=
                        yii\jui\DatePicker::widget([
                            'name' => 'HomeStorageTransSearch[created_time_to]',
                            'dateFormat' => 'php:Y-m-d',
                            'language' => 'vi',
                            'value' => \yii\helpers\Html::encode($model->toTime),
                            'options' => [
                                'readonly' => 'readonly',
                                'class' =>'form-control'
                            ],
                        ])
                        ?>
      </div>
    </div>
    <div class="form-group">
      <?= $form->field($model, 'currency_id')->dropDownList($model->getCurrencyId(),['prompt'=>'---Loại tiền---']) ?>
    </div>



    <div class="form-group">
        <?= Html::submitButton(Yii::t('backend', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('backend', 'Reset'), ['class' => 'btn btn-default']) ?>

        <?= Html::a(Yii::t('backend', 'Thêm Giao dịch'),
            ['create'], ['class' => 'btn btn-transparent green btn-outline']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
