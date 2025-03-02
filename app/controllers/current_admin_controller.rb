class CurrentAdminController < ApplicationController
  before_action :authenticate_admin!
  def index
    render json: AdminSerializer.new(current_admin).serializable_hash[:data][:attributes], status: :ok
  end
end
