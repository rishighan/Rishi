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
		    }
	   	});
	 });
        
           
        	var $nav = $('<div id="hero-nav"></div>').insertAfter(this);
        	
        	
        	$('.hero-module').cycle({
        	        fx:     'fade',
        	        speed:   300,
        	        timeout: 0,
        	        pager:   $nav,
					before: populateBGImages()
        	});

			function populateBGImages(){
				$('.hero-module img').each(function(index)
				{
					
					//alert(index+': '+ $(this).attr('src'));
					$('#mitra').replace('<span id= "'+index+'" style="background:url("'+$(this).attr('src')+'") 0 0 no-repeat;" ></span>');
					$('#mitra').append('adas');
				});
			}
				
			
      
 
    
 });
