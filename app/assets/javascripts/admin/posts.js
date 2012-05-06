function insertMarkup(objt, markuptype, position) {
	switch (markuptype) {

		// image markup <img>
		case 'image':
			var hrefs = $(objt).attr('id')
			var markup = '<img src="'+ hrefs +'" class="slide" />'

			// need a better strategy to traverse and select the textarea.
			var textarea = $("#post_content")
			textarea.insertAtCaret(markup)
			break;
			
		case 'file':
			
			var hrefs = $(objt).attr('id')
			var markup = '<a href="'+ hrefs +'"></a>'

			var textarea = $("#post_content")
			textarea.insertAtCaret(markup)
			break;

		// carousel markup <div class=post-carousel>
		case 'carousel':
			// hacking jQuery Cycle to insert a dummy GIF as the first slide to 
			// set the width and the height.
			// TODO: set the dimensions for dummy.gif dynamically
			var dummygif = 'dummy.gif';
			var context = $(objt).nextAll('textarea');
			var markup = '<div class="post-carousel"> <img src="/assets/'+dummygif+'" /></div>';
			
			$(context).insertAtCaret(markup)

			break;

		// superscript markup <sup>
		case 'superscript':

			// pattern for matching, poor approach.
			// thinking out loud, but I may change the name of the attribute and the pattern would
			// have to change.
			// ^(post_citations_attributes_[0-9]{1,3}_extended_description)$

			var markup = '<sup> </sup>';
			//to check for the position of the textarea, before the button or after.
			position==0? context = $(objt).prevAll('textarea') : context =$(objt).nextAll('textarea')
			console.log(context)
			$(context).insertAtCaret(markup)

			break;

		// code markup <code>
		case 'code':
			var markup = '<pre lang="">     </pre>';
			var context = $(objt).nextAll('textarea')

			$(context).insertAtCaret(markup);
			
			break;

	};
}


$(document).ready(function() {

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