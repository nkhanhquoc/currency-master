<?php

namespace common\models\db;

use Yii;

/**
 * This is the model class for table "bill".
 *
 * @property string $id
 * @property integer $type
 * @property string $code
 * @property string $customer_id
 * @property double $value
 * @property integer $customer_type
 * @property string $note
 * @property string $receiver
 * @property double $deposit
 * @property double $fee
 * @property string $created_date
 */
class BillDB extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'bill';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type', 'customer_id', 'customer_type'], 'integer'],
            [['created_date'], 'safe'],
            [['code', 'note', 'receiver'], 'string', 'max' => 255],
            [['value', 'deposit', 'fee'], 'string', 'max' => 10]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('backend', 'ID'),
            'type' => Yii::t('backend', 'Type'),
            'code' => Yii::t('backend', 'Code'),
            'customer_id' => Yii::t('backend', 'Customer ID'),
            'value' => Yii::t('backend', 'Value'),
            'customer_type' => Yii::t('backend', 'Customer Type'),
            'note' => Yii::t('backend', 'Note'),
            'receiver' => Yii::t('backend', 'Receiver'),
            'deposit' => Yii::t('backend', 'Deposit'),
            'fee' => Yii::t('backend', 'Fee'),
            'created_date' => Yii::t('backend', 'Created Date'),
        ];
    }
}
