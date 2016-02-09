module TrainerPlugin
  class ApplicationController < ActionController::Base
    layout "trainer_plugin/application"
    before_filter :set_user_class

    private

    def set_user_class
      @user_class = TrainerPlugin.config.user_class.constantize
    end
  end
end
