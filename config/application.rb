require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
# require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module FitHubBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    ENV['SECRET_KEY'] = '123'
    config.load_defaults 6.1

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'  # adjust this if you want to limit origins
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end
  end
end
