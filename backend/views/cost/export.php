<?php

use yii\helpers\Html;
use kartik\datetime\DateTimePicker;
use awesome\backend\widgets\AwsBaseHtml;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Bill */

$this->title = "Chi phí";
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Chi phí'), 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update') . ' ' . $model->code;

?>
<div class="row bill-update">
    <div class="col-md-12">
<?php $form = ActiveForm::begin();?>
      <div class="portlet light portlet-fit portlet-form bordered bill-form">
          <div class="portlet-title">
              <div class="caption">
                  <i class="icon-paper-plane font-green"></i>
                  <span class="caption-subject font-green sbold uppercase">
                  <?=  $title ?>
                  </span>
              </div>
              <div class="actions">
                <?php if(!$model->is_export):?>
                  <?=  AwsBaseHtml::submitButton($model->isNewRecord ? Yii::t('backend', 'Create') : Yii::t('backend', 'Update'), ['class' => 'btn btn-transparent green btn-outline btn-circle btn-sm']) ?>
                <?php endif; ?>
                  <button type="button" name="back" class="btn btn-transparent black btn-outline btn-circle btn-sm"
                          onclick="history.back(-1)">
                      <i class="fa fa-angle-left"></i> Back
                  </button>
              </div>
          </div>

          <div class="portlet-body" id="bill-content">
              <div class="form-body">
                <?= $form->field($model, 'type')->hiddenInput(['value'=>$model->type])->label(false) ?>
                <table class="table" style="margin-bottom:0px">
                  <tr class="no-border">
                    <td style="width:50%">
                      <div class="row">
                        <div class="col-md-12">
                          <div class="input-group" >
                              <span class="input-group-addon">Ngày lập Hóa đơn:</span>
                              <input value="<?= $model->created_date ?>" disabled="disabled" type="text" class="form-control">
                          </div>
                        </div>
                      </div>
                    </td>
                    <td style="width:50%">
                      <div class="row">
                        <div class="col-md-12">
                          <div class="input-group" >
                            <span class="input-group-addon">Mã hóa đơn:</span>
                            <input value="<?= $model->code ?>" disabled="disabled" type="text" class="form-control">
                          </div>
                        </div>
                      </div>
                    </td>

                  </tr>

                </table>
                <table class="table">
                  <tr class="no-border">
                    <td>
                      <div class="row">
                        <div class="col-md-12">
                          <div class="input-group">
                            <span class="input-group-addon">Ghi chú:</span>
                            <input value="<?= $model->note ?>" disabled="disabled" type="text" class="form-control">
                          </div>
                        </div>
                      </div>
                    </td>
                  </tr>
                </table>

                <div class="row">
                  <h3 style="text-align:center">CHI PHÍ</h3>
                </div>
              <table class="table table-striped table-condensed">
                <tr>
                  <th class="text-center">      TT    </th>
                  <th class="text-center">      Ghi chú    </th>
                  <th class="text-center">      Giao dịch    </th>
                  <th class="text-center">      Loại Tiền   </th>
                  <th class="text-center">      Giá trị     </th>
                  <th class="text-center"></th>
                </tr>
                <?php foreach($trans as $k => $tran):?>
                  <tr class="form-group">
                    <td name="trr-index">
                      <?= $k+1 ?>
                    </td>
                    <td>
                      <input name="trans[note][]" value="<?= $tran->note ?>" disabled="disabled" type="text" class="form-control"/>
                    </td>
                    <td>
                      <?= $form->field($tran, 'TypeName')->textInput(['disabled'=>'disabled'])->label(false)?>
                    </td>
                    <td>
                      <?= $form->field($tran, 'CurrencyName')->textInput(['disabled'=>'disabled'])->label(false)?>
                    </td>
                    <td>
                      <input name="trans[quantity][]" disabled="disabled" value="<?= number_format($tran->quantity,2) ?>" class="form-control"/>
                    </td>
                  </tr>
                <?php endforeach;?>
                <tr id="tr-sum" style="">
                </tr>
                <tr>
                  <td class="text-center" colspan="3">
                    <span class="font-weight-bold"><b>Người chi</b></span>
                  </td>
                  <td class="text-center" colspan="2">
                    <span class="font-weight-bold"><b>Người lập</b></span>
                  </td>
                </tr>
              </table>
            </br>

              </div>



          </div>
          <div class="actions">

              <span onclick="printBill('bill-content')" class="btn btn-outline btn-circle btn-sm btn-primary">In hóa đơn</span>
              <button type="button" name="back" class="btn btn-transparent black btn-outline btn-circle btn-sm"
                      onclick="history.back(-1)">
                  <i class="fa fa-angle-left"></i> Back
              </button>
          </div>
      </div>
<?php ActiveForm::end(); ?>
    </div>
</div>
