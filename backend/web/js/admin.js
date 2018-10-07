$(document).ready(function () {
	// Fix ui/ux
	$('#page-loading').hide();
	$('table td a span.glyphicon').parent().css('margin-right', '10px');
	$("form:not(.filter) .control-label:visible:first").click();
	$('#mainGridPjax')
		.on('pjax:start', function() {
			$('#page-loading').show();
		})
		.on('pjax:end',   function() {
			$('#page-loading').hide();
		});

	$(document).on("click", ".captcha-refresh-icon", function () {
		$(this).prev().click();
		$('#loginform-captcha').focus();
	})
	// Forcus vao input nhap captcha o login
	$('#loginform-captcha-image').click(function () {
		$('#loginform-captcha').focus();
		return true;
	});
	$('#frm-btn-submit').click(function () {
		$("#list-assigned option").prop("selected", "selected");
		$("form:first").submit();
	});


	$('.img_hover').hover(function() {
//        $(".img_hover").addClass('transition');
        $(this).addClass('transition');

        }, function() {
            $(".img_hover").removeClass('transition');
        });

});


function changeBillCode(){
  var value = $('#bill-customer_id :selected').text();
  billcode[2] = value;
  $('#bill_code').val(billcode.join('-'));
}

function addTransaction(){
	// index += 1;
	// var tr = trr.replace('<td name="trr-index"></td>','<td name="trr-index">'+index+'</td>')
	$('#tr-sum').before(trr);
	remakeNumber();
	return false;
}

function remakeNumber(){
	var index = 0;
	// console.log($('[name^=trr-index]')[0]);
	Array.from($('[name^=trr-index]')).forEach(function(trrindex){
		trrindex.innerHTML = ++index;
	});
}

function removeTrans(object){
		object.parentNode.parentNode.remove();
		remakeNumber();
}

function printBill(id){
	$('#'+id).printThis({
		importCSS: true,
		importStyle: true,
		loadCSS: 'http://127.0.0.1:8000/plugins/bootstrap/css/bootstrap.min.css',
		printContainer: true,
		removeInline: false,
		formValues: true
	});
	// $('[name^="show-on-print"]').hide();
}

function preview(){
	var html = $('#bill-content').html();
	$('#preview-content').html(html);
}

function changeTransValue(object){
	var selectTr = object.parentNode.parentNode;
	var quan = $(selectTr).find("input[name^='trans[quantity]']");
	var price = $(selectTr).find("input[name^='trans[exchange_rate]']");
	var ret = $(selectTr).find("input[name^='trans[value]']");
	var typeTrans = $(selectTr).find("select[name^='trans[type]'] :selected").val();
	if([1,9].includes(parseInt(typeTrans))){
		ret.val(0 - price.val()*quan.val());
	} else {
		ret.val(price.val()*quan.val());
	}
	updateBillValue();
}

function updateBillValue(){
	var currVal = 0;
	$.each($('input[name^="trans[value]"]'),function(index,object){
		 currVal += parseFloat($(object).val());
		 $('#bill-value').val(currVal);
	});
	var deposit = $("#bill-deposit").val();
	if(deposit !== undefined && deposit !== "" && deposit !== null){
			currVal+=parseFloat(deposit);
			$('#bill-value').val(currVal);
	}
	$("#bill-value-view").val(currVal.toLocaleString());//hien thi de xem
}

function otherTransferValue(object){
	var selectTr = object.parentNode.parentNode;
	var quan = $(selectTr).find("input[name^='trans[quantity]']");
	var fee = $(selectTr).find("input[name^='trans[fee]']");
	var ret = $(selectTr).find("input[name^='trans[real_value]']");
	var typeTrans = $(selectTr).find("select[name^='trans[type]'] :selected").val();
	if([1,9].includes(parseInt(typeTrans))){
		ret.val(0 - (quan.val() - fee.val()*quan.val()/100));
	} else {
		ret.val(quan.val() - fee.val()*quan.val()/100);
	}
}


function findBill(){
	clearDataContent();
	var billType = $('#add-bill-type').val();
	var billCus = $('#add-bill-customer').val();
	if(billType === undefined && billCus === undefined) alert("Phải thêm dữ liệu tìm kiếm!");
	$.post('/fast-bill/getbill',{
		type: billType,
		cus: billCus
	},function(data){
		// var datajso = JSON.parse(data);
		if(data.errorCode === 0){
			var list = data.data;
			if(list.length > 0){
				list.forEach(function(bill){
					var rstr = '<tr>';
					rstr +='<td><input type="checkbox"'+(checkInRef(bill.id) ? 'checked="checked"':'') +'" onclick="checkDetail(this)" id="check_'+bill.id+'" value="'+bill.id+'"/></td>';
					rstr +='<td class="form-group"><a target="_blank" href="'+bill.url+'">'+bill.code+'</a></td>';
					rstr +='<td class="form-group">'+bill.type+'</td>';
					$('#result-content').append(rstr);
				});
			} else {
				$('#result-content').html("Không tìm thấy hóa đơn!");
			}

		}
	});
}

function checkDetail(object){
	var isAllcheck = true;
	var id = $(object).val();
	if($(object).is(':checked')){
		listRefId.push(id);
	} else {
		if(listRefId.includes(id)){
			listRefId.splice(listRefId.indexOf(id),1);
		}
	}

	$('input[id^="check_"]').each(function(){
		if(!$(this).is(':checked')){
			isAllcheck = false;
		}
	});
	$('#add-bill-checkall').prop('checked',isAllcheck);
}

function checkAll(){
	var ischeck = $('#add-bill-checkall').prop('checked');
	$('input[id^="check_"]').each(function(){
		$(this).prop('checked',ischeck);
		if(!ischeck){
			if(listRefId.includes($(this).val())){
				listRefId.splice(listRefId.indexOf($(this).val()),1);
			}
		} else {
			listRefId.push($(this).val());
		}
	});
}

function checkInRef(id){
	return listRefId.includes(id);
}

function addHtmlBill(){
	$('#ref-bill-id').val(listRefId.toString());
	$.post('/fast-bill/addbill',{
		billids: listRefId
	},function(data){
		if(data.errorCode === 0){

			var list = data.data;
			console.log("list",list);
			if(list.length > 0){
				$('#list-ref-content').html('');
				for(var i = 0;i< list.length; i++){
					var itemtr = '<tr class="list-group-item-info">';
					itemtr += '<td colspan="6">'+list[i].code+'</td>';
					itemtr += '<td><button class="btn btn-danger" onclick="removeTrans(this);return false;"><i class="glyphicon glyphicon-remove"></i></button></td>';
					itemtr += '</tr>';
					for(var j = 0;j< list[i].trans.length;j++){
						itemtr += '<tr>';
						itemtr += '<td>'+list[i].trans[j].customer +'</td>';
						itemtr += '<td>'+list[i].trans[j].type +'</td>';
						itemtr += '<td>'+list[i].trans[j].currency_name +'</td>';
						itemtr += '<td>'+list[i].trans[j].quantity +'</td>';
						itemtr += '<td>'+list[i].trans[j].fee +'</td>';
						itemtr += '<td>'+list[i].trans[j].value +'</td>';
						itemtr += '<td><button class="btn btn-danger" onclick="removeTrans(this);return false;"><i class="glyphicon glyphicon-remove"></i></button></td>';
						itemtr += '</tr>'
					}
					$('#list-ref-content').append(itemtr);
				}
			}
		}
	});
	clearDataContent();
}

function clearDataContent(){
	$('#result-content').html('');
}
