function insertCarouselMarkup() {

	var textarea = $('#post_content');
	var markup = '<div class="post-carousel"> </div>';

	textarea.val(textarea.val() + markup);

}


function insertSuperScriptMarkup(con)
{
	
	// pattern for matching 
	// ^(post_citations_attributes_[0-9]{1,3}_extended_description)$
	var markup = '<sup> </sup>';
    var context = $(con).prevAll('textarea')

    $(context).val($(context).val() + markup)

	
}

$(document).ready(function() {
	$('#post_category_id').change(function() {

		if($(this).val() == '1')
			$('#citations').fadeIn(300);
		
		else
		{
			$('#citations :input').val('')
			$('#citations').fadeOut(300);
			

		}
	})
})