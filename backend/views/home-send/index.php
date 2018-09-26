<?php


use awesome\backend\grid\AwsGridView;
use awesome\backend\widgets\AwsBaseHtml;
use yii\helpers\Html;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\HomeStorageTransSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Gửi Quê');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row home-storage-transaction-index">
    <div class="col-md-12">
        <div class="portlet light portlet-fit portlet-datatable bordered">
            <div class="portlet-title">
                <?php echo $this->render('_search', ['model' => $searchModel]); ?>
              </div>
            </div>

            <div class="portlet-body">
                <div class="table-container">
                    <?php
                    Pjax::begin(['formSelector' => 'form', 'enablePushState' => false, 'id' => 'mainGridPjax']);
                    ?>

                    <table class="table">
                      <tr class="list-group-item-success">
                        <th>
                          Loại Tiền
                        </th>
                        <th>
                          Số Lượng
                        </th>
                        <th>
                          Ngày
                        </th>
                      </tr>
                      <?php $dateArr = [];?>
                      <?php foreach($dataProvider->getModels() as $data):?>
                        <?php if(!in_array($data->created_time,$dateArr)):?>
                          <?php $dateArr[] = $data->created_time;?>
                          <tr class="list-group-item-info" style="font-weight:bold">
                            <td colspan="3">
                              <?= $data->created_time ?>
                            </td>
                          </tr>
                        <?php endif;?>
                        <tr>
                          <td>
                            <?= $data->getCurrencyName() ?>
                          </td>
                          <td>
                            <?= number_format($data->quantity,2) ?>
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
