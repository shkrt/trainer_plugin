require "spec_helper"
require "json_matchers/rspec"

module TrainerPlugin::Api
  describe StatsController, type: :controller do
    routes { TrainerPlugin::Engine.routes }


    before do
      TrainerPlugin.configure do |config|
        config.user_class = "User"
      end
    end

    context "non-authenticated access" do
      before { allow(controller).to receive(:current_user) { nil } }
      describe "GET stats#activity_summary" do
        before { get :activity_summary }
        it_behaves_like "not authenticated"
      end

      describe "GET stats#clicks_summary" do
        before { get :clicks_summary }
        it_behaves_like "not authenticated"
      end

      describe "POST stats#user_clicks" do
        before { post :user_clicks, user_id: 1 }
        it_behaves_like "not authenticated"
      end

      describe "POST stats#user_stats" do
        before { post :user_stats, user_id: 1 }
        it_behaves_like "not authenticated"
      end
    end

    context "authenticated access" do
      let!(:user) { create(:user_with_events) }
      before { allow(controller).to receive(:current_user) { user } }

      describe "GET stats#activity_summary" do
        before { get :activity_summary }
        it_behaves_like "authenticated with json response"

        it "response matches json schema" do
          get :activity_summary
          expect(response).to match_response_schema("summary")
        end
      end

      describe "GET stats#clicks_summary" do
        before { get :clicks_summary }
        it_behaves_like "authenticated with json response"

        it "response matches json schema" do
          get :clicks_summary
          expect(response).to match_response_schema("summary")
        end
      end

      describe "POST stats#user_clicks" do
        before { post :user_clicks, user_id: user.id }
        it_behaves_like "authenticated with json response"

        it "response matches json schema" do
          post :user_stats, user_id: user.id
          expect(response).to match_response_schema("user_stats")
        end
      end

      describe "POST stats#user_stats" do
        before { post :user_stats, user_id: user.id }
        it_behaves_like "authenticated with json response"

        it "response matches json schema" do
          post :user_stats, user_id: user.id
          expect(response).to match_response_schema("user_stats")
        end
      end
    end
  end
end
