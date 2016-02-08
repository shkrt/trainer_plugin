$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "trainer_plugin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "trainer_plugin"
  s.version     = TrainerPlugin::VERSION
  s.authors     = ["Shkrt"]
  s.email       = ["test@te.st"]
  s.homepage    = "http://github.com/Shkrt/trainer_plugin"
  s.summary     = "TrainerPlugin."
  s.description = "TrainerPlugin."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails"
  s.add_dependency "ahoy_matey"
  s.add_dependency "sidekiq"
  s.add_dependency "jquery-rails"
  s.add_dependency "redis-rails"

  s.add_development_dependency "pg"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "json_matchers"
  s.add_development_dependency "poltergeist"
  s.add_development_dependency "database_cleaner"
end
