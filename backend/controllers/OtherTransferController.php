<?php

namespace backend\controllers;

use Yii;
use backend\models\Bill;
use backend\models\Transaction;
use backend\models\Storage;
use backend\models\OtherTransferSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

class OtherTransferController extends Controller
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
      $searchModel = new OtherTransferSearch();
      $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

      return $this->render('index', [
          'searchModel' => $searchModel,
          'dataProvider' => $dataProvider,
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
      $model->type = 6;
      $count = Bill::countTypeBillInDay(6);
      $model->code = "TCK-".date("Ymd")."-xxx-".($count+1);

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
            $trans->real_value =  $params["trans"]['real_value'][$i];
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
            $trans->real_value =  $params["trans"]['real_value'][$i];
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

  public function actionExport($id){
    $model = $this->findModel($id);

    if($model->is_export != 1){
      $model->is_export = 1;
      try{
        $model->save();
        $trans = Transaction::find()->where(['bill_id'=>$model->id])->all();
        foreach($trans as $tran){
          switch($tran->type){
            case NHAN_TIEN_CHUYEN:
              Debt::updateByCustomerNCurrency($model->customer_id,$tran->currency_id,(0-$tran->quantity));
              break;
            case TRA_TIEN_CHUYEN:
              Debt::updateByCustomerNCurrency($model->customer_id,$tran->currency_id,$tran->quantity);
              break;
            default: break;
          }

        }
      }catch(Exception $e){
        Yii::$app->session->setFlash("error","Xuất hóa đơn không thành công: ".$e->getMessage());
      }
    }

    return $this->render('export', [
        'model' => $model,
        'trans' => $trans
    ]);
  }

  protected function findModel($id)
  {
      if (($model = Bill::findOne($id)) !== null) {
          return $model;
      } else {
          throw new NotFoundHttpException('The requested page does not exist.');
      }
  }
}
