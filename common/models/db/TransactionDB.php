<?php

namespace common\models\db;

use Yii;

/**
 * This is the model class for table "transaction".
 *
 * @property string $id
 * @property string $bill_id
 * @property integer $type
 * @property string $currency_id
 * @property string $quantity
 * @property double $value
 * @property string $created_time
 * @property string $receiver
 * @property double $fee
 * @property double $deposit
 * @property double $exchange_rate
 * @property string $note
 * @property double $real_value
 *
 * @property CurrencyDB $currency
 */
class TransactionDB extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'transaction';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bill_id', 'type', 'currency_id'], 'integer'],
            [['created_time'], 'safe'],
            [['quantity', 'receiver', 'note'], 'string', 'max' => 255],
            [['value', 'fee', 'deposit', 'exchange_rate','real_value'], 'string', 'max' => 20]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('backend', 'ID'),
            'bill_id' => Yii::t('backend', 'Bill ID'),
            'type' => Yii::t('backend', 'Type'),
            'currency_id' => Yii::t('backend', 'Currency ID'),
            'quantity' => Yii::t('backend', 'Quantity'),
            'value' => Yii::t('backend', 'Value'),
            'created_time' => Yii::t('backend', 'Created Time'),
            'receiver' => Yii::t('backend', 'Receiver'),
            'fee' => Yii::t('backend', 'Fee'),
            'deposit' => Yii::t('backend', 'Deposit'),
            'exchange_rate' => Yii::t('backend', 'Exchange Rate'),
            'note' => Yii::t('backend', 'Note'),
            'real_value' => Yii::t('backend', 'Real Value'),
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
