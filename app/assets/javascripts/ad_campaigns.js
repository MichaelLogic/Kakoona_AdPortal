

var current = Date.now();

$('#start_datetimepicker').datetimepicker({
        defaultDate: moment(current).format("YYYY-MM-DDTHH:mm:ssZZ")
        
    });

$('#end_datetimepicker').datetimepicker({
        defaultDate: moment(current).add(90, 'days').format("YYYY-MM-DDTHH:mm:ssZZ")
});
$("#start_datetimepicker").on("dp.change", function (e) {
    $('#end_datetimepicker').data("DateTimePicker").minDate(e.date);
});
$("#end_datetimepicker").on("dp.change", function (e) {
    $('#start_datetimepicker').data("DateTimePicker").maxDate(e.date);
});