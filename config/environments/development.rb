KakoonaAdportal::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  #Catch Asset Runtime Errors
  config.assets.raise_runtime_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = false

  # Generate digests for assets URLs.
  config.assets.digest = true

  config.serve_static_assets = true

  config.static_cache_control = "public, max-age=31536000"

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Version of your assets, change this if you want to expire all your assets.
  config.assets.version = '1.0'


end
