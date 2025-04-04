require 'rails_helper'

RSpec.describe "GET /products/:id", type: :request do
  context 'with valid parameters' do
    let!(:product1) { create(:product) }

    before do
      get "/products/#{product1.id}"
    end

    it 'returns a 200 OK status' do
      expect(response.status).to eq(200)
    end

    it 'returns the product' do
      json = JSON.parse(response.body)
      expect(json['name']).to eq(product1.name)
    end
  end
end
