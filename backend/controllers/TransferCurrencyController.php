<?php

namespace backend\controllers;

use Yii;
use backend\models\Bill;
use backend\models\Transaction;
use backend\models\TransferSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * TransferCurrencyController implements the CRUD actions for Bill model.
 */
class TransferCurrencyController extends Controller
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
        $searchModel = new TransferSearch();
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
        $model->type = 4;
        $count = Bill::countTypeBillInDay(4);
        $model->code = "TC-".date("Ymd")."-xxx-".$count;

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
        // }
            // var_dump(Yii::$app->request->post());die;
            $params = Yii::$app->request->post();
            for($i = 0;$i< count($params["trans"]['type']); $i++){
              $trans = new Transaction();
              $trans->bill_id = $model->id;
              $trans->note = $params["trans"]['note'][$i];
              $trans->type = $params["trans"]['type'][$i];
              $trans->currency_id = $params["trans"]['currency_id'][$i];
              $trans->quantity =  $params["trans"]['quantity'][$i];
              $trans->fee =  $params["trans"]['fee'][$i];
              // $model->fee +=
              $trans->save();
              // $trans->customAfterSave(true);//cap nhat lai kho
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
          if($model->is_export == 1){
            Yii::$app->session->setFlash("error","Hóa đơn đã xuất không thể sửa được");
            return $this->redirect(['index']);
          }
            $model->clearTrans();
            $params = Yii::$app->request->post();
            for($i = 0;$i< count($params["trans"]['type']); $i++){
              if($params["trans"]['id'][$i] != "" || $params["trans"]['id'][$i] != null){
                $transaction = Transaction::findOne($params["trans"]['id'][$i]);
              } else {
                $transaction = new Transaction();
              }

              $transaction->bill_id = $model->id;
              $transaction->note = $params["trans"]['note'][$i];
              $transaction->type = $params["trans"]['type'][$i];
              $transaction->currency_id = $params["trans"]['currency_id'][$i];
              $transaction->quantity =  $params["trans"]['quantity'][$i];
              $transaction->fee =  $params["trans"]['fee'][$i];
              // $model->fee +=
              $transaction->save(false);
            }
        }
        $trans = Transaction::find()->where(['bill_id'=>$model->id])->all();
        return $this->render('update', [
            'model' => $model,
            'trans' => $trans
        ]);
    }

    public function executeExport($id){
      $model = $this->findModel($id);
      $model->is_export = 1;
      try{
        $model->save();
      }catch(Exception $e){
        Yii::$app->session->setFlash("error","Xuất hóa đơn không thành công: ".$e->getMessage());
      }
      $trans = Transaction::find()->where(['bill_id'=>$model->id])->all();
      return $this->render('export', [
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
