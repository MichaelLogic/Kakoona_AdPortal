Paperclip::Storage::S3.class_eval do
  def flush_writes #:nodoc:
    @queued_for_write.each do |style, file|
    retries = 0
      begin
        log("saving #{path(style)}")
        acl = @s3_permissions[style] || @s3_permissions[:default]
        acl = acl.call(self, style) if acl.respond_to?(:call)
        write_options = {
          :content_type => file.content_type,
          :acl => acl
        }

        # add storage class for this style if defined
        storage_class = s3_storage_class(style)
        write_options.merge!(:storage_class => storage_class) if storage_class

        if @s3_server_side_encryption
          write_options[:server_side_encryption] = @s3_server_side_encryption
        end

        style_specific_options = styles[style]

        if style_specific_options
          merge_s3_headers( style_specific_options[:s3_headers], @s3_headers, @s3_metadata) if style_specific_options[:s3_headers]
          @s3_metadata.merge!(style_specific_options[:s3_metadata]) if style_specific_options[:s3_metadata]
        end

        write_options[:metadata] = @s3_metadata unless @s3_metadata.empty?
        write_options.merge!(@s3_headers)

        s3_object(style).write(file, write_options) unless style.to_s == "original" and @queued_for_write[:your_processed_style].present?
      rescue AWS::S3::Errors::NoSuchBucket
        create_bucket
        retry
      rescue AWS::S3::Errors::SlowDown
        retries += 1
        if retries <= 5
          sleep((2 ** retries) * 0.5)
          retry
        else
          raise
        end
      ensure
        file.rewind
      end
    end
    after_flush_writes # allows attachment to clean up temp files
    @queued_for_write = {}
  end
end