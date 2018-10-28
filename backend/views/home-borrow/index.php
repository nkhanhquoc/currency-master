<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\HomeBorrowSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Vay mượn Quê';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bill-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Lập Hóa đơn', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        // 'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            // 'id',
            // 'type',
            'code',
            // 'customer_id',
            'value',
            //'customer_type',
            'note',
            //'receiver',
            //'deposit',
            //'fee',
            'created_date',
            //'is_export',

            [
              'class' => 'yii\grid\ActionColumn',
              'template' => '{update} {export}',
              'buttons' => [
                'update' => function($url, $model){
                  return $model->is_export === 0 ? Html::a('<span class="glyphicon glyphicon-pencil"></span>',$url) :'';
                },
                'export' => function($url,$model){
                  return $model->is_export === 1 ? Html::a('<span class="glyphicon glyphicon-print"></span>','/home-borrow/export?id='.$model->id) :'';
                }
              ]
            ],
        ],
    ]); ?>
</div>
