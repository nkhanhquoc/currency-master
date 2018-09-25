<?php

namespace common\models\db;

use Yii;

/**
 * This is the model class for table "home_storage_transaction".
 *
 * @property string $id
 * @property string $currency_id
 * @property integer $quantity
 * @property string $created_time
 */
class HomeStorageTransactionDB extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'home_storage_transaction';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'required'],
            [['id', 'currency_id', 'quantity'], 'integer'],
            [['created_time'], 'safe']
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
            'created_time' => Yii::t('backend', 'Created Time'),
        ];
    }
}
