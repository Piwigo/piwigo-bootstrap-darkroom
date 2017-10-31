$(document).ready(function() {
    // Grid view button click
    $('#btn-grid').click(function() {
        if ($(this).hasClass('active')) {
            return;
        }
        $.cookie('view', 'grid');
        $('#btn-grid').addClass('active');
        $('#btn-list').removeClass('active');
        $('#content')
            .removeClass('content-list')
            .addClass('content-grid')
            .find('.col-outer').each(function() {
                $(this).find('.card-body').attr('style', '');
                $(this).find('a').addClass('d-block').find('.card-img-left').addClass('card-img-top').removeClass('card-img-left');
                $(this).find('.card-body.list-view-only').addClass('d-none');
                $(this).find('.addCollection').removeAttr('style');
                $(this).removeClass('col-12')
                    .addClass($(this).data('grid-classes'))
                    .one(
                        'webkitTransitionEnd',
                        function () {
                            $('#content').find('.card-body').removeAttr('style').equalHeights();
                        })
            });
    });

    // List view button click
    $('#btn-list').click(function() {
        if ($(this).hasClass('active')) {
            return;
        }
        $.cookie('view', 'list');
        $('#btn-list').addClass('active');
        $('#btn-grid').removeClass('active');
        $('#content')
            .removeClass('content-grid')
            .addClass('content-list')
            .height('auto')
            .find('.col-outer').each(function() {
                $(this).find('a').removeClass('d-block').find('.card-img-top').addClass('card-img-left').removeClass('card-img-top');
                $(this).find('.card-body.list-view-only').removeClass('d-none');
                $(this).find('.addCollection').attr('style', 'width: ' + $(this).find('img').width() + 'px');
                $(this).removeClass($(this).data('grid-classes'))
                    .addClass('col-12')
                    .one(
                    'webkitTransitionEnd',
                    function () {
                        $('#content').find('.card-body').removeAttr('style').equalHeights();
                    })
            });
    });

    // Side bar
    var sidebar = $("#sidebar");
    var navigationButtons = $('#navigationButtons')
    if (sidebar.length && navigationButtons.length) {
        sidebar.css('top', (navigationButtons.offset().top + 1) + 'px');
        $('#info-link').click(function () {
            var sidebar = $('#sidebar');
            if (parseInt(sidebar.css('right')) < 0) {
                sidebar.animate({right: "+=250"}, 500);
            } else {
                sidebar.animate({right: "-=250"}, 500);
            }
            return false;
        });
    }
});

/* help popup */
function bd_popup(url) {
    window.open(url, 'bd_popup', 'alwaysRaised=yes,dependent=yes,toolbar=no,height=420,width=500,menubar=no,resizable=yes,scrollbars=yes,status=no');
}


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

/* change rgba alpha */
function setColorOpacity(colorStr, opacity) {
  if(colorStr.indexOf("rgb(") == 0)
  {
    var rgbaCol = colorStr.replace("rgb(", "rgba(");
    rgbaCol = rgbaCol.replace(")", ", "+opacity+")");
    return rgbaCol;
  }

  if(colorStr.indexOf("rgba(") == 0)
  {
    var rgbaCol = colorStr.substr(0, colorStr.lastIndexOf(",")+1) + opacity + ")";
    return rgbaCol;
  }

  if(colorStr.length == 6)
    colorStr = "#" + colorStr;

  if(colorStr.indexOf("#") == 0)
  {
    var rgbaCol = 'rgba(' + parseInt(colorStr.slice(-6, -4), 16)
        + ',' + parseInt(colorStr.slice(-4, -2), 16)
        + ',' + parseInt(colorStr.slice(-2), 16)
        + ','+opacity+')';
    return rgbaCol;
  }
  return colorStr;
}
