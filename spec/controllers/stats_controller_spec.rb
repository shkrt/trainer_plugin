require "spec_helper"
require "json_matchers/rspec"

module TrainerPlugin
  describe StatsController, type: :controller do
    routes { TrainerPlugin::Engine.routes }
    let!(:user) { FactoryGirl.create(:user_with_events) }

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
