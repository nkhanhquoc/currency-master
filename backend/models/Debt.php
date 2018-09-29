<?php
namespace backend\models;

use Yii;
use common\models\DebtBase;
use yii\db\ActiveRecord;
use yii\db\Expression;
use yii\helpers\FileHelper;
use yii\behaviors\TimestampBehavior;


class Debt extends DebtBase{

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

  public static function updateByCustomerNCurrency($customer,$currency,$value){
    // var_dump($customer);
    // var_dump($currency);
    // var_dump($value);
    // die;
    $currentDebt = Debt::find()
    ->where(['customer_id'=>$customer,'currency_id'=>$currency])
    ->andWhere(['>=','date',date("Y-m-d")])
    ->one();
    try{
      if(!is_null($currentDebt->id)){
        $query = Yii::$app->db->createCommand("update debt set value = value + :value where id = :id")
        ->bindValue(":value",$value)
        ->bindValue(":id",$currentDebt->id)
        ->execute();
      } else {
        $currentDebt = Debt::find()
        ->where(['customer_id'=>$customer,'currency_id'=>$currency])
        ->orderBy(['date' => SORT_DESC])
        ->one();
        $debt = new Debt();
        $debt->currency_id = $currency;
        $debt->customer_id = $customer;
        $debt->value = $currentDebt->value + $value;
        $debt->save(false);
      }
    } catch(Exception $e){

    }

  }
}
