require "simplecov"
SimpleCov.start

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "capybara/rspec"

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.use_transactional_fixtures = true
end

# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

def render_component(component, **args, &block)
  controller = ApplicationController.new
  controller.request = ActionDispatch::TestRequest.create
  Nokogiri::HTML(component.call(controller.view_context, args, &block))
end
