jQuery(function(){
$("#insert_into_post").click(function() {
  
 var sumtin = $(this).prev().val();

 var filename = sumtin.split('\\').pop();

 // appending the text to textarea
 $('#post_content').val($('#post_content').val()+'<img src="/public/system/attachments/'+filename+'" />'); 
    
});

// Initialzes Create Reminder Modal Box
// $("#new_reminder_dialog").dialog({
    // autoOpen: false,
    // height: 350,
    // width: 350,
    // modal: true,
    // buttons: {
        // 'Create New Reminder': function() {
            // $('#new_reminder').submit();
        // },
        // Cancel: function() {
            // $(this).dialog('close');
        // }
    // },
    // close: function() {
            // allFields.val('').removeClass('ui-state-error');
    // }
// });
});

