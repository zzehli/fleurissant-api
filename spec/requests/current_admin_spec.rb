require 'rails_helper'

RSpec.describe "CurrentAdmins", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/current_admin/index"
      expect(response).to have_http_status(:success)
    end
  end

end
