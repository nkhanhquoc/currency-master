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
    /**
     * @inheritdoc
     */
     var $fromTime;
     var $toTime;
    public function rules()
    {
        return [
            [['id', 'currency_id', 'quantity'], 'integer'],
            [['created_time','fromTime','toTime'], 'safe'],
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
        $query ="select currency_id,sum(quantity) as quantity, DATE_FORMAT(created_time,'%Y-%m-%d') as created_time
        from home_storage_transaction  where type = 2 ";
        // ->bindValue(":value",$value)
        // ->bindValue(":currency",$currId)
        $this->fromTime = $params['HomeStorageTransSearch']['created_time_from'];
        $this->toTime = $params['HomeStorageTransSearch']['created_time_to'];
        if ($this->fromTime != null) {
            $query .= ' and CREATED_TIME >= "'.date('Y-m-d', strtotime($this->fromTime)).'"';
        }
        if ($this->toTime != null) {
            $query .= ' and CREATED_TIME <= "'.date('Y-m-d 23:59:59', strtotime($this->toTime)).'"';
        }

        if($this->currency_id){
          $query .= ' and currency_id = '.$this->currency_id;
        }
        $query .= " group by currency_id,DATE_FORMAT(created_time,'%Y-%m-%d') order by created_time desc,currency_id";
        $query  =  HomeStorageTransaction::findBySql($query);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => ['defaultOrder' => ['created_time' => SORT_DESC]]
        ]);


        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }


        return $dataProvider;
    }
}
