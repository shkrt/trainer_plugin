# frozen_string_literal: true

require 'spec_helper'
require 'shared_examples/controllers_shared_examples'

module TrainerPlugin::Api
  describe ReportsController, type: :controller do
    routes { TrainerPlugin::Engine.routes }

    before do
      TrainerPlugin.configure do |config|
        config.user_class = 'User'
      end
    end

    context 'non-authenticated access' do
      before { allow(controller).to receive(:current_user) { nil } }
      describe 'GET reports#main' do
        before { get :main }
        it_behaves_like 'not authenticated'
      end
    end

    context 'authenticated access' do
      let!(:user) { create(:user) }
      before { allow(controller).to receive(:current_user) { user } }

      describe 'GET reports#main' do
        before { get :main }
        it_behaves_like 'authenticated with html response'
      end
    end
  end
end
