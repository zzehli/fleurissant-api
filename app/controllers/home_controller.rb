class HomeController < ApplicationController
  def index
    @latest_products = Product.take(8)
    render json: @latest_products
  end
end
