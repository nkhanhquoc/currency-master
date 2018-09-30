<?php
namespace backend\models;

use Yii;
use common\models\ViewDebtBase;
use yii\db\ActiveRecord;
use yii\db\Expression;
use yii\helpers\FileHelper;
use yii\behaviors\BlameableBehavior;


class ViewDebt extends ViewDebtBase{

  public static function getTotalDebt($date){
  }

}
