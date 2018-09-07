<?php
namespace backend\models;

use Yii;
use common\models\TransactionBase;
use yii\db\ActiveRecord;
use yii\db\Expression;
use yii\helpers\FileHelper;
use yii\behaviors\BlameableBehavior;

class Transaction extends TransactionBase{
  public function afterSave($insert,$changedAttributes){
    parent::afterSave($insert, $changedAttributes);
    if($insert){
      $storage = Storage::findOne(['currency_id'=>$this->currency_id]);
      if($this->type == 3){//nhan chuyen tien
        if($storage){
          $storage->quantity = $storage->quantity + $this->value;
        } else {
          $storage = new Storage();
          $storage->currency_id = $this->currency_id;
          $storage->quantity = $this->value;
        }
      } else if($this->type == 4){
        $storage->quantity = $storage->quantity - $this->value;
      }
      $storage->save();
    } else {//update
      if($this->type == 3){
        
      } else {

      }
    }

  }
}
