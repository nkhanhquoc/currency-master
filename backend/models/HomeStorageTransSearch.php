<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\HomeStorageTransaction;

/**
 * HomeStorageTransSearch represents the model behind the search form about `backend\models\HomeStorageTransaction`.
 */
class HomeStorageTransSearch extends HomeStorageTransaction
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'currency_id', 'quantity'], 'integer'],
            [['created_time'], 'safe'],
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
        $query = HomeStorageTransaction::find();
        $endfrom = $params['HomeStorageTransSearch']['created_time_from'];
        $endto = $params['HomeStorageTransSearch']['created_time_to'];
        if ($endfrom != null) {
            $query->andWhere('CREATED_TIME >= :from ', ['from' => date('Y-m-d', strtotime($endfrom))]);
        }
        if ($endto != null) {
            $query->andWhere('CREATED_TIME <= :to ', ['to' => date('Y-m-d', strtotime($endto))]);
        }

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
            'currency_id' => $this->currency_id,
            'quantity' => $this->quantity,
            'created_time' => $this->created_time,
        ]);

        return $dataProvider;
    }
}
