<?php
namespace backend\models;

use Yii;
use common\models\HomeStorageTransactionBase;
use yii\db\ActiveRecord;
use yii\db\Expression;
use yii\helpers\FileHelper;
use yii\behaviors\TimestampBehavior;

class HomeStorageTransaction extends HomeStorageTransactionBase{
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

  public function rules()
  {
      return [
          [['currency_id', 'quantity'], 'integer']
      ];
  }


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
          'currency_id' => 'Loại Hàng'
      ];
  }

}
