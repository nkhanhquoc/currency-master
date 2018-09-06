<?php

namespace common\models\db;

use Yii;

/**
 * This is the model class for table "currency".
 *
 * @property string $id
 * @property string $name
 * @property string $code
 * @property double $exchange_rate
 *
 * @property StorageDB[] $storages
 */
class CurrencyDB extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'currency';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'code'], 'string', 'max' => 255],
            [['exchange_rate'], 'string', 'max' => 10]
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
            'code' => Yii::t('backend', 'Code'),
            'exchange_rate' => Yii::t('backend', 'Exchange Rate'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStorages()
    {
        return $this->hasMany(StorageDB::className(), ['currency_id' => 'id']);
    }
}
