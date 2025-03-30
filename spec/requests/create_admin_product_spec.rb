require 'rails_helper'

RSpec.describe "POST /admin/products", type: :request do
  let(:valid_params) do
    {
        name: "Test Product",
        description: "This is a test product",
        price: 100.0
    }
  end

  let(:invalid_params) do
    {
      product: {
        name: "",
        description: "",
        price: nil,
        active: nil
      }
    }
  end

  let(:admin) { create(:admin) }

  context 'create admin product' do
    before do
        login_user(admin)
    end

    it 'creates a valid new product and returns a 201 status' do
        test_image = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.avif'), 'image/avif')
        headers = {
            Authorization: response.headers['Authorization'],
            "ACCEPT" => "application/json"
        }
        params = {
            product: valid_params.merge(image: test_image)
        }
        post "/admin/products", headers: headers, params: params

      expect(response.status).to eq(201)
      json = JSON.parse(response.body)

      expect(json['name']).to eq(valid_params[:name])
    end


    it 'does not create a product and returns a 422 status' do
      expect {
        post "/admin/products",
        headers: {
          Authorization: response.headers['Authorization'],
          "ACCEPT" => "application/json"
      },
        params: invalid_params
      }.not_to change(Product, :count)

      expect(response.status).to eq(422)
    end
  end
end
