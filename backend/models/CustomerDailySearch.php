<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Bill;

/**
 * CustomerDailySearch represents the model behind the search form about `\backend\models\Bill`.
 */
class CustomerDailySearch extends Bill
{
    /**
     * @inheritdoc
     */
     public $created_from;
     public $created_to;
    public function rules()
    {
        return [
            [['id', 'type', 'customer_id', 'customer_type', 'is_export'], 'integer'],
            [['code', 'value', 'note', 'receiver', 'deposit', 'fee', 'created_date'], 'safe'],
        ];
    }

    public function attributeLabels() {
        return [
            'created_from' => 'Thời gian lập từ',
            'created_to' => 'Thời gian lập đến',
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
            'sort' => ['defaultOrder' => ['id' => SORT_DESC]],
            'pagination' => false
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
          // $query->where([]);
        if($params['CustomerDailySearch']['created_from'])
        $query->andWhere(['>=','created_date',$params['CustomerDailySearch']['created_from']]);

        if($params['CustomerDailySearch']['created_to'])
        $query->andWhere(['<=','created_date',$params['CustomerDailySearch']['created_to']]);

        if($this->customer_id)
        $query->andWhere(['customer_id'=>$this->customer_id]);
        $query->andWhere(['is_export'=>1]);

        // $query->andFilterWhere([
        //     'id' => $this->id,
        //     'type' => $this->type,
        //     'customer_id' => $this->customer_id,
        //     'customer_type' => $this->customer_type,
        //     'created_date' => $this->created_date,
        //     'is_export' => $this->is_export,
        // ]);
        //
        // $query->andFilterWhere(['like', 'code', $this->code])
        //     ->andFilterWhere(['like', 'value', $this->value])
        //     ->andFilterWhere(['like', 'note', $this->note])
        //     ->andFilterWhere(['like', 'receiver', $this->receiver])
        //     ->andFilterWhere(['like', 'deposit', $this->deposit])
        //     ->andFilterWhere(['like', 'fee', $this->fee]);

        return $dataProvider;
    }
}
