<?php

namespace backend\controllers;

use Yii;
use backend\models\ViewDebt;
use backend\models\Currency;
use backend\models\ViewDebtSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ViewDebtController implements the CRUD actions for Debt model.
 */
class ViewDebtController extends Controller
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
     * Lists all Debt models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ViewDebtSearch();
        $params = Yii::$app->request->queryParams;
        if(empty($params)){
          $params = ['ViewDebtSearch'=>['date'=>date("Y-m-d")]];
        }
        $selectDate = $params['ViewDebtSearch']['date'];
        $currentDebt = $searchModel->searchDebt($selectDate);

        $beforeDate = date('Y-m-d', strtotime('-1 day', strtotime($selectDate)));
        $oldDebt = $searchModel->searchDebt($beforeDate);

        $currentSt = $searchModel->searchTonkho($selectDate);
        $oldSt = $searchModel->searchTonkho($beforeDate);

        foreach($oldDebt as $k=> $odebt){
          foreach($currentDebt as $j => $cdebt){
            if($cdebt['currency_id'] == $odebt['currency_id']){
              $currentDebt[$j]['ovalue'] = $odebt['value'];
              break;
            }
          }
        }
        foreach($oldSt as $k=> $ost){
          foreach($currentSt as $j => $cst){
            if($cst['currency_id'] == $ost['currency_id']){
              $currentSt[$j]['oquantity'] = $ost['quantity'];
              break;
            }
          }
        }
        $exrate = Currency::getAllExRate();
        $totalDebt = 0;
        $totalSt = 0;
        foreach($currentDebt as $d){
          $totalDebt += $d['value']*$exrate[$d['currency_id']];
        }
        foreach($currentSt as $c){
          $totalSt += $c['quantity']*$exrate[$c['currency_id']];
        }
      

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'selectDate'=>$selectDate,
            'beforeDate'=>$beforeDate,
            'currentDebt' =>$currentDebt,
            'currentSt' => $currentSt,
            'totalDebt'=>$totalDebt,
            'totalSt' => $totalSt
        ]);
    }

    /**
     * Displays a single Debt model.
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
     * Creates a new Debt model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Debt();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Debt model.
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
     * Deletes an existing Debt model.
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
     * Finds the Debt model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Debt the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Debt::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
