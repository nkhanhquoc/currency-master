<?php

namespace common\models\db;

use Yii;

/**
 * This is the model class for table "customer".
 *
 * @property string $id
 * @property string $name
 * @property string $code
 * @property string $note
 */
class CustomerDB extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'customer';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'code'], 'string', 'max' => 255],
            [['note'], 'string', 'max' => 1000]
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
            'note' => Yii::t('backend', 'Note'),
        ];
    }
}
