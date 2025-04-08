# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  respond_to :json
  private
  def respond_with(resource, _opts = {})
    if request.method == "POST" && resource.persisted?
      render json: {
        status: { code: 200, message: "Logged in successfully." },
        data: AdminSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      render json: {
        status: { code: 422, message: "Admin user couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end

  def respond_to_on_destroy
      if current_admin
      Rails.logger.debug "Current admin: #{current_admin.inspect}"
      render json: {
        status: 200,
        message: "logged out successfully"
      }, status: :ok
      else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
      end
  end
end
