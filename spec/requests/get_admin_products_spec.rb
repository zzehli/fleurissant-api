require 'rails_helper'

RSpec.describe "GET /admin/products", type: :request do
  # Create 10 products
  let!(:products) { create_list(:product, 10) }
  let(:admin) { create(:admin) }


  context 'with valid parameters' do
    before do
      login_user(admin)
      puts JSON.parse(response.body)
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
end