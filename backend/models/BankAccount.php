<?php
namespace backend\models;

use Yii;
use common\models\CurrencyBase;
use yii\db\ActiveRecord;
use yii\db\Expression;
use yii\helpers\FileHelper;
use yii\behaviors\BlameableBehavior;

class BankAccount extends CurrencyBase{

  public function attributeLabels() {
      return [
          'name' => 'Tên Tài Khoản',
          'code' => 'Kí hiệu Tài khoản'
      ];
  }

  /**
   * @inheritdoc
   */
  public function rules()
  {
      return [
          [['is_active', 'type'], 'integer'],
          [['name', 'code'], 'string', 'max' => 255],
          [['exchange_rate'], 'string', 'max' => 10],
          ['code','unique']
      ];
  }
}
