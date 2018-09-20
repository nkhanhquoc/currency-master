<?php
namespace backend\models;

use Yii;
use common\models\StorageBase;
use yii\db\ActiveRecord;
use yii\db\Expression;
use yii\helpers\FileHelper;
use yii\behaviors\BlameableBehavior;


class Storage extends StorageBase{

  public function getCurrencyId(){
    $query = Currency::find()->all();
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

  public static function updateByCurrId($currId, $value){
    try{
      Yii::$app->db->createCommand("update storage set quantity = quantity + :value where currency_id = :currency")
      ->bindValue(":value",$value)
      ->bindValue(":currency",$currId)
      ->execute();
    }catch(Exception $e){
      Yii::$app->session->setFlash("error","Không cập nhật được dữ liệu: ".$e->getMessage());
    }

  }
}
