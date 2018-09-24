<?php


use awesome\backend\grid\AwsGridView;
use awesome\backend\widgets\AwsBaseHtml;
use yii\helpers\Html;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\HomeStorageTransSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Kho Quê');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row home-storage-transaction-index">
    <div class="col-md-12">
        <div class="portlet light portlet-fit portlet-datatable bordered">
            <div class="portlet-title">
              <div class="col-md-6">
                <?php echo $this->render('_search', ['model' => $searchModel]); ?>
              </div>
              <div class="col-md-6">
                <table class="table">
                  <tr>
                    <th>
                      Loại tiền
                    </th>
                    <th>
                      Số lượng
                    </th>
                  </tr>
                  <?php foreach($homeStorages as $st):?>
                    <tr>
                      <td>
                        <?= $st->getCurrencyName(); ?>
                      </td>
                      <td>
                        <?= $st->quantity ?>
                      </td>
                    </tr>
                  <?php endforeach; ?>

                </table>

              </div>
            </div>

            <div class="portlet-body">
                <div class="table-container">
                    <?php
                    Pjax::begin(['formSelector' => 'form', 'enablePushState' => false, 'id' => 'mainGridPjax']);
                    ?>

                                            <?= AwsGridView::widget([
                        'dataProvider' => $dataProvider,
                        // 'filterModel' => $searchModel,
        'columns' => [
                        ['class' => 'yii\grid\SerialColumn'],

            'currency_id',
            'quantity',
            'created_time',

                        ['class' => 'yii\grid\ActionColumn'],
                        ],
                        ]); ?>

                    <?php
                    Pjax::end();
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
