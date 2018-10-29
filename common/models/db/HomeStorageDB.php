<?php

namespace common\models\db;

use Yii;

/**
 * This is the model class for table "home_storage".
 *
 * @property string $id
 * @property string $currency_id
 * @property string $name
 * @property double $quantity
 *
 * @property CurrencyDB $currency
 */
class HomeStorageDB extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'home_storage';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['currency_id'], 'required'],
            [['currency_id'], 'integer'],
            [['name', 'quantity'], 'string', 'max' => 255]
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
            'name' => Yii::t('backend', 'Name'),
            'quantity' => Yii::t('backend', 'Quantity'),
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
