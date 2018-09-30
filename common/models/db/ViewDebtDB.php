<?php

namespace common\models\db;

use Yii;

/**
 * This is the model class for table "view_debt".
 *
 * @property string $currency_id
 * @property string $customer_id
 * @property double $value
 * @property string $date
 */
class ViewDebtDB extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'view_debt';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['currency_id', 'customer_id'], 'integer'],
            [['value'], 'number'],
            [['date'], 'string', 'max' => 10]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'currency_id' => Yii::t('backend', 'Currency ID'),
            'customer_id' => Yii::t('backend', 'Customer ID'),
            'value' => Yii::t('backend', 'Value'),
            'date' => Yii::t('backend', 'Date'),
        ];
    }
}
