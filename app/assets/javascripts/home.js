$(document).ready(function(){
	

	$('.post-carousel').each(function() {
	   	var $nav = $('<div id="carousel-nav"></div>').insertAfter(this);
			    	
			    	
	   	$(this).cycle({
	        fx:     'scrollRight',
			slideExpr: '.slide',
			slideResize: 0,
			speed:   300,
	        timeout: 0,
	        pager:   $nav,
		  
			pagerAnchorBuilder: function() {
		        return '<a href="#" class="activeSlide"></a>';
		    },
			beforeFunction:function(){
				alert('hi!');
			}
			
	   	});
	 });
        // 
        //    $('.carousel-container').each(function() {
        // 	var $nav = $('<div id="nav"></div>').insertAfter(this);
        // 	
        // 	
        // 	$(this).cycle({
        // 	        fx:     'scrollRight',
        // 	        speed:   300,
        // 	        timeout: 0,
        // 	        pager:   $nav
        // 	});
        // });
 
    
 });
