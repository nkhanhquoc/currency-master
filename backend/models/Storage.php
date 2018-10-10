<?php
namespace backend\models;

use Yii;
use common\models\StorageBase;
use yii\db\ActiveRecord;
use yii\db\Expression;
use yii\helpers\FileHelper;
use yii\behaviors\TimestampBehavior;


class Storage extends StorageBase{

  public function behaviors() {
      return [
        [
            'class' => TimestampBehavior::className(),
            'createdAtAttribute' => 'date',
            'updatedAtAttribute' => false,
            'value' => new Expression('NOW()'),
        ],
      ];
  }

  public function getCurrencyId(){
    $query = Currency::find()->where(['type'=>0])->all();
    $list = [];
    if ($query) {
        foreach ($query as $type) {
            $list[$type->id] = $type->name;
        }
    }
    return $list;
  }
  public function getBankAccount(){
    $query = Currency::find()->where(['type'=>1])->all();
    $list = [];
    if ($query) {
        foreach ($query as $type) {
            $list[$type->id] = $type->name;
        }
    }
    return $list;
  }
  public function attributeLabels() {
      return [
          'name' => 'Loại Tiền',
          'quantity' => 'Giá trị',
          'exchange_rate' => 'Tỉ giá',
          'currency_id' => 'Loại Hàng'

      ];
  }

  // public static function updateByCurrId($currId, $value){
  //   try{
  //     Yii::$app->db->createCommand("update storage set quantity = quantity + :value where currency_id = :currency")
  //     ->bindValue(":value",$value)
  //     ->bindValue(":currency",$currId)
  //     ->execute();
  //   }catch(Exception $e){
  //     Yii::$app->session->setFlash("error","Không cập nhật được dữ liệu: ".$e->getMessage());
  //   }
  // }

  public static function updateByCurrId($currency,$value){
    $currentSt = Storage::find()
    ->where(['currency_id'=>$currency])
    ->andWhere(['>=','date',date("Y-m-d")])
    ->one();
    try{
      if(!is_null($currentSt->id)){
        $query = Yii::$app->db->createCommand("update storage set quantity = quantity + :value where id = :id")
        ->bindValue(":value",$value)
        ->bindValue(":id",$currentSt->id)
        ->execute();
      } else {
        $currentSt = Storage::find()
        ->where(['currency_id'=>$currency])
        ->orderBy(['date' => SORT_DESC])
        ->one();
        $st = new Storage();
        $st->currency_id = $currency;
        $st->quantity = $currentSt->quantity + $value;
        $st->type = $currentSt->type;
        $st->save(false);
      }
    } catch(Exception $e){
      Yii::$app->session->setFlash("error","Không cập nhật được dữ liệu: ".$e->getMessage());
    }
  }
}
