<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Bill;

class OtherTransferSearch extends Bill
{
  /**
   * @inheritdoc
   */
  public function rules()
  {
      return [
          [['id', 'type', 'customer_id', 'customer_type','is_export'], 'integer'],
          [['code', 'value', 'note', 'receiver', 'deposit', 'fee', 'created_date'], 'safe'],
      ];
  }

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
          'type' => 6,
          'customer_id' => $this->customer_id,
          'is_export' => $this->is_export,
          'customer_type' => $this->customer_type,
          'created_date' => $this->created_date,
      ]);

      $query->andFilterWhere(['like', 'code', $this->code])
          ->andFilterWhere(['like', 'value', $this->value])
          ->andFilterWhere(['like', 'note', $this->note])
          ->andFilterWhere(['like', 'receiver', $this->receiver])
          ->andFilterWhere(['like', 'deposit', $this->deposit])
          ->andFilterWhere(['like', 'fee', $this->fee]);

      return $dataProvider;
  }

  public function filterIsExport(){
    return [
      0 => "Chưa xuất",
      1 => "Đã xuất"
    ];
  }

}
