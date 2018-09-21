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

	// End fix ui/ux



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
