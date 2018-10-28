<?php

namespace backend\controllers;

use Yii;
use backend\models\Bill;
use backend\models\Transaction;
use backend\models\Debt;
use backend\models\Storage;
use backend\models\HomeBorrowSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * HomeBorrowController implements the CRUD actions for Bill model.
 */
class HomeBorrowController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
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
        $searchModel = new HomeBorrowSearch();
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
     * @throws NotFoundHttpException if the model cannot be found
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
      $model->type = 14;
      $model->customer_id = 0;
      $model->created_date = date('Y-m-d h:i:s');
      $count = Bill::countTypeBillInDay(14);
      $model->code = "VMQ-".date("Ymd")."-".($count+1);

      if ($model->load(Yii::$app->request->post()) && $model->save()) {
        $params = Yii::$app->request->post();
        for($i = 0;$i< count($params["trans"]['type']); $i++){
          $trans = new Transaction();
          $trans->bill_id = $model->id;
          $trans->type = $params["trans"]['type'][$i];
          $trans->currency_id = $params["trans"]['currency_id'][$i];
          $trans->quantity =  $params["trans"]['quantity'][$i];
          // $model->fee +=
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
     * Updates an existing Bill model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        if($model->is_export == 1){
          Yii::$app->session->setFlash("error","Hóa đơn đã xuất không thể sửa được");
          return $this->redirect(['index']);
        }

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
            $trans->type = $params["trans"]['type'][$i];
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
      $trans = Transaction::find()->where(['bill_id'=>$model->id])->all();
      if($model->is_export != 1){
        $model->is_export = 1;
        try{

          $model->save();
          foreach($trans as $tran){
            if($tran->type == VAY || $tran->type == QUE_DAT_COC){
              // Storage::updateByCurrId(VND_CURRENCY_ID, (0 - $tran->deposit));
              Storage::updateByCurrId($tran->currency_id, $tran->quantity);
              Debt::updateByCustomerNCurrency($model->customer_id,$tran->currency_id,(0 - $tran->quantity));
            } else {
              // Storage::updateByCurrId(VND_CURRENCY_ID, $tran->deposit);
              Storage::updateByCurrId($tran->currency_id, (0 - $tran->quantity));
              Debt::updateByCustomerNCurrency($model->customer_id,$tran->currency_id, $tran->quantity);
            }
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
     * Deletes an existing Bill model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        // $this->findModel($id)->delete();
        //
        // return $this->redirect(['index']);
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
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
