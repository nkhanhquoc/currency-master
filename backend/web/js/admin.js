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
	$('[name^="hide-on-print"]').hide();
	$('[name^="show-on-print"]').show();
	$('#'+id).printThis({
		importCSS: false,
		importStyle: false,
		loadCSS: './../plugins/bootstrap/css/bootstrap.min.css',
		printContainer: false,
		removeInline: false,
		pageTitle: "Hóa Đơn",
		formValues: false
	});
	// $('[name^="show-on-print"]').hide();
}
