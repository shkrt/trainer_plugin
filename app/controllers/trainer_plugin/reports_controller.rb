module TrainerPlugin
  class ReportsController < ApplicationController
    def main
      usr_class = TrainerPlugin.config.user_class.constantize
      @users = usr_class.all
      @user_key = "#{usr_class.downcase}_id".to_sym
    end
  end
end
