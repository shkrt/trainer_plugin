require "rails/generators/migration"
class SettingsGenerator < Rails::Generators::NamedBase
  include Rails::Generators::Migration
  source_root File.expand_path("../templates", __FILE__)
  argument :user, :type => :string, :default => "User"

  def self.next_migration_number(dirname)
    next_migration_number = current_migration_number(dirname) + 1
    if ::ActiveRecord::Base.timestamped_migrations
      [Time.now.utc.strftime("%Y%m%d%H%M%S"), "%.14d" % next_migration_number].max
    else
      "%.3d" % next_migration_number
    end
  end

  def copy_initializer_file
    copy_file "initializer.rb", "config/initializers/#{file_name}.rb"
  end

  def copy_ahoy_initializer
    copy_file "ahoy_initializer.rb", "config/initializers/ahoy.rb"
  end

  def copy_visit_model
    template "active_record_visit_model.rb", "app/models/visit.rb"
  end

  def copy_event_model
    template "active_record_event_model.rb", "app/models/ahoy/event.rb"
  end

  def insert_routes
    inject_into_file "config/routes.rb",
      "  mount TrainerPlugin::Engine => '/stats'\n",
      before: /^end/
  end

  def generate_visits_migration
    migration_template "active_record_visits_migration.rb",
      "db/migrate/create_visits.rb"
  end

  def generate_events_migration
    migration_template "active_record_events_migration.rb",
      "db/migrate/create_events.rb"
  end

  def user_class
    ":#{user.downcase}_id"
  end

  def user_short
    ":#{user.downcase}"
  end

  def insert_js
    file = "app/assets/javascripts/application.js"
    if File.exist?(file)
      append_to_file file, "//=require ahoy\nahoy.trackView();"
    else
      logger.info("#{file} was not found")
    end
  end

  def insert_include
    file = "app/controllers/application_controller.rb"
    if File.exist?(file)
      inject_into_file file, "include TrainerPlugin\n",
        after: /^class ApplicationController.*\n/
    else
      logger.info("#{file} was not found")
    end
  end

  def configure_app
    application "config.cache_store = :redis_store, 'redis://localhost:6379/0/cache'"
    application "config.active_job.queue_adapter = :sidekiq"
  end
end
