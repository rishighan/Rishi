function insertMarkup(objt, markuptype) {
	switch (markuptype) {

		// image markup <img>
		case 'image':
			var hrefs = $(objt).prevAll('a').attr('href')
			var markup = "<img src='" + hrefs + "' />"

			// need a better strategy to traverse and select the textarea.
			var textarea = $("#post_content")
			textarea.insertAtCaret(markup)
			break;

		// carousel markup <div class=post-carousel>
		case 'carousel':
			var context = $(objt).prevAll('textarea')
			var markup = '<div class="post-carousel"> </div>';

			$(context).insertAtCaret(markup)

			break;

		// superscript markup <sup>
		case 'superscript':

			// pattern for matching, poor approach.
			// thinking out loud, but I may change the name of the attribute and the pattern would
			// have to change.
			// ^(post_citations_attributes_[0-9]{1,3}_extended_description)$

			var markup = '<sup> </sup>';
			var context = $(objt).prevAll('textarea')

			$(context).insertAtCaret(markup)

			break;

		// code markup <code>
		case 'code':
			var markup = '<pre><code>  </code></pre>';
			var context = $(objt).prevAll('textarea')

			$(context).insertAtCaret(markup);
			
			break;

	};
}


$(document).ready(function() {
	$('#post_category_id').change(function() {

		if($(this).val() == '1')
			$('#citations').fadeIn(300);
		
else {
			$('#citations :input').val('')
			$('#citations').fadeOut(300);

		}
	})
	// insert at cursor position

	$.fn.extend({
		insertAtCaret : function(myValue) {
			return this.each(function(i) {
				if(document.selection) {
					//For browsers like Internet Explorer
					this.focus();
					sel = document.selection.createRange();
					sel.text = myValue;
					this.focus();
				} else if(this.selectionStart || this.selectionStart == '0') {
					//For browsers like Firefox and Webkit based
					var startPos = this.selectionStart;
					var endPos = this.selectionEnd;
					var scrollTop = this.scrollTop;
					this.value = this.value.substring(0, startPos) + myValue + this.value.substring(endPos, this.value.length);
					this.focus();
					this.selectionStart = startPos + myValue.length;
					this.selectionEnd = startPos + myValue.length;
					this.scrollTop = scrollTop;
				} else {
					this.value += myValue;
					this.focus();
				}
			})
		}
	});
})