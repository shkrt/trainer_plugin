class BindingGenerator < Rails::Generators::Base
  def create_initializer_file
    create_file "config/initializers/trainer_plugin.rb"
  end
end
