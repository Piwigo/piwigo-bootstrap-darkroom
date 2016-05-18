/* changeElementType: this function changes element types. e.g. <div> to <ul> */
(function($) {
    $.fn.changeElementType = function(newType) {
        var attrs = {};
        if (!(this[0] && this[0].attributes))
            return;

        $.each(this[0].attributes, function(idx, attr) {
            attrs[attr.nodeName] = attr.nodeValue;
        });
        this.replaceWith(function() {
            return $("<" + newType + "/>", attrs).append($(this).contents());
        });
    }
})(jQuery);



/* Batch Downloader START */
$(document).ready(function() {
  $('#batchDownloadLink').closest('li').addClass('dropdown');
  $('#batchDownloadLink').addClass('dropdown-toggle').removeClass('pwg-state-default pwg-button').attr('data-toggle', 'dropdown').attr('href', '#');
  $('#batchDownloadLink .pwg-button-text').after('<span class="caret"></span>');
  $('#batchDownloadBox').changeElementType('ul');
  $('#batchDownloadBox a').wrap('<li></li>');
  $('#batchDownloadBox').attr('role', 'menu').attr('style', '');
  $('#batchDownloadBox .switchBoxTitle').changeElementType('li');
  $('#batchDownloadBox .switchBoxTitle').addClass('dropdown-header').removeClass('switchBoxTitle');
  $('#batchDownloadBox br').remove();
  $('#batchDownloadBox').addClass('dropdown-menu').removeClass('switchBox');
});
$(window).load(function() {
  $('#batchDownloadLink').off().on('click', function() { $('#downloadSizeLink').dropdown() });
});
/* Batch Downloader END */


/* Download by Size START */
$(document).ready(function() {
  var liDownloadSizeLink = $('#downloadSizeLink').closest('li');
  $('#downloadSizeBox').appendTo(liDownloadSizeLink);
  $(liDownloadSizeLink).addClass('dropdown');
  $('#downloadSizeLink').addClass('dropdown-toggle').removeClass('pwg-state-default pwg-button').attr('data-toggle', 'dropdown');
  $('#downloadSizeLink .pwg-button-text').after('<span class="caret"></span>');
  $('#downloadSizeBox').changeElementType('ul');
  $('#downloadSizeBox a').wrap('<li></li>');
  $('#downloadSizeBox').attr('role', 'menu').attr('style', '');
  $('#downloadSizeBox .switchBoxTitle').changeElementType('li');
  $('#downloadSizeBox .switchBoxTitle').addClass('dropdown-header').removeClass('switchBoxTitle');
  $('#downloadSizeBox br').remove();
  $('#downloadSizeBox').addClass('dropdown-menu').removeClass('switchBox');
});

$(window).load(function() {
  $('#downloadSizeBox').off('mouseleave click');
  $('#downloadSizeLink').off().on('click', function() { $('#downloadSizeLink').dropdown() });
});
/* Download by Size END */
