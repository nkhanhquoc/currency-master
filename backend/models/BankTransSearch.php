<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Transaction;

/**
 * BankTransSearch represents the model behind the search form about `\backend\models\Transaction`.
 */
class BankTransSearch extends Transaction
{

  public function attributeLabels()
  {
      return [
          'id' => Yii::t('backend', 'ID'),
          'bill_id' => Yii::t('backend', 'Bill ID'),
          'type' => Yii::t('backend', 'Type'),
          'currency_id' => Yii::t('backend', 'Tài Khoản'),
          'quantity' => Yii::t('backend', 'Quantity'),
          'value' => Yii::t('backend', 'Giá Trị'),
          'created_time' => Yii::t('backend', 'Thời gian'),
          'receiver' => Yii::t('backend', 'Receiver'),
          'fee' => Yii::t('backend', 'Fee'),
          'deposit' => Yii::t('backend', 'Deposit'),
          'exchange_rate' => Yii::t('backend', 'Exchange Rate'),
          'note' => Yii::t('backend', 'Ghi Chú'),
          'real_value' => Yii::t('backend', 'Real Value'),
      ];
  }
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'bill_id', 'type', 'currency_id'], 'integer'],
            [['quantity', 'value', 'created_time', 'receiver', 'fee', 'deposit', 'exchange_rate', 'note', 'real_value'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Transaction::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => ['defaultOrder' => ['id' => SORT_DESC]]
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'bill_id' => 0,
            'type' => [12,13],
            'currency_id' => $this->currency_id,
            'created_time' => $this->created_time,
        ]);

        $query->andFilterWhere(['like', 'quantity', $this->quantity])
            ->andFilterWhere(['like', 'value', $this->value])
            ->andFilterWhere(['like', 'receiver', $this->receiver])
            ->andFilterWhere(['like', 'fee', $this->fee])
            ->andFilterWhere(['like', 'deposit', $this->deposit])
            ->andFilterWhere(['like', 'exchange_rate', $this->exchange_rate])
            ->andFilterWhere(['like', 'note', $this->note])
            ->andFilterWhere(['like', 'real_value', $this->real_value]);

        return $dataProvider;
    }
}
