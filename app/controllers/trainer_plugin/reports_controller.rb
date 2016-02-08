module TrainerPlugin
  class ReportsController < ApplicationController
    def main
      @users = TrainerPlugin.config.user_class.constantize.all
      @user_key = "#{TrainerPlugin.config.user_class.downcase}_id".to_sym
    end
  end
end
