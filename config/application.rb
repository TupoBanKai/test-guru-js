require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load


module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 4.0.0
    config.time_zone = 'Moscow'
    config.i18n.default_locale = :ru
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.autoload_paths << "#{Rails.root}/lib/clients"
    config.action_mailer.delivery_method = :letter_opener
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.default_url_options = { host: 'localhost:3000' }
    config.action_mailer.smtp_settings = {
    :address        => 'smtp.gmail.com',
    :domain         => 'mail.google.com',
    :port           => 587,
    :user_name      => ENV['GMAIL'],
    :password       => ENV['APP_PASSWD'],
    :authentication => :plain,
    :enable_starttls_auto => true
}
  end
end
