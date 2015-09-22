$(function() {
  if ($('.direct-upload').length > 0) {
    $.get( "/pspost", function( s3params ) {

      $('.direct-upload').find("input:file").each(function(i, elem) {
        var fileInput    = $(elem);
        var uploadWrap = $(fileInput.parents('fieldset:first'));
        var prevu = uploadWrap.find('label');
        var form         = $(fileInput.parents('form:first'));
        var submitButton = form.find('input[type="submit"]');
        var progressBar  = $("<div class='meter'></div>");
        var barContainer = $("<div class='progress-bar'></div>").append(progressBar);
        fileInput.after(barContainer);
        var location = "upload-loc";
        var key;

        fileInput.fileupload({
          fileInput:       fileInput,
          url:             "https://" + s3params.url.host,
          type:            'POST',
          autoUpload:       true,
          formData:         s3params.fields,
          paramName:        'file', // S3 does not like nested name fields i.e. name="user[avatar_url]"
          dataType:         'XML',  // S3 returns XML if success_action_status is set to 201
          replaceFileInput: false,
          progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            progressBar.css('width', progress + '%');
          },
          start: function (e) {
            barContainer.slideDown("normal");
            submitButton.prop('disabled', true);
            barContainer.css('display', 'block');
            progressBar.
              css('display', 'block').
              css('width', '0%');

            //get File Input ID for loading alert
            field_id = fileInput.attr('id');
            if(field_id == "ad_campaign_kakoona_video_attributes_movie"){
              $("#vid-upload-icon").removeClass('glyphicon-upload');
              $("#vid-upload-icon").addClass('glyphicon-refresh glyphicon-spin');
              $("#vid-upload-notice").html("Uploading ...");
            }

          },
          done: function(e, data) {
            submitButton.prop('disabled', false);

            progressBar.addClass('done');

            // extract key and generate URL from response
            location   = $(data.jqXHR.responseXML).find("Location").text();
            key   = $(data.jqXHR.responseXML).find("Key").text();
            var fileNameIndex = key.lastIndexOf("/") + 1;
            var filename = key.substr(fileNameIndex);
            var input;

            //populate hidden file fields for grffks
            field_id = fileInput.attr('id');

            if(field_id == "merch_representative_avatar_grffk_attributes_grffk")
            {
              $("#merch_representative_avatar_grffk_attributes_cloud_asset_url").val(location);
              $("#avatar_prevu").attr('src', location);
              barContainer.slideUp("normal");
              //Delete file from Input Field
              input = $("#merch_representative_avatar_grffk_attributes_grffk");
              input.replaceWith(input.val('').clone(true));

            }else if(field_id == "ad_campaign_campaign_brand_grffk_attributes_grffk"){
              $("#ad_campaign_campaign_brand_grffk_attributes_cloud_asset_url").val(location);
              $("#brand_prevu").attr('src', location);
              barContainer.slideUp("normal");
              //Delete file from Input Field
              input = $("#ad_campaign_campaign_brand_grffk_attributes_grffk");
              input.replaceWith(input.val('').clone(true));

            }else if(field_id == "ad_campaign_kakoona_video_attributes_movie"){
              $("#ad_campaign_kakoona_video_attributes_cloud_asset_url").val(location);
              $("#vid-upload-icon").removeClass('glyphicon-refresh');
              $("#vid-upload-icon").removeClass('glyphicon-spin');
              $("#vid-upload-icon").addClass('glyphicon-film');
              $("#vid-upload-notice").html("Upload Complete :: Ready for Transcoding");
              barContainer.slideUp("normal");
              //Delete file from Input Field
              input = $("#ad_campaign_kakoona_video_attributes_movie");
              input.replaceWith(input.val('').clone(true));

            }else if(field_id == "ad_campaign_product_attributes_grffk"){
              $("#ad_campaign_product_attributes_cloud_asset_url").val(location);
              prevu.html('<img alt="Kakoona Video" class="img-responsive center-block" id="video_prevu" src="' + location + '" title="video preview">')
              barContainer.slideUp("normal");
              //Delete file from Input Field
              input = $("#ad_campaign_campaign_brand_grffk_attributes_grffk");
              input.replaceWith(input.val('').clone(true));
            }

          },
          fail: function(e, data) {
            submitButton.prop('disabled', false);

            progressBar.
              addClass('failed').
              text("Failed");
          }
        });
      });
    }, 'json');
  }
});


