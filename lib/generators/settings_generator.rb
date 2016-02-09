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
end
