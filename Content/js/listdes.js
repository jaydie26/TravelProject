$("map[name=hmap8807]").mapoid();
function writeText(txt) {
    document.getElementById("Aarea").innerHTML = txt;
}
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