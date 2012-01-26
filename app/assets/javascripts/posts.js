function insertCarouselMarkup(){
	
	
	var textarea = $('#post_content');
	var markup = '<div class="post-carousel"> </div>';
	
	textarea.val(textarea.val()+markup);
	
}


$(document).ready(function(){
$('#post_category_id').change(function(){
	

if($(this).val() == '1')
$('#citations').fadeIn(300);

else
$('#citations').fadeOut(300);
	
})



})
