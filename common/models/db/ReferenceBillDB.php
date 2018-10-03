<?php

namespace common\models\db;

use Yii;

/**
 * This is the model class for table "reference_bill".
 *
 * @property string $main_bill
 * @property string $reference_bill
 */
class ReferenceBillDB extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'reference_bill';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['main_bill', 'reference_bill'], 'required'],
            [['main_bill', 'reference_bill'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'main_bill' => Yii::t('backend', 'Main Bill'),
            'reference_bill' => Yii::t('backend', 'Reference Bill'),
        ];
    }
}
