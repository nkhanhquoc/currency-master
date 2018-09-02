<?php
namespace backend\models;

use Yii;
use common\models\StorageBase;
use yii\db\ActiveRecord;
use yii\db\Expression;
use yii\helpers\FileHelper;
use yii\behaviors\BlameableBehavior;


class Storage extends StorageBase{

  public function attributeLabels() {
      return [
          'name' => 'Loại Tiền',
          'quantity' => 'Giá trị'
      ];
  }
}
