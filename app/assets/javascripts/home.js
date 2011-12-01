$(document).ready(function() {
   $('.carousel-container').before('<div id="nav">').cycle({ 
    fx:     'turnDown', 
    speed:  'fast', 
    timeout: 3000, 
    pager:  '#nav' 
});
});