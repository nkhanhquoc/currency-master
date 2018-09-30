<?php
namespace backend\models;

use Yii;
use common\models\CurrencyBase;
use yii\db\ActiveRecord;
use yii\db\Expression;
use yii\helpers\FileHelper;
use yii\behaviors\BlameableBehavior;

class Currency extends CurrencyBase{
  public function attributeLabels() {
      return [
          'exchange_rate' => 'Tỉ giá',
          'name' => 'Tên Hàng',
          'code' => 'Mã Hàng'
      ];
  }

  public static function getAllExRate(){
    $allC = Currency::find()->all();
    $arrC = [];
    foreach($allC as $c){
      $arrC[$c->id] = $c->exchange_rate;
    }
    return $arrC;
  }
}
