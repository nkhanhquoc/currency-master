<?php

namespace common\models\db;

use Yii;

/**
 * This is the model class for table "debt".
 *
 * @property string $id
 * @property string $currency_id
 * @property string $customer_id
 * @property double $value
 * @property string $date
 */
class DebtDB extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'debt';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['currency_id', 'customer_id'], 'integer'],
            [['value'], 'number'],
            [['date'], 'safe']
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
            'customer_id' => Yii::t('backend', 'Customer ID'),
            'value' => Yii::t('backend', 'Value'),
            'date' => Yii::t('backend', 'Date'),
        ];
    }
}
