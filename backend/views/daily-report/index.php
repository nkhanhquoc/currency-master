<?php


use awesome\backend\grid\AwsGridView;
use awesome\backend\widgets\AwsBaseHtml;
use yii\helpers\Html;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\DailyReportSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Báo cáo hàng ngày Cửa hàng');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row transaction-index">
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

                    <table class="table table-bordered">
                      <tr class="list-group-item-success">
                        <th>Khách hàng </th>
                        <th>Ghi Chú </th>
                        <th>Loại GD </th>
                        <th>Loại Tiền  </th>
                        <th>Số Lượng</th>
                        <th>Tỉ giá</th>
                        <th>Thành tiền</th>
                        <th>Phí</th>
                        <th>Ngày</th>
                      </tr>
                      <?php $billArr = [];?>
                      <?php foreach($dataProvider->getModels() as $data):?>
                        <?php if(!in_array($data->bill_id,$billArr)):?>
                          <?php $billArr[] = $data->bill_id; $bill = $data->getBill();?>
                          <tr class="list-group-item-info" style="font-weight:bold">
                            <td colspan="2">
                              <?= count($billArr).'.'.$bill->code ?>
                            </td>
                            <td colspan="7">

                            </td>
                          </tr>
                        <?php endif;?>
                        <tr>
                          <td>
                            <?= $bill->getCustomer() ?>
                          </td>
                          <td>
                            <?= $data->note ?>
                          </td>
                          <td>
                            <?= $data->getTypeName() ?>
                          </td>
                          <td>
                            <?= $data->getCurrencyName() ?>
                          </td>
                          <td>
                            <?= number_format($data->quantity,2) ?>
                          </td>
                          <td>
                            <?= $data->exchange_rate ?>
                          </td>
                          <td>
                              <?php if($bill->type == 6):?>
                            <?= number_format($data->real_value,2) ?>
                              <?php else: ?>
                                  <?= number_format($data->value,2) ?>
                              <?php endif;?>
                          </td>
                          <td>
                            <?= number_format($data->fee,2) ?>
                          </td>
                          <td>
                            <?= $data->created_time ?>
                          </td>
                        </tr>
                      <?php endforeach;?>
                    </table>

                    <?php
                    Pjax::end();
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
