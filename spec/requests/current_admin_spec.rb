require 'rails_helper'

RSpec.describe "CurrentAdmins", type: :request do
  describe "GET /index" do
    let(:admin) { create(:admin) }

    before do
      login_user(admin)
      puts JSON.parse(response.body)
      get "/current_admin/", headers: {
        Authorization: response.headers['Authorization']
      }
    end

    after do |example|
      if example.exception
        Rails.logger.error "Response body: #{response.body}"
      end
    end
  end
end
