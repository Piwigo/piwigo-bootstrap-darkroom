/* http://www.imaginacom.com/eval.php */
(function($) {
    $.fn.dClickOutside = function(options, cb){
        if(typeof options == 'function'){
            var tmp = options;
            options = cb;
            cb      = tmp;
            delete tmp;
        }
        var options = $.extend({
            onlyWhenVisible: true,
            ignoreList:      false
        }, options);
 
        this.each(function(){
            var mainEl = $(this);
 
            if(mainEl.data('cbClickOutsideTurnOff')){
                mainEl.data('cbClickOutsideTurnOff').call();
                mainEl.removeData('cbClickOutsideTurnOff');
            }
            if(!cb){
                return true;
            }
 
            var _handleClick = function(ev){
                var clickedOn = $(ev.target);
                var parents = clickedOn.parents();
                if(!clickedOn.is(mainEl) && parents.index(mainEl) == -1){
                    if(options.onlyWhenVisible && !mainEl.is(":visible")){
                        return true;
                    }
                    if(options.ignoreList && (clickedOn.is(options.ignoreList) || parents.index(options.ignoreList) !== -1) ){
                        return true;
                    }
 
                    cb.call(mainEl, clickedOn, ev);
                }
            };
            var _disableClick = function(){
                $(document).off('mousedown', _handleClick);
            };
 
            $(document).on('mousedown', _handleClick);
            mainEl.data('cbClickOutsideTurnOff',  _disableClick);

            return mainEl;
        });
 
        return this;
    };
 
    var oldRemove = $.fn.remove;
    $.fn.remove  = function(){
        $(this).dClickOutside(false);
        return oldRemove.apply(this, arguments);
    }
})(jQuery);

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

$(document).ready(function() {
  /* Batch Downloader */
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
  $('#batchDownloadBox').dClickOutside({ ignoreList: $('.dropdown-toggle') },function() { $('#batchDownloadLink span').click(); });

  /* Download by Size */
  var liDownloadSizeLink = $('#downloadSizeLink').closest('li');
  $('#downloadSizeBox').appendTo(liDownloadSizeLink);
  /* This plugin is so tricky.. no way to fix it..
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
  $('#downloadSizeBox').dClickOutside({ ignoreList: $('.dropdown-toggle') },function() { $('#batchDownloadLink span').click(); });
  */

});
