<?php
namespace backend\models;

use Yii;
use common\models\CustomerBase;
use yii\db\ActiveRecord;
use yii\db\Expression;
use yii\helpers\FileHelper;
use yii\behaviors\BlameableBehavior;

class Customer extends CustomerBase{

  public function attributeLabels() {
      return [
          'name' => 'Tên',
          'code' => 'Mã Khách hàng',
          'note'=>'Ghi chú'
      ];
  }

  /**
   * @inheritdoc
   */
  public function rules()
  {
      return [
          [['name', 'code'], 'string', 'max' => 255],
          [['note'], 'string', 'max' => 1000],
          ['code','unique']
      ];
  }
}
