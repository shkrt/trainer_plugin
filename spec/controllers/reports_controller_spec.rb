require "spec_helper"

module TrainerPlugin::Api
  describe ReportsController, type: :controller do
    routes { TrainerPlugin::Engine.routes }
    let!(:user) { FactoryGirl.create(:user) }

    before do
      TrainerPlugin.configure do |config|
        config.user_class = "User"
      end
    end

    describe "GET reports#main" do
      it "has a 200 status code" do
        get :main
        expect(response.status).to eq(200)
      end

      it "responds to html get by default" do
        get :main
        expect(response.content_type).to eq "text/html"
      end
    end
  end
end
