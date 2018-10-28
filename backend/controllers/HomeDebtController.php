<?php

namespace backend\controllers;

use Yii;
use backend\models\Currency;
use backend\models\Bill;
use backend\models\HomeDebtSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * HomeDebtController implements the CRUD actions for Bill model.
 */
class HomeDebtController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Bill models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new HomeDebtSearch();
        $params = Yii::$app->request->queryParams;
        $selectDate = $params['HomeDebtSearch']['created_date'];
        if($selectDate == null){
          $selectDate = date("Y-m-d");
          $searchModel['created_date'] = $selectDate;
        }
        $currentDebt = $searchModel->searchDebt($selectDate);
        $beforeDate = date('Y-m-d', strtotime('-1 day', strtotime($selectDate)));
        $oldDebt = $searchModel->searchDebt($beforeDate);

        foreach($oldDebt as $k=> $odebt){
          foreach($currentDebt as $j => $cdebt){
            if($cdebt['currency_id'] == $odebt['currency_id']){
              $currentDebt[$j]['ovalue'] = $odebt['value'];
              break;
            }
          }
        }

        $exrate = Currency::getAllExRate();
        $totalDebt = 0;

        foreach($currentDebt as $d){
          $totalDebt += $d['value']*$exrate[$d['currency_id']];
          $totalOldDebt += $d['ovalue']*$exrate[$d['currency_id']];
        }

        return $this->render('index', [
          'searchModel' => $searchModel,
          'dataProvider' => $dataProvider,
          'selectDate'=>$selectDate,
          'beforeDate'=>$beforeDate,
          'currentDebt' =>$currentDebt,
          'totalDebt'=>$totalDebt,
          'totalOldDebt' =>$totalOldDebt
        ]);
    }

    /**
     * Displays a single Bill model.
     * @param string $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Bill model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Bill();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Bill model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Bill model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Bill model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Bill the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Bill::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
