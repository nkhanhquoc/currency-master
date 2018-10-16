<?php

namespace common\models\db;

use Yii;

/**
 * This is the model class for table "original_storage".
 *
 * @property string $id
 * @property string $currency_id
 * @property double $quantity
 * @property integer $type
 * @property string $name
 * @property integer $is_updated
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
            [['currency_id', 'type', 'is_updated'], 'integer'],
            [['quantity'], 'number'],
            [['name'], 'string', 'max' => 255]
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
            'quantity' => Yii::t('backend', 'Quantity'),
            'type' => Yii::t('backend', 'Type'),
            'name' => Yii::t('backend', 'Name'),
            'is_updated' => Yii::t('backend', 'Is Updated'),
        ];
    }
}
