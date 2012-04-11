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
        
           
        	
        
		$('#hero img').each(function(){
					
			//alert(index+': '+ $(this).attr('src'));
			var something = '<span style="background:url('+$(this).attr('src')+') 0 0 no-repeat; width:100%; height:300px;" class="slides" ></span>';
			$('#hero').append(something);
			console.log('this is reached');
			return true;
					
		});

		$('#hero').cycle({

			fx:'scrollRight',
			slideExpr:'span',
			timeout:0,
			speed:100
		})

    
 });
