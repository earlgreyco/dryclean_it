require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Sarmander
  class Application < Rails::Application
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.filepicker_rails.api_key = "AqAh7fx0zSWOgcyu8QutCz"
    config.filepicker_rails.secret_key = "ABB4L6N2MJF4TIXJA3UY5O4NHA"
  end
end