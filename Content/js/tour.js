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