<?php
use yii\widgets\ActiveForm;
?>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <!-- <h5 class="modal-title" id="exampleModalLabel">Thêm hóa đơn</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button> -->
      </div>
      <div class="modal-body ">
        <table class="table">
          <tr>
            <td class="form-group">
              <select id="add-bill-type" class="form-control" placeholder="Mã hóa đơn">
                <?php foreach($model->getTypeRefBill() as $kk => $type):?>
                  <option value="<?= $kk ?>"><?= $type ?></option>
                <?php endforeach; ?>
              </select>
            </td>
            <td class="form-group">
              <select class="form-control" id="add-bill-customer">
                <?php foreach($model->getAllCustomer() as $k => $cus):?>
                  <option value="<?= $k ?>"><?= $cus ?></option>
                <?php endforeach ?>
              </select>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <button class="btn btn-success" onclick="findBill()"><i class="fa fa-spin"></i>Tìm kiếm</button>
            </td>
          </tr>
        </table>

        <table class="table table-striped" id="add-bill-result" style="display:none">
          <tr id="result-head">
            <th><input type="checkbox" id="add-bill-checkall" onclick="checkAll()"/></th>
            <th>Mã Hóa Đơn</td>
            <th>Loại Hóa Đơn</td>
          </tr>          
          <tbody id="result-content">
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
        <button type="button" onclick="addHtmlBill()" class="btn btn-primary" data-dismiss="modal">Thêm</button>
      </div>
    </div>
  </div>
</div>
