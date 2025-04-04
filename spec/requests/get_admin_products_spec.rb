require 'rails_helper'

RSpec.describe "GET /admin/products", type: :request do
  # Create 10 products
  let!(:products) { create_list(:product, 10) }
  let(:admin) { create(:admin) }


  context 'with valid parameters' do
    before do
      login_user(admin)
      get "/admin/products", headers: {
        Authorization: response.headers['Authorization']
      }
    end

    it 'returns a 200 OK status' do
      expect(response.status).to eq(200)
    end

    it 'returns all 10 products' do
      json = JSON.parse(response.body)
      expect(json.size).to eq(10)
    end
  end

  context 'without login parameters' do
    before do
      get "/admin/products"
    end

    it 'returns a 401 OK status' do
      expect(response.status).to eq(401)
    end
  end
end
