<?php

use backend\models\Currency;
use awesome\backend\grid\AwsGridView;
use awesome\backend\widgets\AwsBaseHtml;
use yii\helpers\Html;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\BankTransSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Giao dịch Ngân Hàng');
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
                <div class="actions">
                    <?= Html::a(Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Giao dịch',
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
        'columns' => [
                        ['class' => 'yii\grid\SerialColumn'],

                        [
                            'attribute' => 'type',
                            'format' => 'raw', //raw, html
                            'content' => function($dataProvider) {
                              return Yii::$app->params['transaction_type'][$dataProvider['type']];
                            }
                        ],
            [
                'attribute' => 'currency_id',
                'format' => 'raw', //raw, html
                'content' => function($dataProvider) {
                  $m = Currency::findOne($dataProvider['currency_id']);
                  return $m->name;
                }
            ],
            // 'quantity',
            'value',
            'created_time',
            // 'receiver',
            // 'fee',
            // 'deposit',
            // 'exchange_rate',
            'note',
            // 'real_value',

                        ['class' => 'yii\grid\ActionColumn','template'=>'{create}'],
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
