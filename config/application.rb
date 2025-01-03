require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Draft1
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.assets.precompile += %w( application.tailwind.css )
    config.assets.css_compressor = nil

    # Please, add to the `config/application.rb` if you require timezone-aware attributes.
    config.active_record.default_timezone = :utc
    
    # Configuration for the application, engines, and railties goes here.
    config.autoloader = :zeitwerk

    config.assets.enabled = true
    config.assets.paths << Rails.root.join("app", "assets", "stylesheets")
    config.assets.compile = true
  end
end
