<?php
namespace backend\models;

use Yii;
use common\models\BillBase;
use common\models\ReferenceBillBase;
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
          [['customer_id','created_date'],'required'],
          [['value'],'double'],
          [['code', 'note', 'receiver'], 'string', 'max' => 255],
          [['deposit', 'fee'], 'string', 'max' => 10],
          ['code','unique']
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
          'is_export' => 'Trạng thái',
          'ValueFormat' => 'Giá trị',
      ];
  }

  public function getAllCustomer(){
    $query = Customer::find()->orderBy('code')->all();
    $list = [];
    // $list[0] = '--Chọn--';
    if ($query) {
        foreach ($query as $type) {
            $list[$type->id] = $type->code;
        }
    }
    return $list;
  }

  public function getAllCurrency(){
    $query = Currency::find()->orderBy('code')->all();
    $list = [];
    if ($query) {
        foreach ($query as $type) {
            $list[$type->id] = $type->code;
        }
    }
    return $list;
  }

  public function getStorageCurrency(){
    $query = Currency::find()->where(['type'=>0])->orderBy('code')->all();
    $list = [];
    if ($query) {
        foreach ($query as $type) {
            $list[$type->id] = $type->code;
        }
    }
    return $list;
  }

  public function getBankAccount(){
    $query = Currency::find()->where(['type'=>1])->all();
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
    $name = '';
    switch($this->customer_id){
      case 0: $name = 'Quê';break;
      case -1: $name = 'GD Ngân hàng';break;
      case -2: $name = 'Chi Phí';break;
      default: $cus = Customer::findOne($this->customer_id); $name = $cus->name; break;
    }
    return $name;
  }

  public static function findRefBill($type,$cus){
    $query = Bill::find()
    ->where(['is_export'=>1]);
    if($type){
      $query->andWhere(['type'=>$type]);
    }
    if($cus){
      $query->andWhere(['customer_id'=>$cus]);
    }
    return $query->all();
  }

  public function getAllTrans(){
    return Transaction::find()->where(['bill_id'=>$this->id])->all();
  }

  public function getRefBill(){
    $refbills = ReferenceBillBase::find()->where(['main_bill'=>$this->id])->all();
    return $refbills;
  }
  public static function findAddBill($listId){
    $addbills = Bill::find()->where(['in','id',$listId])->all();
    return $addbills;
  }

  public function getTypeRefBill(){
    return [
      '2'=>'Hóa đơn chốt',
      '3'=>'Hóa đơn dài hạn',
      '4'=>'Chuyển tiền',
      '5'=>'Hóa đơn vay mượn',
      '6'=>'Tiền chuyển khác',
    ];
  }

  public function clearRef(){
    $refs = ReferenceBillBase::find()->where(['main_bill'=>$this->id])->all();
    foreach($refs as $ref){
      try{
        $ref->delete();
      }catch(Exception $e){
      }
    }
  }

  public function insertRef($refids){
    foreach($refids as $id){
      $ref = new ReferenceBillBase();
      $ref->main_bill = $this->id;
      $ref->reference_bill = $id;
      $ref->save();
    }
  }

  public function getValueFormat(){
    return number_format($this->value,0);
  }

}
