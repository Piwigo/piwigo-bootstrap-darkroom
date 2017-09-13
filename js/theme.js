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
            .height('auto')
            .find('.col-outer').each(function() {
                $(this).removeClass('col-lg-12 col-md-12 col-sm-12 col-xs-12')
                    .addClass($(this).data('grid-classes'))
                    .one(
                        'webkitTransitionEnd',
                        function () {
                            $('#content').find('.col-inner').equalHeights();
                        })
            })
            .find('.col-inner')
                .height('auto');
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
                $(this).removeClass($(this).data('grid-classes'))
                    .addClass('col-lg-12 col-md-12 col-sm-12 col-xs-12')
                    .one(
                    'webkitTransitionEnd',
                    function () {
                        $('#content').find('.col-inner').equalHeights();
                    })
            })
            .find('.col-inner')
                .height('auto');
    });

    // Side bar
    var sidebar = $("#sidebar");
    var theImage = $('#theImage')
    if (sidebar.length && theImage.length) {
        sidebar.css('top', (theImage.offset().top + 20) + 'px');
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

    // common issue, still needed in v4?
    $('#navbar-menubar .navbar-form').css({'color': $('.navbar-nav>li>a').css('color')});
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


