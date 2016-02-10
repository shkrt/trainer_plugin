module TrainerPlugin
  class ApplicationController < ActionController::Base
    # attr_reader :current_user
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    before_filter :set_user_class
    before_action :authenticate_basic
    layout "trainer_plugin/application"

    private

    def set_user_class
      @user_class = TrainerPlugin.config.user_class.constantize
    end

    def authenticate_basic
      logger.info("####DEBUG####")
      logger.info(current_user)
      # authenticate_with_http_basic do |email, _passwd|
      #   if current_user
      #     @current_user = user
      #   else
      #     render json: { message: "Authentication failed" }, status: 401
      #   end
      # end
    end
  end
end
