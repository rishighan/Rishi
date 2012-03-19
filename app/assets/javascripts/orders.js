$('#variant_select').live('change', function() {
	pricebox = $(this).prevAll('.price')
	$.post('/store', function(data) {
		//pricebox.html('sumtin')
	});
})