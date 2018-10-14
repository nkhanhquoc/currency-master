<?php


use awesome\backend\grid\AwsGridView;
use awesome\backend\widgets\AwsBaseHtml;
use yii\helpers\Html;
use yii\widgets\Pjax;
use backend\models\Currency;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\ViewDebtSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Báo cáo lời lãi');
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
                            <?= number_format($debt['ovalue'])?>
                          </td>
                          <td>
                            <?= number_format($debt['value'])?>
                          </td>
                        </tr>
                      <?php endforeach; ?>
                    </table>
                    <div class="clearfix">

                    </div>
                    <table class="table table-bordered table-striped">
                      <caption style="text-align: center;font-weight:bold">
                        Tồn kho
                      </caption>
                      <th style="text-align:center">Loại tiền</th>
                      <th style="text-align:center"><?= $beforeDate ?></th>
                      <th style="text-align:center"><?= $selectDate ?></th>
                      <?php foreach($currentSt as $st):?>
                        <tr>
                          <td>
                            <?= Currency::findOne($st['currency_id'])->code?>
                          </td>
                          <td>
                            <?= number_format($st['oquantity'],1)?>
                          </td>
                          <td>
                            <?= number_format($st['quantity'],1)?>
                          </td>
                        </tr>
                      <?php endforeach; ?>
                    </table>

                    <table class="table table-bordered table-striped">
                      <caption style="text-align: center;font-weight:bold">
                        Tổng lời lãi
                      </caption>
                      <tr>
                        <th style="text-align:center">
                          Tổng công nợ
                        </th>
                        <th style="text-align:center">
                          Tổng Tồn kho
                        </th>
                        <th style="text-align:center">
                          Tổng
                        </th>
                      </tr>
                      <tr>
                        <td style="font-weight:bold">
                          <?= number_format($totalDebt)?>
                        </td>
                        <td style="font-weight:bold">
                          <?= number_format($totalSt)?>
                        </td>
                        <td style="font-weight:bold">
                          <?= number_format($totalSt+$totalDebt)?> VND
                        </td>
                      </tr>

                    </table>


                    <?php
                    Pjax::end();
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
