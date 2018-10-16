<?php
namespace backend\models;

use Yii;
use common\models\OriginalStorageBase;
use yii\db\ActiveRecord;
use yii\db\Expression;
use yii\helpers\FileHelper;
use yii\behaviors\BlameableBehavior;


class OriginalStorage extends OriginalStorageBase{

  /**
   * @inheritdoc
   */
  public function attributeLabels()
  {
      return [
          'id' => Yii::t('backend', 'ID'),
          'currency_id' => Yii::t('backend', 'Loại Tiền/Tài Khoản'),
          'quantity' => Yii::t('backend', 'Số lượng'),
          'type' => Yii::t('backend', 'Type'),
          'name' => Yii::t('backend', 'Mã'),
          'is_updated' => Yii::t('backend', 'Is Updated'),
      ];
  }

  public function getAllCurrency(){
    $query = Currency::find()->all();
    $list = [];
    if ($query) {
        foreach ($query as $type) {
            $list[$type->id] = $type->name;
        }
    }
    return $list;
  }
}
