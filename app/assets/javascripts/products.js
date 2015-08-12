$(function () {
	/*
	$("#product-detail-wrap").on("click", ".btn-remove-fields", function(e) {
	  e.preventDefault();
	  $(this).closest(".attr-fieldset").remove();
	});
	*/


	$('.attributeContainer').delegate('.dynamicAttributeName', 'keyup', function(event){
     nameElem  = $(this);
     valueElem = nameElem.closest('.row').children('p').children('.text_field')
     value     = nameElem.val().toLowerCase();
     valueElem.attr('id',          'product_data_' + value       );
     valueElem.attr('name',        'product[data][' + value + ']');
     valueElem.attr('placeholder', 'value for ' + value          );
   })
	
   $('.attributeContainer').delegate('.removeRow', 'click', function(e){
   	 e.preventDefault();
   	 test_item = $(this);
   	 btn_num = $( '.removeRow' ).index( test_item )
   	 if(btn_num != 0){
	 	console.log($(this).closest('.row'))
	 	$(this).closest('.row').remove();
	 }

   })

   $('.addAttribute').on('click', function(e){
   	 e.preventDefault();
     contents = "<div class='row display-table bottom10 row-no-padding attr-fieldset'>" + $('.attributeTemplate').html() + '</div>';
     $("#product-detail-wrap").append(contents); //add attribute field set
   })

});