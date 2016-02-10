require "rubygems"
require "jquery-rails"
require "ahoy_matey"
module TrainerPlugin
  class Engine < ::Rails::Engine
    isolate_namespace TrainerPlugin

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    config.to_prepare do
      if TrainerPlugin.config
        TrainerPlugin.config.user_class.constantize.class_eval do
          has_many :ahoy_events, class_name: "Ahoy::Event"
        end
      end
    end
  end
end
