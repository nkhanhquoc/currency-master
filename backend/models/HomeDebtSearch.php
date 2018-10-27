<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Bill;

/**
 * HomeDebtSearch represents the model behind the search form about `\backend\models\Bill`.
 */
class HomeDebtSearch extends Bill
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'type', 'customer_id', 'customer_type', 'is_export'], 'integer'],
            [['code', 'value', 'note', 'receiver', 'deposit', 'fee', 'created_date'], 'safe'],
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
        $query = Bill::find();

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
            'type' => $this->type,
            'customer_id' => $this->customer_id,
            'customer_type' => $this->customer_type,
            'created_date' => $this->created_date,
            'is_export' => $this->is_export,
        ]);

        $query->andFilterWhere(['like', 'code', $this->code])
            ->andFilterWhere(['like', 'value', $this->value])
            ->andFilterWhere(['like', 'note', $this->note])
            ->andFilterWhere(['like', 'receiver', $this->receiver])
            ->andFilterWhere(['like', 'deposit', $this->deposit])
            ->andFilterWhere(['like', 'fee', $this->fee]);

        return $dataProvider;
    }


    public function searchDebt($date){
      $query = Yii::$app->db
      ->createCommand("select sum(value) as value, currency_id from view_debt where id in (select max(id) from view_debt
              where date <= :date group by customer_id, currency_id
              ) and customer_id = 0")
              ->bindValue(":date",$date.' 23:59:59')
              ->queryAll();
      return $query;
    }
}
