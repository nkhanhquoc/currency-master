<?php

namespace backend\controllers;

use Yii;
use backend\models\Transaction;
use backend\models\Bill;
use backend\models\HomeDailySearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * HomeDailyController implements the CRUD actions for Bill model.
 */
class HomeDailyController extends Controller
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
        $searchModel = new HomeDailySearch();
        $params = Yii::$app->request->queryParams;
        if(empty($params)){
          $params = ['HomeDailySearch'=>['created_date'=>date("Y-m-d")]];
          $searchModel['created_date'] = $selectDate;
        }
        $dataProvider = $searchModel->search($params);
        $isExcel = 0;
        $listTrans = [];
        // foreach($dataProvider->getModels() as $bill){
        //   foreach($bill->getAllTrans() as $tran){
        //     $listTrans[] = $tran;
        //   }
        // }
        return $this->render('index', [
            'searchModel' => $searchModel,
            'isExcel'=>$isExcel,
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

    public function exportExcel($models) {
        $fileName = 'Bao_cao_Que_' . date('Ymd_His') . '.csv';
        // var_dump(Yii::getAlias('@webroot'));die;
        ob_start();

        header("Pragma: public");
        header('Content-Encoding: UTF-8');

        header("Content-Type: application/csv; charset=utf-8");
        header("Cache-Control: public, must-revalidate, max-age=0");
        header('Content-Transfer-Encoding: binary');
        header('Expires: 0');
        header('Content-Disposition: attachment; filename='.$fileName);
        ob_end_clean();
        // $file = Yii::getAlias('@webroot').'/tmp/'.$fileName;
        $fp = fopen('php://output', 'w');
        fputs($fp, "\xEF\xBB\xBF"); // UTF-8 BOM !!!!!
        $delimiter = ',';
        // fputcsv($fp, array("\t", "Ngày: ", $moduleId, "From: ", $from, "To:", $to));
        fputcsv($fp, array(), $delimiter);
        fputcsv($fp, array("#", "Hóa Đơn", "Ghi Chú", "Loại GD", "Loại Tiền", "Số lượng", "Tỉ giá", "Thành tiền","Phí","Ngày"), $delimiter);

        $j = 1;
        foreach ($models as $model) {
          $trans = Transaction::find()->where(['bill_id'=>$model->id])->all();
          foreach($trans as $tran){
            $put = array(
                $j,
                $model->code,
                $tran->note,
                $tran->getTypeName(),
                $tran->getCurrencyName(),
                $tran->quantity,
                $tran->exchange_rate,
                $tran->value,
                $tran->fee,
                $tran->created_time,
            );
            fputcsv($fp, $put, $delimiter);
            $j++;
          }
        }
        fclose($fp);
        // if(file_exists($file)){
        //   return Yii::$app->response->SendFile($file);
        // }
        //  echo "\xEF\xBB\xBF"; //cau echo nay de hien thi duoc tieng viet trong file csv khi mo bang excel
        exit();
    }
}
