ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "view_component/test_helpers"
require "action_controller/test_case"