$(function () {
	/*
	$("#product-detail-wrap").on("click", ".btn-remove-fields", function(e) {
	  e.preventDefault();
	  $(this).closest(".attr-fieldset").remove();
	});
	*/


	$('.attributeContainer').delegate('.dynamicAttributeName', 'keyup', function(event){
     nameElem  = $(this);
     keyElem = nameElem.closest('.row').children('div:nth-child(1)').children('.text_field')
     key     = nameElem.val().toLowerCase();
     keyElem.attr('id',          'ad_campaign_product_attributes_config_vars_' + key       );
     keyElem.attr('name',        'ad_campaign[product_attributes][config_vars][' + key + ']');
     keyElem.attr('placeholder', 'New Attribute name');

     valueElem = nameElem.closest('.row').children('div:nth-child(2)').children('.text_field')
     valueElem.attr('id',          'ad_campaign_product_attributes_config_vars_' + key       );
     valueElem.attr('name',        'ad_campaign[product_attributes][config_vars][' + key + ']');
     valueElem.attr('placeholder', 'values(ex: s,m,l,xl)');
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