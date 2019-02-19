<?php
use awesome\backend\grid\AwsGridView;
use awesome\backend\widgets\AwsBaseHtml;
use yii\helpers\Html;
use yii\widgets\Pjax;
use backend\models\Currency;
use backend\models\Customer;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\ViewDebtSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Báo cáo Công nợ');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row debt-index">
    <div class="col-md-12">
        <div class="portlet light portlet-fit portlet-datatable bordered">
            <div class="portlet-title">
                                        <?php echo $this->render('_search', ['model' => $searchModel]); ?>
                                <div class="caption">
                    <i class="icon-layers font-green"></i>
                    <span class="caption-subject font-green sbold uppercase">
                        <?=  AwsBaseHtml::encode($this->title) ?>
                    </span>
                </div>
            </div>

            <div class="portlet-body">
                <div class="table-container">
                    <?php
                    Pjax::begin(['formSelector' => 'form', 'enablePushState' => false, 'id' => 'mainGridPjax']);
                    ?>
                    <?php if(sizeof($currentDebt) > 0 ):?>
                    <table class="table table-bordered table-striped">
                      <caption style="text-align: center;font-weight:bold">
                        Công nợ
                      </caption>
                      <tr style="background-color:">
                        <th style="text-align:center">Loại tiền</th>
                        <th style="text-align:center"><?= $beforeDate ?></th>
                        <th style="text-align:center"><?= $selectDate ?></th>
                      </tr>

                      <?php foreach($currentDebt as $debt):?>
                        <tr>
                          <td>
                            <?= Currency::findOne($debt['currency_id'])->code?>
                          </td>
                          <td>
                            <?= number_format($debt['ovalue'],2)?>
                          </td>
                          <td>
                            <?= number_format($debt['value'],2)?>
                          </td>
                        </tr>
                      <?php endforeach; ?>
                      <tr style="font-weight:bold">
                        <td>
                          Tổng
                        </td>
                        <td>
                          <?= number_format($totalOldDebt)?> VND
                        </td>
                        <td>
                          <?= number_format($totalDebt)?> VND
                        </td>
                      </tr>
                    </table>
                  <?php endif;?>
                    <div class="clearfix">

                      <h2>Chi tiết</h2>
                      <table class="table">
                        <tr>
                          <th>Khách hàng</th>
                          <th>Loại tiền </th>
                          <th>Số lượng </th>
                        </tr>
                        <?php foreach($currentDebtByCus as $k=> $debtCus):?>
                          <tr>
                            <td><?= Customer::findOne($debtCus['customer_id'])->name ?></td>
                            <td><?= Currency::findOne($debtCus['currency_id'])->code ?></td>
                            <td><?= number_format($debtCus['value'],3) ?></td>
                          </tr>
                        <?php endforeach;?>
                      </table>


                    </div>
                    <?php
                    Pjax::end();
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
