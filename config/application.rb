# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module RentFast
  class Application < Rails::Application
    config.load_defaults 7.0
    config.generators do |generate|
      generate.test_framework :rspec
      generate.orm :active_record, primary_key_type: :uuid
      generate.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
    config.api_only = true
  end
end
