<?php

namespace backend\controllers;

use Yii;
use backend\models\Transaction;
use backend\models\Bill;
use backend\models\CustomerStorageSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * CustomerStorageController implements the CRUD actions for Bill model.
 */
class CustomerStorageController extends Controller
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
        $searchModel = new CustomerStorageSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
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
      $model->created_date = date('Y-m-d h:i:s');
      $model->type = 12;
      $count = Bill::countTypeBillInDay(12);
      $model->code = "NKKH-".date("Ymd")."-xxx-".($count+1);

      if ($model->load(Yii::$app->request->post()) && $model->save()) {
        $params = Yii::$app->request->post();
        $billVal = 0;
        for($i = 0;$i< count($params["trans"]['type']); $i++){
          $trans = new Transaction();
          $trans->bill_id = $model->id;
          $trans->type = $params["trans"]['type'][$i];
          $trans->currency_id = $params["trans"]['currency_id'][$i];
          $trans->quantity =  $params["trans"]['quantity'][$i];
          $trans->note = $params["trans"]['note'][$i];
          // $model->fee +=
          try{
            $trans->save();
          }catch(Exception $e){

          }

        }
          return $this->redirect(['update', 'id' => $model->id]);
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
          $model->clearTrans();
          $params = Yii::$app->request->post();
          for($i = 0;$i< count($params["trans"]['type']); $i++){
            if($params["trans"]['id'][$i] != "" || $params["trans"]['id'][$i] != null){
              $trans = Transaction::findOne($params["trans"]['id'][$i]);
            } else {
              $trans = new Transaction();
            }

            $trans->bill_id = $model->id;
            $trans->type = $params["trans"]['type'][$i];
            $trans->currency_id = $params["trans"]['currency_id'][$i];
            $trans->quantity =  $params["trans"]['quantity'][$i];
            $trans->note = $params["trans"]['note'][$i];
            // $model->fee +=
            $trans->save(false);
          }
        }
        $trans = Transaction::find()->where(['bill_id'=>$model->id])->all();
            return $this->render('update', [
                'model' => $model,
                'trans' => $trans
            ]);
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
