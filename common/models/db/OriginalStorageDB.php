<?php

namespace common\models\db;

use Yii;

/**
 * This is the model class for table "original_storage".
 *
 * @property string $id
 * @property string $currency_id
 * @property double $value
 */
class OriginalStorageDB extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'original_storage';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['currency_id'], 'integer'],
            [['value'], 'number']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('backend', 'ID'),
            'currency_id' => Yii::t('backend', 'Currency ID'),
            'value' => Yii::t('backend', 'Value'),
        ];
    }
}
