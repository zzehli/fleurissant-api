require 'rails_helper'

RSpec.describe "GET /", type: :request do
  before do
    # Create 10 products
    create_list(:product, 10)
  end

  context 'GET /' do
    before { get '/' }

    it 'returns a 200 OK status' do
      expect(response.status).to eq(200)
    end

    it 'returns the latest 8 products' do
      json = JSON.parse(response.body)
      expect(json.size).to eq(8)
    end
  end
end