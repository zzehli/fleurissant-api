# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  respond_to :json
  # skip_before_action only: [ :new ]
  def new
    head :not_found
  end
  # private
  # def respond_with(resource, _opts = {})
  #   if resource.errors.empty?
  #     render json: resource
  #   end
  # end

  # def respond_to_on_destroy
  #   head :no_content
  # end
end
