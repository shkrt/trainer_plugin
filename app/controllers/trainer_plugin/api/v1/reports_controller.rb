module TrainerPlugin::Api::V1
  class ReportsController < ApplicationController
    def main
      @users = User.all
    end
  end
end
