$('#variant_select').live('change', function() {
	pricebox = $(this).prevAll('.price')
	alert(pricebox)
})