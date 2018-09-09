<?php

namespace common\models\db;

use Yii;

/**
 * This is the model class for table "storage".
 *
 * @property string $id
 * @property string $name
 * @property integer $quantity
 * @property string $currency_id
 *
 * @property CurrencyDB $currency
 */
class StorageDB extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'storage';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['quantity', 'currency_id'], 'integer'],
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
            'name' => Yii::t('backend', 'Name'),
            'quantity' => Yii::t('backend', 'Quantity'),
            'currency_id' => Yii::t('backend', 'Currency ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCurrency()
    {
        return $this->hasOne(CurrencyDB::className(), ['id' => 'currency_id']);
    }
}