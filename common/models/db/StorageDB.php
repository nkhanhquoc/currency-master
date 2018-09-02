<?php

namespace common\models\db;

use Yii;

/**
 * This is the model class for table "storage".
 *
 * @property string $id
 * @property string $name
 * @property integer $quantity
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
            [['quantity'], 'integer'],
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
        ];
    }
}
