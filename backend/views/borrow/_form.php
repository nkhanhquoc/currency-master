<?php
use kartik\datetime\DateTimePicker;
use awesome\backend\widgets\AwsBaseHtml;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Bill */
/* @var $title string */
/* @var $form AwsActiveForm */
?>

<?php  $form = ActiveForm::begin(); ?>

    <div class="portlet light portlet-fit portlet-form bordered bill-form">
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
                    <?= $form->field($model, 'type')->hiddenInput(['value'=>$model->type])->label(false) ?>
                    <div class="row">
                      <div class="col-md-6">
                        <?= $form->field($model, 'created_date')->widget(DateTimePicker::classname(), [
                            'language' => 'vi',
                            'readonly' => true,
                            'options'=>[
                              'value' => date("Y-m-d H:i:s"),
                            ],
                            'pluginOptions' => [
                                'autoclose'=>true,
                            ]

                        ])
                        ?>
                      </div>

                    </div>
                    <div class="row">
                      <div class="col-md-4">
                        <?= $form->field($model, 'customer_id')->dropDownList(
                          $model->getAllCustomer(),
                          ['prompt'=>'---Chọn Nhà Vàng----',
                            'onchange'=> new \yii\web\JsExpression('changeBillCode()')
                            ]
                          )?>
                      </div>

                      <div class="col-md-4">
                        <?= $form->field($model, 'code')->textInput(['maxlength' => 255,'readonly'=>'readonly','id'=>'bill_code']) ?>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <?= $form->field($model, 'note')->textArea(['maxlength' => 255]) ?>
                      </div>
                    </div>
                    <div class="row">
                      <h3 style="text-align:center">HÓA ĐƠN CHỐT</h3>
                    </div>
                    <table class="table table-striped table-condensed">
                      <tr>
                        <th class="text-center">      TT    </th>
                        <th class="text-center">      Giao dịch    </th>
                        <th class="text-center">      Loại Tiền   </th>
                        <th class="text-center">      Số Lượng    </th>
                        <th class="text-center">      Đơn giá    </th>
                        <th class="text-center"></th>
                      </tr>
                      <tr id="tr-sum" style="display:none">
                        <td colspan="5" style="font-weight:bold">
                          Tổng
                        </td>
                        <td id="sum-value">

                        </td>
                      </tr>

                    </table>
                    <table class="table">
                      <tr>
                        <td>
                          <button class="btn btn-primary" onclick="addTransaction();return false;" style="text-align:right"><i class="glyphicon glyphicon-add"></i>Thêm</button>
                        </td>
                      </tr>
                    </table>
            </div>
        </div>
    </div>

<?php ActiveForm::end(); ?>
