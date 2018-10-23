<?php


use awesome\backend\grid\AwsGridView;
use awesome\backend\widgets\AwsBaseHtml;
use yii\helpers\Html;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\StorageSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Kho');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row storage-index">
    <div class="col-md-12">
        <div class="portlet light portlet-fit portlet-datatable bordered">
            <div class="portlet-title">
                                        <?php //echo $this->render('_search', ['model' => $searchModel]); ?>
                                <div class="caption">
                    <i class="icon-layers font-green"></i>
                    <span class="caption-subject font-green sbold uppercase">
                        <?=  AwsBaseHtml::encode($this->title) ?>
                    </span>
                </div>
                <div class="actions">
                    <?= Html::a(Yii::t('backend', 'Thêm {modelClass}', [
                          'modelClass' => 'Loại Tiền',
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
                         'filterModel' => $searchModel,
        'columns' => [
                        ['class' => 'yii\grid\SerialColumn'],

                                    // 'id',
                        'name',

                        [
                            'attribute' => 'quantity',
                            'format' => 'raw', //raw, html
                            'content' => function($dataProvider) {
                              return number_format($dataProvider->quantity,2);
                            }
                        ],
                        [
                          'class' => 'yii\grid\ActionColumn',
                          'template' => '{update}',
                          'buttons' => [
                            'update' => function($url, $model){
                              return $model->is_updated === 0 ? Html::a('<span class="glyphicon glyphicon-pencil"></span>',$url) :'';
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
