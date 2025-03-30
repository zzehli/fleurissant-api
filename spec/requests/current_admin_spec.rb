require 'rails_helper'

RSpec.describe "CurrentAdmins", type: :request do
  describe "GET /index" do
    let(:admin) { create(:admin) }

    before do
      login_user(admin)
      # puts JSON.parse(response.body)
      get "/current_admin/", headers: {
        Authorization: response.headers['Authorization']
      }
    end

    it 'returns a 200 OK status' do
      expect(response.status).to eq(200)
    end

    it 'returns the current admin' do
      json = JSON.parse(response.body)
      expect(json['email']).to eq(admin.email)
    end

    after do |example|
      if example.exception
        Rails.logger.error "Response body: #{response.body}"
      end
    end
  end
end
