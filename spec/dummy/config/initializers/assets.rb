# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( trainer_plugin/a.js
                                                  trainer_plugin/bootstrap.css
                                                  trainer_plugin/d3.js
                                                  trainer_plugin/graph.js
                                                  trainer_plugin/overall.js
                                                  trainer_plugin/single.js
                                                  trainer_plugin/graph.css)
