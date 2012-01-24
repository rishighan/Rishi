$(document).ready(function(){

    $('.post-carousel').each(function() {
    	var $nav = $('<div id="nav"></div>').insertAfter(this);
    	$('<div class="caption">&nbsp;</div>').insertAfter($nav);
    	
    	$(this).cycle({
	        fx:     'scrollRight',
	        speed:   300,
	        timeout: 0,
	        pager:   $nav,
	        after:   onAfter
    	});
    });
    
    function onAfter(curr, next, opts) {
    
    }
    
 });
