<?php
namespace backend\models;

use Yii;
use common\models\BillBase;
use yii\db\ActiveRecord;
use yii\db\Expression;
use yii\helpers\FileHelper;
use yii\behaviors\TimestampBehavior;

class Bill extends BillBase{
  public function behaviors() {
      return [
        [
            'class' => TimestampBehavior::className(),
            'createdAtAttribute' => 'created_date',
            'updatedAtAttribute' => false,
            'value' => new Expression('NOW()'),
        ],
      ];
  }

  public function attributeLabels() {
      return [
          'type' => 'Loại Hóa đơn',
          'customer_id' => 'Khách hàng',
          'customer_type' => 'Loại khách hàng',
          'code' => 'Mã Hóa đơn',
          'value' => 'Giá trị',
          'note'=> 'Ghi chú',
          'receiver' => 'Người nhận',
          'created_date' => 'Thời gian lập'
      ];
  }

  public function getAllCustomer(){
    $query = Customer::find()->all();
    $list = [];
    if ($query) {
        foreach ($query as $type) {
            $list[$type->id] = $type->name;
        }
    }
    return $list;
  }

  public function getAllCurrency(){
    $query = Currency::find()->all();
    $list = [];
    if ($query) {
        foreach ($query as $type) {
            $list[$type->id] = $type->code;
        }
    }
    return $list;
  }

  public static function countTypeBillInDay($type){
    $query = Bill::find()->where(['type'=>$type])
    ->andWhere(['>=','created_date',date("Y-m-d")])
    ->count();
    return $query;
  }


}
