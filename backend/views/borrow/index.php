<?php

use backend\models\Customer;
use awesome\backend\grid\AwsGridView;
use awesome\backend\widgets\AwsBaseHtml;
use yii\helpers\Html;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\BillSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Hóa đơn Vay mượn');
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
    'modelClass' => 'Hóa đơn Vay mượn',
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

                                    // 'id',
            // 'type',
            'code',
            [
                'attribute' => 'customer_id',
                'format' => 'raw', //raw, html
                'content' => function($dataProvider) {
                  $m = Customer::findOne($dataProvider['customer_id']);
                  return $m->name;
                }
            ],
            // 'value',
            // 'customer_type',
            'note',
            // 'receiver',
            // 'deposit',
            // 'fee',
            'created_date',
            [
              'class' => 'yii\grid\ActionColumn',
              'template' => '{update} {export}',
              'buttons' => [
                'update' => function($url, $model){
                  return $model->is_export === 0 ? Html::a('<span class="glyphicon glyphicon-pencil"></span>',$url) :'';
                },
                'export' => function($url,$model){
                  return $model->is_export === 1 ? Html::a('<span class="glyphicon glyphicon-print"></span>','/borrow/export?id='.$model->id) :'';
                }
              ]
            ],
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
