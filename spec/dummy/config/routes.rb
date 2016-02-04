Rails.application.routes.draw do
  get "test/index"
  get "test/page"

  mount TrainerPlugin::Engine => "/stats"
end
