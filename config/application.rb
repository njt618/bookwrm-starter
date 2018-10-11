require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BookwrmStarter
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    app_folders = %w().map {|f| "app/#{f}"}
    root_folders = %w(lib)

    folders = (app_folders + root_folders).map {|f| "#{config.root}/#{f}/**/"}
    config.autoload_paths   += Dir["#{config.root}/app/models/**/", "#{config.root}/lib/**/"]
    config.eager_load_paths += Dir["#{config.root}/app/models/**/", "#{config.root}/lib/**/"]
    config.autoload_paths += Dir[*folders]

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end

    # Set Host
    config.action_mailer.default_url_options = { host: ENV['APPLICATION_ROOT_URL'] }
    config.after_initialize do
      Rails.application.routes.default_url_options[:host] = ENV['APPLICATION_ROOT_URL']
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
