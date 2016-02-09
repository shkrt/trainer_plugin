require "spec_helper"
require "json_matchers/rspec"

module TrainerPlugin::Api
  describe StatsController, type: :controller do
    routes { TrainerPlugin::Engine.routes }
    let!(:user) { create(:user_with_events) }

    before do
      TrainerPlugin.configure do |config|
        config.user_class = "User"
      end
    end

    describe "GET stats#activity_summary" do
      it "has a 200 status code" do
        get :activity_summary
        expect(response.status).to eq(200)
      end

      it "responds to ajax get by default" do
        get :activity_summary
        expect(response.content_type).to eq "application/json"
      end

      it "response matches json schema" do
        get :activity_summary
        expect(response).to match_response_schema("summary")
      end
    end

    describe "GET stats#clicks_summary" do
      it "has a 200 status code" do
        get :clicks_summary
        expect(response.status).to eq(200)
      end

      it "responds to ajax get by default" do
        get :clicks_summary
        expect(response.content_type).to eq "application/json"
      end

      it "response matches json schema" do
        get :clicks_summary
        expect(response).to match_response_schema("summary")
      end
    end

    describe "POST stats#user_clicks" do
      it "has a 200 status code" do
        post :user_clicks, user_id: user.id
        expect(response.status).to eq(200)
      end

      it "responds to ajax post by default" do
        post :user_clicks, user_id: user.id
        expect(response.content_type).to eq "application/json"
      end

      it "response matches json schema" do
        post :user_stats, user_id: user.id
        expect(response).to match_response_schema("user_stats")
      end
    end

    describe "POST stats#user_stats" do
      it "has a 200 status code" do
        post :user_stats, user_id: user.id
        expect(response.status).to eq(200)
      end

      it "responds to ajax post by default" do
        post :user_stats, user_id: user.id
        expect(response.content_type).to eq "application/json"
      end

      it "response matches json schema" do
        post :user_stats, user_id: user.id
        expect(response).to match_response_schema("user_stats")
      end
    end
  end
end
