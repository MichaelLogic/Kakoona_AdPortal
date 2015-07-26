$(function () {
	$("#product-detail-wrap").on("click", ".btn-remove-fields", function(e) {
	  e.preventDefault();
	  $(this).closest(".attr-fieldset").remove();
	});

});