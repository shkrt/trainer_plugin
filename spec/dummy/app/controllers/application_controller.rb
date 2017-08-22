# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include TrainerPlugin
  protect_from_forgery with: :exception
end
