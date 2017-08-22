# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'test#index'
  get 'test/index'
  get 'test/page'

  mount TrainerPlugin::Engine => '/stats'
end
