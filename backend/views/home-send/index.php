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

                    <?= AwsGridView::widget([
                      'dataProvider' => $dataProvider,
                      // 'filterModel' => $searchModel,
                      'columns' => [
                      ['class' => 'yii\grid\SerialColumn'],

                      'CurrencyName',
                      'FormatQuantity',
                      'created_time',
                      'note',

                      ['class' => 'yii\grid\ActionColumn','template'=>'{update}'],
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
