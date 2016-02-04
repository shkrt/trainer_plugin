module TrainerPlugin
  class ReportsController < ApplicationController
    def main
      @users = User.all
    end
  end
end
