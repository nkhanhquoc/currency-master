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

  public function attributeLabels()
  {
      return [
          'id' => Yii::t('backend', 'ID'),
          'bill_id' => Yii::t('backend', 'Bill ID'),
          'type' => Yii::t('backend', 'Loại Giao dịch'),
          'currency_id' => Yii::t('backend', 'Tài Khoản'),
          'quantity' => Yii::t('backend', 'Quantity'),
          'value' => Yii::t('backend', 'Giá Trị'),
          'created_time' => Yii::t('backend', 'Thời gian'),
          'receiver' => Yii::t('backend', 'Receiver'),
          'fee' => Yii::t('backend', 'Fee'),
          'deposit' => Yii::t('backend', 'Deposit'),
          'exchange_rate' => Yii::t('backend', 'Exchange Rate'),
          'note' => Yii::t('backend', 'Ghi Chú'),
          'real_value' => Yii::t('backend', 'Real Value'),
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
      '9' => 'Trả',
      '10' => 'Nhận',
    ];
  }

  public function getAllTradeType(){
    return [
      '1' => 'Mua',
      '2' => 'Bán',
      '9' => 'Trả',
      '10' => 'Nhận',
    ];
  }

  public function getAllLongTradeType(){
    return [
      '1' => 'Mua',
      '2' => 'Bán',
      '9' => 'Trả',
      '10' => 'Nhận',
      '11' => 'Đặt cọc'
    ];
  }

  public function getAllBorrowType(){
    return [
      '5' => 'Vay',
      '6' => 'Cho vay',
    ];
  }

  public function getBill(){
    return Bill::findOne([$this->bill_id]);
  }

  public function getTypeName(){
    return Yii::$app->params['transaction_type'][$this->type];
  }

  public function getCurrencyName(){
    $currency = Currency::findOne([$this->currency_id]);
    return $currency->name;
  }

  public function getAllFastTradeType(){
    return [
      '1' => 'Mua',
      '2' => 'Bán',
      // '3' => 'Nhận tiền chuyển',
      // '4' => 'Trả tiền chuyển',
      // '5' => 'Vay',
      // '6' => 'Cho vay',
      '9' => 'Trả Tiền',
      '10' => 'Nhận Tiền',
      '12' => 'Khách CK',
      '13' => 'Cửa hàng CK',
      '14' => 'Trả Feedback',
      '15' => 'Nhận Feedback',
    ];
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


}
