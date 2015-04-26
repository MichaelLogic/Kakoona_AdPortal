var do_on_load = $(function() {
  $('#s3-uploader').S3Uploader(
    {
      remove_completed_progress_bar: false,
      progress_bar_target: $('#uploads_container'),
      before_add: function(file) {
        if (file.size > 40485760) {
          alert('Maximum file size is 40 MB');
          return false;
        } else {
          return true;
        }
      }
    }
  );

  // error handling
  $('#s3-uploader').bind('s3_upload_failed', function(e, content) {
    return alert(content.filename + ' failed to upload.');
  });

  $('#s3_uploader').bind('s3_upload_complete', function(e, content) {
    //insert any post progress bar complete stuff here.
  $('#merch_representative_avatar_grffk_attributes_direct_upload_url').val(content.url);
  $('#merch_representative_avatar_grffk_attributes_upload_file_name').val(content.filename);
  $('#merch_representative_avatar_grffk_attributes_attached_file_file_path').val(content.filepath);
  $('#merch_representative_avatar_grffk_attributes_upload_file_size').val(content.filesize);
  $('#merch_representative_avatar_grffk_attributes_upload_content_type').val(content.filetype);
  });

});


$(document).ready(do_on_load);
$(window).bind('page:change', do_on_load);