require 'rails_helper'

RSpec.describe "POST /admin/signup/", type: :request do
  context 'with valid parameters' do
    let(:admin) { build(:admin) }

    before do
      post "/admin/signup", params: {
        "admin": {
            "email": admin.email,
            "password": admin.password,
        }
      }
    end

    it 'returns a 200 OK status' do
      expect(response.status).to eq(200)
    end

    it 'returns the account email' do
      json = JSON.parse(response.body)
      expect(json['data']['email']).to eq(admin.email)
    end
  end
end
