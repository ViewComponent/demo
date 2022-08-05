require_relative "boot"

require "rails/all"
Bundler.require(*Rails.groups)

module Demo
  class Application < Rails::Application
  end
end
