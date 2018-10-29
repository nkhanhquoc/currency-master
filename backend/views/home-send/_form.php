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
              <div class="row">
                <h3 style="text-align:center">GỬI QUÊ</h3>
              </div>
              <table class="table table-striped table-condensed">
                <tr>
                  <th class="text-center">      TT    </th>
                  <th class="text-center">      Ghi chú    </th>
                  <th class="text-center">      Loại tiền    </th>
                  <th class="text-center">      Số tiền    </th>
                  <th class="text-center"></th>
                </tr>
                <?php if($model->id != null):?>
                  <tr class="form-group">
                    <td style="display:none">
                      <?= $form->field($model, 'id')->hiddenInput()->label(false)?>
                    </td>
                    <td name="trr-index">
                      <?= $k+1 ?>
                    </td>
                    <td>
                      <?= $form->field($model, 'note')->textInput()->label(false)?>
                    </td>
                    <td>
                      <?= $form->field($model, 'currency_id')->dropDownList(
                        $model->getCurrencyId())->label(false) ?>
                    </td>

                    <td>
                      <?= $form->field($model, 'quantity')->textInput()->label(false)?>
                    </td>
                  </tr>
                <?php endif; ?>
                <tr id="tr-sum" style="">

                </tr>

              </table>
                <?php if($model->isNewRecord):?>
              <table class="table">
                <tr>
                  <td>
                    <button class="btn btn-primary" onclick="addTransaction();return false;" style="text-align:right"><i class="glyphicon glyphicon-add"></i>Thêm</button>
                  </td>
                </tr>
              </table>
            <?php endif;?>
            </div>
            <div class="actions">
                <?=  AwsBaseHtml::submitButton($model->isNewRecord ? Yii::t('backend', 'Create') : Yii::t('backend', 'Update'), ['class' => 'btn btn-transparent green btn-outline btn-circle btn-sm']) ?>


                <button type="button" name="back" class="btn btn-transparent black btn-outline btn-circle btn-sm"
                        onclick="history.back(-1)">
                    <i class="fa fa-angle-left"></i> Back
                </button>
            </div>
        </div>
    </div>

<?php ActiveForm::end(); ?>
<script type="text/javascript">
var index =0;
var optionCurrency = "";
<?php foreach($model->getCurrencyId() as $k => $currency):?>
  optionCurrency += '<option value="<?php echo $k?>"><?php echo $currency?></option>';
<?php endforeach;?>
var trr = '<tr class="form-group">';
trr+= '<td style="display:none"><input type="hidden" name="trans[id][]"/></td>';
trr+= '<td name="trr-index"></td>';

trr+= '<td>';
trr+= '<input name="trans[note][]" type="text" class="form-control"/>';
trr+= '</td>';
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
