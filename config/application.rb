require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Appfeed
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja
    config.action_view.sanitized_allowed_tags = %w(h1 h2 h3 h4 h5 strong em a p div pre span)
    config.action_view.sanitized_allowed_attributes = %w(class id src href style) 
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.generators do |g|
      g.test_framework  :rspec
      g.stylesheets     false
      g.javascripts     false
      g.helper          false
      g.channel         assets: false
      g.factory_bot     dir: 'spec/factories'
    end

  end
end
