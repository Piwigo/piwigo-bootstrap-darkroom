var gRatingOptions, gRatingButtons, gUserRating;

function makeNiceRatingForm(options)
{
	gRatingOptions = options;
	var form = $('#rateForm');
	if (!form) return; //? template changed

	gRatingButtons = form.find('span');
	gUserRating = "";
	gRatingButtons.each(function() {
        if ($(this).hasClass('rateButtonStarFull')) {
            gUserRating = $(this).data('value');
        }
    });

    gRatingButtons.each(function() {
        $(this).data('initialRateValue', $(this).data('value'));

        pwgAddEventListener($(this).get(0), "click", updateRating);
        pwgAddEventListener($(this).get(0), "mouseout", function() {updateRatingStarDisplay( gUserRating );});
        pwgAddEventListener($(this).get(0), "mouseover", function(e) {
            updateRatingStarDisplay(e.target ? $(e.target).data('initialRateValue') : $(e.srcElement).data('initialRateValue'));
        });
    });

	updateRatingStarDisplay(gUserRating);
}

function updateRatingStarDisplay(userRating)
{
    gRatingButtons.each(function() {
        $(this).addClass(userRating !=="" && userRating >= $(this).data('initialRateValue') ? 'rateButtonStarFull' : 'rateButtonStarEmpty');
        $(this).removeClass(userRating !=="" && userRating >= $(this).data('initialRateValue') ? 'rateButtonStarEmpty' : 'rateButtonStarFull');
    });
}

function updateRating(e)
{
	var elem = e.target || e.srcElement;
    var rateButton = $(elem);
    if (rateButton.data('disabled') == true || rateButton.data('initialRateValue') == gUserRating) {
        return false; //nothing to do
    }

    gRatingButtons.each(function() {
        rateButton.data('disabled', true);
    });

	var y = new PwgWS(gRatingOptions.rootUrl);
	y.callService(
		"pwg.images.rate", {image_id: gRatingOptions.image_id, rate: rateButton.data('initialRateValue') } ,
		{
			method: "POST",
			onFailure: function(num, text) {
				alert(num + " " + text);
				document.location = $('#rateForm').attr('action') + "&rate=" + rateButton.data('initialRateValue');
			},
			onSuccess: function(result) {
				gUserRating = rateButton.data('initialRateValue');
                gRatingButtons.each(function() {
                    rateButton.data('disabled', false);
                });
				if (gRatingOptions.onSuccess) gRatingOptions.onSuccess(result);
				if (gRatingOptions.updateRateElement) gRatingOptions.updateRateElement.innerHTML = gRatingOptions.updateRateText;
				if (gRatingOptions.ratingSummaryElement)
				{
					var t = gRatingOptions.ratingSummaryText;
					var args =[result.score, result.count, result.average], idx = 0, rexp = new RegExp( /%\.?\d*[sdf]/ );
					while (idx<args.length) t=t.replace(rexp, args[idx++]);
					gRatingOptions.ratingSummaryElement.innerHTML = t;
				}
			}
		}
	);
	return false;
}

(function() {
if (typeof _pwgRatingAutoQueue!="undefined" && _pwgRatingAutoQueue.length)
{
    for (var i=0; i<_pwgRatingAutoQueue.length; i++)
        makeNiceRatingForm(_pwgRatingAutoQueue[i]);
}
_pwgRatingAutoQueue = {
	push: function(opts) {
		makeNiceRatingForm(opts);
	}
}
})();