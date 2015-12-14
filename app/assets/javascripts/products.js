/*
$("#product-detail-wrap").on("click", ".btn-remove-fields", function(e) {
e.preventDefault();
$(this).closest(".attr-fieldset").remove();
});
*/

var features = [];
var feature_vals = [];
var value_count = 0;
var value_inc = 0;
var SKUs = [];
var variation_count = 1;

function countFeatureValues(valArr){
  for(t=0; t<valArr.length; t++){
    var splitVals = valArr[t].split(",");
    value_count += splitVals.length;
  }
}

function makeValueRegExp(valArr){
  $('.feature_value_regex').each(function(idx,val){
      var splitVals = valArr[idx].split(",");
      
      for(t=0; t<splitVals.length; t++){
        (function(cl_t,cl_this){
          window.setTimeout(function(){
            time = new Date().getTime();
            regexp = new RegExp($(cl_this).data('id'), 'g');
            valExp = new RegExp($(cl_this).data('spanval'), 'g');
            $(cl_this).data('fields').replace(valExp, splitVals[cl_t]);
            //$(cl_this).before($(cl_this).data('fields').replace(regexp, time));
            $(cl_this).closest('.valList').append($(cl_this).data('fields').replace(regexp, time).replace(valExp, splitVals[cl_t]));
            //$(cl_this).before($(cl_this).data('fields').replace(regexp, time).replace(valExp, splitVals[cl_t]));
            console.log(regexp);
            console.log(valExp);
            console.log(splitVals[cl_t])
            console.log($(cl_this).data('fields'));
            
          }, cl_t * 20);
        }(t,this));
      }

  }); 

}

function makeSKUs(featureArr, valArr){
  var skuStrings = [];
  var skuString = "";
  var featCountOrder = [];
  variation_count = 1;
  var singleFeatureValueCnt = [];
  for(t=0; t<featureArr.length; t++){
    var singleFeatureValues = valArr[t].split(",");
    featCountOrder.push(singleFeatureValues.length);
    singleFeatureValueCnt.push(0);
    variation_count = variation_count * singleFeatureValues.length;
  }
  alert("Creating " + variation_count + " variations.");
  //console.log(featCountOrder);
  //console.log(singleFeatureValueCnt);
  
  var varCnt = 0;
  while(varCnt < variation_count){
    for(t=0; t<featCountOrder.length; t++){
       
        var singleFeatureValues = valArr[t].split(",");
        if(singleFeatureValueCnt[t]==featCountOrder[t]){
          singleFeatureValueCnt[t] = 0;
        }
    
        skuString = skuString + singleFeatureValues[singleFeatureValueCnt[t]] + '-';
        singleFeatureValueCnt[t]++;
    }
    skuString= skuString.slice(0, -1);
    console.log(skuString);
    skuStrings.push(skuString);
    varCnt++;
    skuString = "";
  }


}

$('.remove_fields').on('click', function(e){
   e.preventDefault();
   $(this).prev('input[type=hidden]').val('1');
   $(this).closest('dyno-fields').hide();
});

$('.add_fields').on('click', function(e){
   e.preventDefault();
   time = new Date().getTime();
   regexp = new RegExp($(this).data('id'), 'g');
   $(this).before($(this).data('fields').replace(regexp, time));
});


$('.generate_sku').on('click', function(e){
   e.preventDefault();

   //Gather Features and Values
   features = $('.feature_name').map( function(){return $(this).val(); }).get();
   feature_vals = $('.csv_values').map( function(){return $(this).val(); }).get();
   console.log(features);
   console.log(feature_vals);
   countFeatureValues(feature_vals);
   makeValueRegExp(feature_vals);
   makeSKUs(features,feature_vals);


  for(t=0; t<variation_count; t++){
    (function(cl_t,cl_this){
      window.setTimeout(function(){
        time = new Date().getTime();
        regexp = new RegExp($(cl_this).data('id'), 'g');
        $("#config-sku-variants").append($(cl_this).data('fields').replace(regexp, time));
        console.log(regexp);
        console.log(valExp);
        console.log($(cl_this).data('fields'));
        
      }, cl_t * 20);
    }(t,this));
  }
   
});



$('.attributeContainer').delegate('.removeRow', 'click', function(e){
	 e.preventDefault();
	 test_item = $(this);
	 btn_num = $( '.removeRow' ).index( test_item )
	 if(btn_num != 0){
   	console.log($(this).closest('.row'))
   	$(this).closest('.row').remove();
   }

});

$('.addAttribute').on('click', function(e){
	 e.preventDefault();
   contents = "<div class='row display-table bottom10 row-no-padding attr-fieldset'>" + $('.attributeTemplate').html() + '</div>';
   $("#product-detail-wrap").append(contents); //add attribute field set
});

$('#ad_campaign_product_attributes_product_type').change(function(){
  var productType = $(this).val();
  var action_url;
  if(productType == 'simple'){
    $('.digital-asset-fields').addClass("hidden");
    $('.config-asset-fields').addClass("hidden");
    $('.config-generate').addClass("hidden");
    //action_url = '/go_simple';
  }else if(productType == 'digital'){
    //action_url = '/go_digital';
    $('.config-asset-fields').addClass("hidden");
    $('.config-generate').addClass("hidden");
    $('.digital-asset-fields').removeClass("hidden");
    //$('.digital-asset-fields').slideDown("slow");
    //$('.digital-asset-fields').show();
    console.log(productType);
  }else{
    $('.digital-asset-fields').addClass("hidden");
    $('.config-asset-fields').removeClass("hidden");
    $('.config-generate').removeClass("hidden");
    //action_url = '/go_configurable';
  }
  
  /*
  $.get(action_url, function( data ) {
      $.each(data, function(key, value) {
        var field = $("#" + key);
        alert("Product Type:  " + productType + ", " + field);
      });
  });
  */
  
});