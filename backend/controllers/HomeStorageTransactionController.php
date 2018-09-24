<?php

namespace backend\controllers;

use Yii;
use backend\models\HomeStorage;
use backend\models\HomeStorageTransaction;
use backend\models\HomeStorageTransSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * HomeStorageTransactionController implements the CRUD actions for HomeStorageTransaction model.
 */
class HomeStorageTransactionController extends Controller
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
     * Lists all HomeStorageTransaction models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new HomeStorageTransSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $homeStorages = HomeStorage::find()->all();

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'homeStorages' => $homeStorages
        ]);
    }

    /**
     * Displays a single HomeStorageTransaction model.
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
     * Creates a new HomeStorageTransaction model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new HomeStorageTransaction();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $storage = HomeStorage::find()->where(['currency_id'=>$model->currency_id])->one();
            if($storage){
              $storage->quantity += $model->quantity;
            } else {
              $storage = new HomeStorage();
              $storage->currency_id = $model->currency_id;
              $storage->quantity = $model->quantity;
            }
            $storage->save();
            return $this->redirect(['index']);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing HomeStorageTransaction model.
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
     * Deletes an existing HomeStorageTransaction model.
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
     * Finds the HomeStorageTransaction model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return HomeStorageTransaction the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = HomeStorageTransaction::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
