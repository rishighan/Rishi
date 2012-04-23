// Rishi Ghan
// rishighan.com
// carousels running on jQuery Cycle


$(document).ready(function(){
	
	// In-post carousels
	$('.post-carousel').each(function() {
	   	var $nav = $('<div id="carousel-nav"></div>').insertAfter(this);
			    	
			    	
	   	$(this).cycle({
	        fx: 'scrollRight',
			slideExpr: '.slide',
			slideResize: 0,
			speed:   800,
	        timeout: 0,
	        pager:   $nav,
		  
			pagerAnchorBuilder: function() {
		        return '<a href="#" class="activeSlide"></a>';
		    }
	   	});
	 });

		// Hero Carousel
		//var $nav = $('<div id="hero-carousel-nav"></div>').insertAfter('#hero');
		$('#hero').cycle({
			slideExpr:'span',
			fx:'scrollRight',	
			// timeout:0,
			speed:800,
			slideResize:0
			
			// Navigation
			// pager:$nav,
			// 		pagerAnchorBuilder: function(slide) {
			// 	        return '<a href="#" class="activeSlide">'+slide+'</a>';
			// 	    }
		})
		
	
		

    
 });
