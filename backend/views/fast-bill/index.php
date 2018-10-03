<?php


use awesome\backend\grid\AwsGridView;
use awesome\backend\widgets\AwsBaseHtml;
use yii\helpers\Html;
use yii\widgets\Pjax;
use backend\models\Customer;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\FastBillSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Mua Bán Giao Ngay');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row bill-index">
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
                <div class="actions">
                    <?= Html::a(Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Hóa Đơn',
]),
                        ['create'], ['class' => 'btn btn-transparent green btn-outline btn-circle btn-sm']) ?>
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

            'code',
            [
                'attribute' => 'customer_id',
                'format' => 'raw', //raw, html
                'content' => function($dataProvider) {
                  $m = Customer::findOne($dataProvider['customer_id']);
                  return $m->name;
                }
            ],
            'value',
            // 'customer_type',
            'note',
            // 'receiver',
            // 'deposit',
            // 'fee',
            'created_date',
            [
              'attribute' => 'is_export',
              'format' => 'raw', //raw, html
              'content' => function($dataProvider) {
                $text = "";
                switch($dataProvider['is_export']){
                  case 0: $text = "Chưa xuất";break;
                  case 1: $text = "Đã xuất";break;
                  default: break;
                };
                return $text;
              }
            ],

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
