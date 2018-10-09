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
}
