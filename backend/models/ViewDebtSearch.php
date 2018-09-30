<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\ViewDebt;

/**
 * ViewDebtSearch represents the model behind the search form about `\backend\models\Debt`.
 */
class ViewDebtSearch extends ViewDebt
{
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
        $query = Debt::find();

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
            'currency_id' => $this->currency_id,
            'customer_id' => $this->customer_id,
            'value' => $this->value,
            'date' => $this->date,
        ]);

        return $dataProvider;
    }

    public function searchDebt($date){
      $query = Yii::$app->db
      ->createCommand("select sum(value) as value, currency_id from (select * from view_debt
              where date <= :date
              group by currency_id, customer_id) abc
              group by currency_id")
              ->bindValue(":date",$date.' 23:59:59')
              ->queryAll();
      return $query;
    }

    public function searchTonkho($date){
      $query = Yii::$app->db
      ->createCommand("select quantity, currency_id from (select * from view_tonkho
              where date <= :date
              group by currency_id) abc")
              ->bindValue(":date",$date.' 23:59:59')
              ->queryAll();
      return $query;
    }
}
