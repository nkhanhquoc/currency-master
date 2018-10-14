<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\HomeStorageTransaction;

/**
 * HomeSendSearch represents the model behind the search form about `\backend\models\HomeStorageTransaction`.
 */
class HomeSendSearch extends HomeStorageTransaction
{
  var $fromTime;
  var $toTime;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'currency_id', 'quantity', 'type'], 'integer'],
            [['created_time', 'note'], 'safe'],
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
            'type' => 2,
        ]);

        $query->andFilterWhere(['like', 'note', $this->note]);
        $this->fromTime = $params['HomeStorageTransSearch']['created_time_from'];
        $this->toTime = $params['HomeStorageTransSearch']['created_time_to'];
        if ($this->fromTime != null) {
            $query->andFilterWhere(['>=', 'created_time', date('Y-m-d', strtotime($this->fromTime))]);
        }
        if ($this->toTime != null) {
            $query->andFilterWhere(['<=', 'created_time', date('Y-m-d 23:59:59', strtotime($this->toTime))]);
        }

        return $dataProvider;
    }
}
