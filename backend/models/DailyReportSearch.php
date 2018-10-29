<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Transaction;

/**
 * DailyReportSearch represents the model behind the search form about `\backend\models\Transaction`.
 */
class DailyReportSearch extends Transaction
{
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
            'sort' => ['defaultOrder' => ['id' => SORT_DESC]],
            'pagination' => false
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
        $query->where([' is not ','bill_id',null])
        ->andWhere(['<>','bill_id',0]);
        if($this->created_time)
        $query->andWhere(['between','created_time',$this->created_time,$this->created_time.' 23:59:59']);

        // $query->andFilterWhere([
        //     'id' => $this->id,
        //     'bill_id' => $this->bill_id,
        //     'type' => $this->type,
        //     'currency_id' => $this->currency_id,
        //     // 'created_time' => $this->created_time,
        // ]);
        //
        // $query->andFilterWhere(['like', 'quantity', $this->quantity])
        //     ->andFilterWhere(['like', 'value', $this->value])
        //     ->andFilterWhere(['like', 'receiver', $this->receiver])
        //     ->andFilterWhere(['like', 'fee', $this->fee])
        //     ->andFilterWhere(['like', 'deposit', $this->deposit])
        //     ->andFilterWhere(['like', 'exchange_rate', $this->exchange_rate])
        //     ->andFilterWhere(['like', 'note', $this->note])
        //     ->andFilterWhere(['like', 'real_value', $this->real_value]);

        return $dataProvider;
    }
}
