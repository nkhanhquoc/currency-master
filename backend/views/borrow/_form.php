  <?php
use kartik\datetime\DateTimePicker;
use awesome\backend\widgets\AwsBaseHtml;
use yii\widgets\ActiveForm;
use brussens\bootstrap\select\Widget as Select;
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
                        <?= $form->field($model, 'created_date')->textInput(['readonly'=>'readony']) ?>
                      </div>

                    </div>
                    <div class="row">
                      <div class="col-md-4">
                        <?= $form->field($model, 'customer_id')->widget(Select::className(), [
                            'options' => ['data-live-search' => 'true','title'=>'Chọn Khách hàng','onchange'=> new \yii\web\JsExpression('changeBillCode()')],
                            'items' => $model->getAllCustomer()
                        ]);
                        ?>
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
                      <h3 style="text-align:center">HÓA ĐƠN VAY MƯỢN</h3>
                    </div>
                    <table class="table table-striped table-condensed">
                      <tr>
                        <th class="text-center">      TT    </th>
                        <th class="text-center">      Ghi chú    </th>
                        <th class="text-center">      Giao dịch    </th>
                        <th class="text-center">      Loại Tiền   </th>
                        <th class="text-center">      Số Lượng    </th>
                        <th class="text-center"></th>
                      </tr>
                      <?php foreach($trans as $k => $tran):?>
                        <tr class="form-group">
                          <td style="display:none">
                            <input type="hidden" name="trans[id][]" value="<?=$tran->id ?>" />
                          </td>
                          <td name="trr-index">
                            <?= $k+1 ?>
                          </td>
                          <td>
                            <input name="trans[note][]" value="<?= $tran->note ?>" type="text" class="form-control"/>
                          </td>
                          <td>
                            <?= $form->field($tran, 'type')->dropDownList(
                              $tran->getAllBorrowType(),
                              ['name'=>'trans[type][]']
                              )->label(false)?>
                          </td>
                          <td>
                            <?= $form->field($tran, 'currency_id')->dropDownList(
                              $model->getStorageCurrency(),
                              ['name'=>'trans[currency_id][]']
                              )->label(false)?>
                          </td>
                          <td>
                            <input name="trans[quantity][]" onblur="changeTransValue(this)" value="<?= $tran->quantity ?>" class="form-control"/>
                          </td>

                          <?php if(!$model->is_export):?>
                          <td name="hide-on-print">
                            <button class="btn btn-danger" onclick="removeTrans(this);return false;"><i class="glyphicon glyphicon-remove"></i></button>
                          </td>
                        <?php endif;?>
                        </tr>
                      <?php endforeach;?>
                      <tr id="tr-sum" style="display:none">

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
            <div class="actions">
              <?php if(!$model->is_export):?>
                <?=  AwsBaseHtml::submitButton($model->isNewRecord ? Yii::t('backend', 'Create') : Yii::t('backend', 'Update'), ['class' => 'btn btn-transparent green btn-outline btn-circle btn-sm']) ?>
              <?php endif;?>

                <?php if(!$model->isNewRecord):?>
                <a href="/borrow/export?id=<?= $model->id ?>" class="btn btn-outline btn-circle btn-sm btn-primary">Xuất hóa đơn</a>
                <span onclick="window.print();return false;" class="btn btn-outline btn-circle btn-sm btn-success">Xem bản in</span>
              <?php endif;?>
                <button type="button" name="back" class="btn btn-transparent black btn-outline btn-circle btn-sm"
                        onclick="history.back(-1)">
                    <i class="fa fa-angle-left"></i> Back
                </button>
            </div>
        </div>
    </div>

<?php ActiveForm::end(); ?>

<script type="text/javascript">
var billcode = '<?php echo $model->code ?>';
billcode = billcode.split('-');
var index =0;
var optionCurrency = "";
<?php foreach($model->getStorageCurrency() as $k => $currency):?>
  optionCurrency += '<option value="<?php echo $k?>"><?php echo $currency?></option>';
<?php endforeach;?>
var trr = '<tr class="form-group"><td name="trr-index"></td>';
trr+= '<td>';
trr+= '<input name="trans[note][]" class="form-control"/>';
trr+= '</td>';
trr+= '<td>';
trr+=   '<select name="trans[type][]" class="form-control"> ';
trr+=     '<option value="5">Vay</option>';
trr+=     '<option value="6">Cho vay</option>';
trr+=     '<option value="11">Khách Đặt cọc</option>';
trr+=     '<option value="23">Cửa hàng Đặt cọc</option>';
trr+=   '</select>';
trr+=   '</td>';
trr+= '<td>';
trr+= '<select name="trans[currency_id][]" class="form-control">'+optionCurrency+'</select>';
trr+= '</td>';
trr+= '<td>';
trr+= '<input name="trans[quantity][]" class="form-control"/>';
trr+= '</td>';
trr+= '<td>';
trr+= '<button class="btn btn-danger" onclick="removeTrans(this);return false;"><i class="glyphicon glyphicon-remove"></i></button>';
trr+= '</td>';
trr+= '</tr>';

</script>
