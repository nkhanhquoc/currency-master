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

  public function rules()
  {
      return [
          [['type', 'customer_id', 'customer_type', 'is_export'], 'integer'],
          [['created_date'], 'safe'],
          [['value'],'double'],
          [['code', 'note', 'receiver'], 'string', 'max' => 255],
          [['deposit', 'fee'], 'string', 'max' => 10]
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
          'created_date' => 'Thời gian lập',
          'is_export' => 'Trạng thái'
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

  public function clearTrans(){
    $trans = Transaction::find()->where(['bill_id'=>$this->id])->all();
    foreach($trans as $k=>$tran){
      try{
        $tran->bill_id = '0';
        $tran->save(false);
      }catch(Exception $e){
      }
    }
  }

  public function getCustomer(){
    $cus = Customer::findOne($this->customer_id);

    return $cus != null ? $cus->name:'';
  }


}
