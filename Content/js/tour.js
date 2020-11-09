(function($)
{
	"use strict";
	
	
	jQuery(window).on('load', function() {
		
		
		jQuery('#filter-list input').on("click", function(){
			jQuery('#filter-list input').removeClass('active');
			jQuery(this).addClass('active');
		});
	});	
})(jQuery);	

//function HienThiTour() {
//	$.ajax({
//		type: 'GET',
//		data: { place: $('#location').val(), day: $('#daynumber').val()},
//		url: 'TourByName_Day',
//		success: function (result) {
//			$('#tourbyname_day').html(result);
//		},
//		error: function (e) {
//			alert(e.responseText);
//		}
//	});
//}
function HienThiTour(value) {
	var e = document.getElementById("price_down");
	var e2 = document.getElementById("price_up");
	var v = e.value;
	var v2 = e2.value;
	document.location.href = '/Tour/Index/?sortorder=' + value + '&place=' + $('#location').val() + '&day=' + $('#daynumber').val()+'&pricedown='+v+'&priceup='+v2;
}
function Sortby(value) {
	document.location.href = '/Tour/Index/?sortorder=' + value + '&place=' + $('#location').val() + '&day=' + $('#daynumber').val();
}
function CapnhatView(value) {
		$.ajax({
		type: 'POST',
		data: { matour: value},
		url: '/Tour/CapnhatView',
		success: function (result) {
			//alert('success');
		},
		error: function (e) {
			alert(e.responseText);
		}
	});
}