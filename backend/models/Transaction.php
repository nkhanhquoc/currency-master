<?php
namespace backend\models;

use Yii;
use common\models\TransactionBase;
use yii\db\ActiveRecord;
use yii\db\Expression;
use yii\helpers\FileHelper;
use yii\behaviors\TimestampBehavior;

class Transaction extends TransactionBase{

  public function behaviors() {
      return [
        [
            'class' => TimestampBehavior::className(),
            'createdAtAttribute' => 'created_time',
            'updatedAtAttribute' => false,
            'value' => new Expression('NOW()'),
        ],
      ];
  }

  public function customAfterSave($insert){
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

  public function getAllTransferType(){
    return [
      '3' => 'Nhận tiền chuyển',
      '4' => 'Trả tiền chuyển',
      '9' => 'Trả VND',
      '10' => 'Nhận VND',
    ];
  }

  public function getAllTradeType(){
    return [
      '1' => 'Mua',
      '2' => 'Bán',
      '9' => 'Trả VND',
      '10' => 'Nhận VND',
    ];
  }
}
