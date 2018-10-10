<?php

namespace backend\controllers;

use Yii;
use backend\models\Transaction;
use backend\models\Bill;
use backend\models\FastBillSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * FastBillController implements the CRUD actions for Bill model.
 */
class FastBillController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                    'getbill' => ['post']
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
        $searchModel = new FastBillSearch();
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
        $model->type = 1;
        $model->created_date = date("Y-m-d h:i");
        $count = Bill::countTypeBillInDay(1);
        $model->code = "GN-".date("Ymd")."-xxx-".($count+1);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
          $params = Yii::$app->request->post();
          $billVal = 0;
          for($i = 0;$i< count($params["trans"]['type']); $i++){
            $trans = new Transaction();
            $trans->bill_id = $model->id;
            $trans->type = $params["trans"]['type'][$i];
            $trans->currency_id = $params["trans"]['currency_id'][$i];
            $trans->quantity =  $params["trans"]['quantity'][$i];
            $trans->exchange_rate =  $params["trans"]['exchange_rate'][$i];
            $trans->note = $params["trans"]['note'][$i];
            $trans->value = $params["trans"]['value'][$i];
            $billVal += $trans->value;
            $trans->save();
          }
          $model->value = $billVal;
          $model->save();
          $listInRef = $params['ref-bill-id'];
          $listInRef = explode(",",$listInRef);
          $model->insertRef($listInRef);

          $listRefId = [];
          $refbills = $model->getRefBill();
          foreach($refbills as $bill){
            $listRefId[] = $bill->reference_bill;
          }

          $listRefBill = Bill::findAddBill($listRefId);
          $data = $this->groupTrans($listRefBill);
          $trans = Transaction::find()->where(['bill_id'=>$model->id])->all();
          return $this->redirect(['update',
          'id' => $model->id,
          'trans' => $trans,
          'listRefId' =>$listRefId,
          'listRefBill' => $data
        ]);
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
        if($model->is_export == 1){
          Yii::$app->session->setFlash("error","Hóa đơn đã xuất không thể sửa được");
          return $this->redirect(['index']);
        }

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
          $model->clearTrans();
          $model->clearRef();
          $params = Yii::$app->request->post();
          $billVal = 0;
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
            $trans->exchange_rate =  $params["trans"]['exchange_rate'][$i];
            $trans->value = $params["trans"]['value'][$i];
            $billVal += $trans->value;
            // $model->fee +=
            $trans->save(false);
          }
          $model->value = $billVal;
          $model->save();
          $listInRef = $params['ref-bill-id'];
          $listInRef = explode(",",$listInRef);
          $model->insertRef($listInRef);
        }



        $listRefId = [];
        $refbills = $model->getRefBill();
        foreach($refbills as $bill){
          $listRefId[] = $bill->reference_bill;
        }

        $listRefBill = Bill::findAddBill($listRefId);
        $data = $this->groupTrans($listRefBill);
        $trans = Transaction::find()->where(['bill_id'=>$model->id])->all();
        return $this->render('update', [
            'model' => $model,
            'trans' => $trans,
            'listRefId' =>$listRefId,
            'listRefBill' => $data
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

    public function actionGetbill(){
      $params = Yii::$app->request->post();
      $type = $params['type'];
      $cus = $params['cus'];
      $ret = [];
      $data = [];
      $expUrl = '';
      switch($type){
        case 2: $expUrl = '/formed-bill/export?id=';break;
        case 3: $expUrl = '/longtime-bill/export?id=';break;
        case 4: $expUrl = '/transfer-currency/export?id=';break;
        case 5: $expUrl = '/borrow/export?id=';break;
        case 6: $expUrl = '/other-transfer/export?id=';break;
        default: break;
      }
      try{
        $bills = Bill::findRefBill($type,$cus);
        foreach($bills as $b){
          $data[] = [
            'id'=>$b->id,
            'code'=>$b->code,
            'type'=>Yii::$app->params['bill_type'][$b->type],
            'url'=>$expUrl.$b->id
          ];
        }
        $ret['errorCode'] = 0;
        $ret['data'] = $data;
      }catch(Exception $e){
        $ret['errorCode'] = 1;
      }

    \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

    return $ret;

    }

    public function actionAddbill(){
      $params = Yii::$app->request->post();
      $billids = $params['billids'];
      $ret = [];
      $data = [];
      try{
        $bills = Bill::findAddBill($billids);
        $data = $this->groupTrans($bills);
        $ret['errorCode'] = 0;
        $ret['data'] = $data;
      }catch(Exception $e){
        $ret['errorCode'] = 1;
      }
      \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

      return $ret;
    }

public function groupTrans($bills){
  $data = [];
  foreach($bills as $k => $b){
    $data[$k]['type'] = $b->type;
    $data[$k]['code'] = $b->code;
    foreach($b->getAllTrans() as $tran){
      $data[$k]['trans'][] = [
        'customer'=>$b->getCustomer(),
        'type' => $tran->getTypeName(),
        'currency_name'=>$tran->getCurrencyName(),
        'quantity' => number_format($tran->quantity),
        'fee' => number_format($data->fee),
        'value' => number_format($data->value)
      ];
    }
  }
  return $data;
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
          case MUA:
          case BAN:
        }

        // if($tran->type == MUA){
        //   Storage::updateByCurrId(VND_CURRENCY_ID, (0 - $tran->deposit));
        //   Storage::updateByCurrId($tran->currency_id, $tran->quantity);
        //   Debt::updateByCustomerNCurrency($model->customer_id,$tran->currency_id,(0 - $tran->quantity));
        // } else {
        //   Storage::updateByCurrId(VND_CURRENCY_ID, $tran->deposit);
        //   Storage::updateByCurrId($tran->currency_id, (0 - $tran->quantity));
        //   Debt::updateByCustomerNCurrency($model->customer_id,$tran->currency_id, $tran->quantity);
        // }
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

}
