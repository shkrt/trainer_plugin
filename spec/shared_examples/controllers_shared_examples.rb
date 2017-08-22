# frozen_string_literal: true

module TrainerPlugin
  RSpec.shared_context 'authenticated with html response' do
    it 'response has 200 status code' do
      expect(response.status).to eq(200)
    end

    it 'responds to html by default' do
      expect(response.content_type).to eq 'text/html'
    end
  end

  RSpec.shared_context 'authenticated with json response' do
    it 'response has 200 status code' do
      expect(response.status).to eq(200)
    end

    it 'responds to ajax get by default' do
      expect(response.content_type).to eq 'application/json'
    end
  end

  RSpec.shared_context 'not authenticated' do
    it 'response has status 401' do
      expect(response.status).to eq(401)
    end
  end
end
