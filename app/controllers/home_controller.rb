class HomeController < ApplicationController
  def index
    @latest_products = Product.take(8)
    render json: @latest_products.map { |product| product.as_json.merge(image_url: product.image_url) }
  end
end
