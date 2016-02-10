module TrainerPlugin
  class ApplicationController < ActionController::Base
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    before_filter :set_user_class, :authenticate
    layout "trainer_plugin/application"

    private

    def set_user_class
      @user_class = TrainerPlugin.config.user_class.constantize
    end

    def authenticate
      redirect_to main_app.root_path unless current_user
    end
  end
end
