Rishi::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb
  ::SITE_DOMAIN = "rishighan.com"
  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # initialize ActiveMerchant
  config.after_initialize do
  ActiveMerchant::Billing::Base.mode = :production
  ::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(
    :login => "frishi_api1.me.com",
    :password => "H7ERQP7XUH8GFMXK",
    :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31A75xWIFboDNeaUd8lTteJeJcRweC"
  )
end

  #action mailer
  config.action_mailer.delivery_method = :test
  
  config.action_mailer.smtp_settings = {
    :address  => "smtp.gmail.com",
    :port     => 587,
    :domain   => "gmail.com",
    :authentication => "plain",
    :user_name => "rishi.ghan@gmail.com",
    :password => "number9ttr",
    :enable_starttls_auto => true
    
  }
  

  # Defaults to Rails.root.join("public/assets")
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Use a different logger for distributed setups
  # config.logger = SyslogLogger.new

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
   config.assets.precompile += ['vendor.js']

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
end
