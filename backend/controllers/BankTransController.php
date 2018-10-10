<?php

namespace backend\controllers;

use Yii;
use backend\models\Bill;
use backend\models\Storage;
use backend\models\Transaction;
use backend\models\BankTransSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * BankTransController implements the CRUD actions for Transaction model.
 */
class BankTransController extends Controller
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
     * Lists all Transaction models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new BankTransSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Transaction model.
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
     * Creates a new Transaction model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Bill();
        $count = Bill::countTypeBillInDay(10);
        $model->code = "GD-".date("Ymd")."-CH-".($count+1);
        $model->created_date = date('Y-m-d h:i:s');
        $model->type = 10;
        $model->customer_id = -1;

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
          $params = Yii::$app->request->post();
          for($i = 0;$i< count($params["trans"]['type']); $i++){
            $trans = new Transaction();
            $trans->bill_id = $model->id;
            $trans->type = 13;
            $trans->currency_id = $params["trans"]['currency_id'][$i];
            $trans->quantity =  $params["trans"]['quantity'][$i];
            $trans->save();
          }
            return $this->redirect(['update', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Transaction model.
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
            $trans->note = $params["trans"]['note'][$i];
            $trans->type = 13;
            $trans->currency_id = $params["trans"]['currency_id'][$i];
            $trans->quantity =  $params["trans"]['quantity'][$i];
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


    public function actionExport($id){
      $model = $this->findModel($id);
      if($model->is_export != 1){
        $model->is_export = 1;
        try{
          $model->save();
          $trans = Transaction::find()->where(['bill_id'=>$model->id])->all();
          foreach($trans as $tran){
              Storage::updateByCurrId($tran->currency_id, (0-$tran->quantity));
          }
        }catch(Exception $e){
          Yii::$app->session->setFlash("error","Xuất hóa đơn không thành công: ".$e->getMessage());
        }
      }

      $trans = Transaction::find()->where(['bill_id'=>$model->id])->all();
      return $this->render('export', [
          'model' => $model,
          'trans' => $trans
      ]);
    }

    /**
     * Deletes an existing Transaction model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        // $this->findModel($id)->delete();
        //
        // return $this->redirect(['index']);
    }

    /**
     * Finds the Transaction model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Transaction the loaded model
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
