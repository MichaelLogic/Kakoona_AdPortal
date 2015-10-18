var current = Date.now();

var startDate = $("#ad_campaign_start_date").val();
var endDate = $("#ad_campaign_end_date").val();

if(startDate.length > 1){
	$('#start_datetimepicker').datetimepicker({
		format: moment(startDate, "YYYY-MM-DDTHH:mm:ssZZ"),
        defaultDate: moment(current).format("YYYY-MM-DDTHH:mm:ssZZ")  
    });

	$('#end_datetimepicker').datetimepicker({
			format: moment(endDate, "YYYY-MM-DDTHH:mm:ssZZ"),
	        defaultDate: moment(current).add(90, 'days').format("YYYY-MM-DDTHH:mm:ssZZ")
	});
}else{
	$('#start_datetimepicker').datetimepicker({
        defaultDate: moment(current).format("YYYY-MM-DDTHH:mm:ssZZ")  
    });

	$('#end_datetimepicker').datetimepicker({
	        defaultDate: moment(current).add(90, 'days').format("YYYY-MM-DDTHH:mm:ssZZ")
	});
}


$("#start_datetimepicker").on("dp.change", function (e) {
    $('#end_datetimepicker').data("DateTimePicker").minDate(e.date);
});
$("#end_datetimepicker").on("dp.change", function (e) {
    $('#start_datetimepicker').data("DateTimePicker").maxDate(e.date);
});

//alert("DATE VAL:  " + $('start_datetimepicker').val());