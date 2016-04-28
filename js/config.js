$(document).bind("mobileinit", function(){
 $.extend(  $.mobile , {
   ajaxEnabled: false,
   hashListeningEnabled: false,
   pushStateEnabled: false
 });
});

//$(document).ready(function() {
    var sidebar = $("#sidebar");
    var theImage = $('#theImage')
    if (sidebar.length && theImage.length) {
        sidebar.css('top', (theImage.offset().top - 10) + 'px !important');
    }
//});

