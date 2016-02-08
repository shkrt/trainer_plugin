class SettingsGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../templates", __FILE__)

  def copy_initializer_file
    copy_file "initializer.rb", "config/initializers/#{file_name}.rb"
  end

  def insert_routes
    inject_into_file "config/routes.rb",
      "  mount TrainerPlugin::Engine => '/stats'\n",
      before: /^end/
  end
end
