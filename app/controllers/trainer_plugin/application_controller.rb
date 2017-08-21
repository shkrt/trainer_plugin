# frozen_string_literal: true

module TrainerPlugin
  class ApplicationController < ActionController::Base
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    before_action :set_user_class, :authenticate
    layout 'trainer_plugin/application'

    private

    def set_user_class
      @user_class = TrainerPlugin.config.user_class.constantize
    end

    def authenticate
      return head 401 unless current_user
    end
  end
end
